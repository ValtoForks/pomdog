struct VS_OUTPUT {
    float4 Position     : SV_Position;
    float4 Color        : COLOR0;
    float2 TextureCoord : TEXCOORD0;
};

Texture2D<float4> Texture         : register(t0);
SamplerState      TextureSampler  : register(s0);

float4 SpriteBatchRendererPS(VS_OUTPUT input) : SV_Target
{
    float4 color = Texture.Sample(TextureSampler, input.TextureCoord.xy);
    return color * input.Color;
}
