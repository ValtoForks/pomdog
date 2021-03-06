// Copyright (c) 2013-2018 mogemimi. Distributed under the MIT license.

#pragma once

#include <Pomdog/Pomdog.hpp>

namespace Pomdog {

class ParticleClip;

namespace Detail {

struct ParticleLoader {
    static ParticleClip LoadFromJson(AssetManager & assets, std::string const& assetName);

    static ParticleClip Load(AssetManager & assets, std::string const& assetName);
};

} // namespace Detail
} // namespace Pomdog
