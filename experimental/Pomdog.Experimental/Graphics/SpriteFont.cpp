// Copyright (c) 2013-2018 mogemimi. Distributed under the MIT license.

#include "SpriteFont.hpp"
#include "TrueTypeFont.hpp"
#include "SpriteBatchRenderer.hpp"
#include "Pomdog/Math/Color.hpp"
#include "Pomdog/Math/Matrix4x4.hpp"
#include "Pomdog/Math/Vector2.hpp"
#include "Pomdog/Math/Vector3.hpp"
#include "Pomdog/Math/Radian.hpp"
#include "Pomdog/Graphics/Texture2D.hpp"
#include "Pomdog/Utility/Assert.hpp"
#include <unordered_map>

#if defined(__clang__)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wshadow"
#endif
#include <utfcpp/source/utf8.h>
#if defined(__clang__)
#pragma clang diagnostic pop
#endif

namespace Pomdog {
namespace {

std::vector<std::uint8_t> ConvertTextureDataByteToByte4(const std::uint8_t* source, size_t size)
{
    std::vector<std::uint8_t> output;
    output.reserve(size * 4);

    for (size_t i = 0; i < size; ++i) {
        output.push_back(255);
        output.push_back(255);
        output.push_back(255);
        output.push_back(source[i]);
    }
    return output;
}

} // unnamed namespace

// MARK: - SpriteFont::Impl

class SpriteFont::Impl {
public:
    typedef Detail::SpriteFonts::Glyph Glyph;

    static constexpr int TextureWidth = 1024;
    static constexpr int TextureHeight = 1024;

    std::unordered_map<char32_t, Glyph> spriteFontMap;

    char32_t defaultCharacter;
    float lineSpacing;
    std::uint16_t spacing;

    Impl(
        std::vector<std::shared_ptr<Texture2D>> && textures,
        const std::vector<Detail::SpriteFonts::Glyph>& glyphs,
        char32_t defaultCharacter,
        std::int16_t spacing,
        std::int16_t lineSpacing);

    Impl(
        const std::shared_ptr<GraphicsDevice>& graphicsDevice,
        const std::shared_ptr<TrueTypeFont>& font,
        char32_t defaultCharacter,
        std::int16_t lineSpacing);

    Vector2 MeasureString(const std::string& text);

    void Draw(
        SpriteBatchRenderer & spriteBatch,
        const std::string& text,
        const Vector2& position,
        const Color& color);

    void Draw(
        SpriteBatchRenderer & spriteBatch,
        const std::string& text,
        const Vector2& position,
        const Color& color,
        const Radian<float>& rotation,
        //const Vector2& originPivot,
        const Vector2& scale);

    void PrepareFonts(const std::string& text);

private:
    std::vector<std::shared_ptr<Texture2D>> textures;
    std::shared_ptr<GraphicsDevice> graphicsDevice;
    std::shared_ptr<TrueTypeFont> font;
    std::vector<std::uint8_t> pixelData;
    Point2D currentPoint;
    int bottomY;
};
constexpr int SpriteFont::Impl::TextureWidth;
constexpr int SpriteFont::Impl::TextureHeight;

SpriteFont::Impl::Impl(
    std::vector<std::shared_ptr<Texture2D>> && texturesIn,
    const std::vector<Detail::SpriteFonts::Glyph>& glyphsIn,
    char32_t defaultCharacterIn,
    std::int16_t spacingIn,
    std::int16_t lineSpacingIn)
    : defaultCharacter(defaultCharacterIn)
    , lineSpacing(lineSpacingIn)
    , spacing(spacingIn)
    , textures(std::move(texturesIn))
{
    for (auto & glyph: glyphsIn) {
        spriteFontMap.emplace(glyph.Character, glyph);
    }
}

SpriteFont::Impl::Impl(
    const std::shared_ptr<GraphicsDevice>& graphicsDeviceIn,
    const std::shared_ptr<TrueTypeFont>& fontIn,
    char32_t defaultCharacterIn,
    std::int16_t lineSpacingIn)
    : defaultCharacter(defaultCharacterIn)
    , lineSpacing(lineSpacingIn)
    , spacing(0)
    , graphicsDevice(graphicsDeviceIn)
    , font(fontIn)
{
    POMDOG_ASSERT(font);

    pixelData.resize(TextureWidth * TextureHeight, 0);
    currentPoint = {1, 1};
    bottomY = 1;

    auto texture = std::make_shared<Texture2D>(graphicsDevice,
        TextureWidth, TextureHeight, false, SurfaceFormat::R8G8B8A8_UNorm);
    textures.push_back(texture);
}

void SpriteFont::Impl::PrepareFonts(const std::string& text)
{
    POMDOG_ASSERT(!text.empty());

    if (!graphicsDevice || !font) {
        return;
    }

    float fontSize = lineSpacing;

    bool needToFetchPixelData = false;

    auto fetchTextureData = [&] {
        if (needToFetchPixelData) {
            auto texture = textures.back();
            texture->SetData(ConvertTextureDataByteToByte4(pixelData.data(), pixelData.size()).data());
            needToFetchPixelData = false;
        }
    };

    auto textIter = std::begin(text);
    auto textIterEnd = std::end(text);

    while (textIter != textIterEnd) {
        const auto character = utf8::next(textIter, textIterEnd);

        if (spriteFontMap.find(character) != std::end(spriteFontMap)) {
            continue;
        }

        auto glyph = font->RasterizeGlyph(character, fontSize, TextureWidth,
        [&](int glyphWidth, int glyphHeight, Point2D & pointOut, std::uint8_t* & output) {
            if (currentPoint.X + glyphWidth + 1 >= TextureWidth) {
                // advance to next row
                currentPoint.Y = bottomY;
                currentPoint.X = 1;
            }
            if (currentPoint.Y + glyphHeight + 1 >= TextureHeight) {
                fetchTextureData();
                std::fill(std::begin(pixelData), std::end(pixelData), 0);

                auto textureNew = std::make_shared<Texture2D>(graphicsDevice,
                    TextureWidth, TextureHeight, false, SurfaceFormat::R8G8B8A8_UNorm);
                textures.push_back(textureNew);
                currentPoint = {1, 1};
                bottomY = 1;
            }

            POMDOG_ASSERT(currentPoint.X + glyphWidth < TextureWidth);
            POMDOG_ASSERT(currentPoint.Y + glyphHeight < TextureHeight);

            pointOut = currentPoint;
            output = pixelData.data();
        });

        if (!glyph) {
            continue;
        }

        currentPoint.X = currentPoint.X + glyph->Subrect.Width + 1;
        bottomY = std::max(bottomY, currentPoint.Y + glyph->Subrect.Height + 1);

        POMDOG_ASSERT(!textures.empty() && textures.size() > 0);
        glyph->TexturePage = textures.size() - 1;

        spriteFontMap.emplace(glyph->Character, *glyph);
        needToFetchPixelData = true;
    }

    fetchTextureData();
}

Vector2 SpriteFont::Impl::MeasureString(const std::string& text)
{
    POMDOG_ASSERT(!text.empty());

    Vector2 result = Vector2::Zero;
    Vector2 currentPosition = Vector2::Zero;

    auto textIter = std::begin(text);
    auto textIterEnd = std::end(text);

    while (textIter != textIterEnd)
    {
        const auto character = utf8::next(textIter, textIterEnd);

        if (character == U'\n') {
            currentPosition.X = 0;
            currentPosition.Y -= lineSpacing;
            continue;
        }

        auto iter = spriteFontMap.find(character);
        if (iter == std::end(spriteFontMap)) {
            PrepareFonts(text);
            iter = spriteFontMap.find(character);
            if (iter == std::end(spriteFontMap)) {
                iter = spriteFontMap.find(defaultCharacter);
                POMDOG_ASSERT(iter != std::end(spriteFontMap));
            }
        }

        POMDOG_ASSERT(iter != std::end(spriteFontMap));
        auto const & glyph = iter->second;

        currentPosition.X += (glyph.XAdvance - spacing);

        result.X = std::max(result.X, currentPosition.X);
        result.Y = std::max(result.Y, currentPosition.Y);
    }

    return result;
}

void SpriteFont::Impl::Draw(
    SpriteBatchRenderer & spriteBatch,
    const std::string& text,
    const Vector2& position,
    const Color& color)
{
    if (text.empty()) {
        return;
    }

    if (textures.empty()) {
        return;
    }

    Vector2 currentPosition = position;

    auto textIter = std::begin(text);
    auto textIterEnd = std::end(text);

    while (textIter != textIterEnd)
    {
        const auto character = utf8::next(textIter, textIterEnd);

        if (character == U'\n') {
            currentPosition.X = position.X;
            currentPosition.Y -= lineSpacing;
            continue;
        }

        auto iter = spriteFontMap.find(character);
        if (iter == std::end(spriteFontMap)) {
            iter = spriteFontMap.find(defaultCharacter);
            if (iter == std::end(spriteFontMap)) {
                continue;
            }
        }

        POMDOG_ASSERT(iter != std::end(spriteFontMap));
        auto const & glyph = iter->second;

        if (glyph.Subrect.Width > 0 && glyph.Subrect.Height > 0)
        {
            POMDOG_ASSERT(glyph.TexturePage >= 0);
            POMDOG_ASSERT(glyph.TexturePage < static_cast<int>(textures.size()));

            spriteBatch.Draw(textures[glyph.TexturePage],
                currentPosition + Vector2(glyph.XOffset, -glyph.YOffset),
                glyph.Subrect, color, 0.0f, Vector2{0.0f, 1.0f}, Vector2{1.0f, 1.0f});
        }

        currentPosition.X += (glyph.XAdvance - spacing);
    }
}

void SpriteFont::Impl::Draw(
    SpriteBatchRenderer & spriteBatch,
    const std::string& text,
    const Vector2& position,
    const Color& color,
    const Radian<float>& rotation,
    //const Vector2& originPivot,
    const Vector2& scale)
{
    if (text.empty()) {
        return;
    }

    if (textures.empty()) {
        return;
    }

    Vector2 currentPosition = position;

    auto textIter = std::begin(text);
    auto textIterEnd = std::end(text);

    while (textIter != textIterEnd)
    {
        const auto character = utf8::next(textIter, textIterEnd);

        if (character == U'\n') {
            currentPosition.X = position.X;
            currentPosition.Y -= lineSpacing * scale.Y;
            continue;
        }

        auto iter = spriteFontMap.find(character);
        if (iter == std::end(spriteFontMap)) {
            iter = spriteFontMap.find(defaultCharacter);
            if (iter == std::end(spriteFontMap)) {
                continue;
            }
        }

        POMDOG_ASSERT(iter != std::end(spriteFontMap));
        auto const & glyph = iter->second;

        if (glyph.Subrect.Width > 0 && glyph.Subrect.Height > 0)
        {
            POMDOG_ASSERT(glyph.TexturePage >= 0);
            POMDOG_ASSERT(glyph.TexturePage < static_cast<int>(textures.size()));

            spriteBatch.Draw(textures[glyph.TexturePage],
                currentPosition + Vector2(glyph.XOffset, -glyph.YOffset) * scale,
                glyph.Subrect, color, 0.0f, Vector2{0.0f, 1.0f}, scale);
        }

        currentPosition.X += ((glyph.XAdvance - spacing) * scale.X);
    }
}

// MARK: - SpriteFont

SpriteFont::SpriteFont(
    std::vector<std::shared_ptr<Texture2D>> && textures,
    const std::vector<Detail::SpriteFonts::Glyph>& glyphs,
    char32_t defaultCharacter,
    std::int16_t spacing,
    std::int16_t lineSpacing)
    : impl(std::make_unique<Impl>(std::move(textures), glyphs, defaultCharacter, spacing, lineSpacing))
{
}

SpriteFont::SpriteFont(
    const std::shared_ptr<GraphicsDevice>& graphicsDevice,
    const std::shared_ptr<TrueTypeFont>& font,
    char32_t defaultCharacter,
    std::int16_t lineSpacing)
    : impl(std::make_unique<Impl>(graphicsDevice, font, defaultCharacter, lineSpacing))
{
}

SpriteFont::~SpriteFont() = default;

Vector2 SpriteFont::MeasureString(const std::string& utf8String) const
{
    if (utf8String.empty()) {
        return Vector2::Zero;
    }
    return impl->MeasureString(utf8String);
}

char32_t SpriteFont::GetDefaultCharacter() const
{
    POMDOG_ASSERT(impl);
    return impl->defaultCharacter;
}

void SpriteFont::SetDefaultCharacter(char32_t character)
{
    POMDOG_ASSERT(impl);
    POMDOG_ASSERT(ContainsCharacter(character));
    impl->defaultCharacter = character;
}

float SpriteFont::GetLineSpacing() const
{
    POMDOG_ASSERT(impl);
    return impl->lineSpacing;
}

void SpriteFont::SetLineSpacing(float lineSpacingIn)
{
    POMDOG_ASSERT(impl);
    impl->lineSpacing = lineSpacingIn;
}

bool SpriteFont::ContainsCharacter(char32_t character) const
{
    POMDOG_ASSERT(impl);
    return impl->spriteFontMap.find(character) != std::end(impl->spriteFontMap);
}

void SpriteFont::Draw(
    SpriteBatchRenderer & spriteBatch,
    const std::string& text,
    const Vector2& position,
    const Color& color)
{
    if (text.empty()) {
        return;
    }

    impl->PrepareFonts(text);
    impl->Draw(spriteBatch, text, position, color);
}

void SpriteFont::Draw(
    SpriteBatchRenderer & spriteBatch,
    const std::string& text,
    const Vector2& position,
    const Color& color,
    const Radian<float>& rotation,
    //const Vector2& originPivot,
    float scale)
{
    this->Draw(spriteBatch, text, position, color,
        rotation, Vector2{scale, scale});
}

void SpriteFont::Draw(
    SpriteBatchRenderer & spriteBatch,
    const std::string& text,
    const Vector2& position,
    const Color& color,
    const Radian<float>& rotation,
    //const Vector2& originPivot,
    const Vector2& scale)
{
    if (text.empty()) {
        return;
    }

    impl->PrepareFonts(text);
    impl->Draw(spriteBatch, text, position, color,
        rotation, scale);
}

} // namespace Pomdog
