struct VS_INPUT {
    // {xy__} = position.xy
    // {__zw} = texCoord.xy
    float4 PositionTextureCoord: SV_Position;

    // per Instance
    // {x___} = worldMatrix.M00
    // {_y__} = worldMatrix.M01
    // {__z_} = worldMatrix.M10
    // {___w} = worldMatrix.M11
    float4 TransformMatrix1: POSITION0;

    // {x___} = worldMatrix.M20
    // {_y__} = worldMatrix.M21
    // {__zw} = originPivot.xy
    float4 TransformMatrix2Origin: POSITION1;

    // {xy__} = xy
    // {__zw} = {width, height}
    float4 SourceRect: BINORMAL;

    // {xyzw} = color.rgba
    float4 Color: COLOR;

    // {xy__} = {1.0f / textureWidth, 1.0f / textureHeight}
    // {__zw} = unused
    float4 TextureSize : POSITION2;

    // per Instance
    uint InstanceID: SV_InstanceID;
};

struct VS_OUTPUT {
    float4 Position     : SV_Position;
    float4 Color        : COLOR0;
    float2 TextureCoord : TEXCOORD0;
};

cbuffer SpriteBatchConstants: register(b0) {
    matrix<float, 4, 4> ViewProjection;
};

VS_OUTPUT SpriteBatchRendererVS(VS_INPUT input)
{
    float2x2 scaling = float2x2(
        float2(input.SourceRect.z, 0.0),
        float2(0.0, input.SourceRect.w));

    float2 position = mul((input.PositionTextureCoord.xy - input.TransformMatrix2Origin.zw).xy, scaling);

    float3x2 worldMatrix = float3x2(
        float2(input.TransformMatrix1.xz),
        float2(input.TransformMatrix1.yw),
        float2(input.TransformMatrix2Origin.xy));

    position = mul(float3(position, 1.0), worldMatrix).xy;

    float2 inverseTextureSize = input.TextureSize.xy;

    VS_OUTPUT output = (VS_OUTPUT)0;
    output.Position = mul(float4(position.xy, 0.0, 1.0), ViewProjection);
    output.TextureCoord = (input.PositionTextureCoord.zw * input.SourceRect.zw + input.SourceRect.xy) * inverseTextureSize;
    output.Color = input.Color;

    return output;
}
