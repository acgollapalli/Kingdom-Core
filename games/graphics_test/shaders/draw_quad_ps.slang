struct RenderData { // same as OutputVertex
    float4 position : SV_POSITION;
    float3 color : COLOR;
}

struct PixelColor {
    float3 color;
    //float  _pad; // Matches Jai's #align 16
};

struct PixelData {
    Ptr<PixelColor, Access.Immutable> colors;
};

// This is your Argument Table entry
uniform PixelData pixelData;

// NOTE: Using SV_Target0 seems a bit against the spirit of No API where
// you can use any texture on the heap from any shader. But it's probably
// still useful for binding to your color targets. IDK, need to learn more
// and come back to this
[shader("pixel")]
float4 main(RenderData in) : SV_Target0 {
    return float4(in.color, 1.0);                    // load color from the vertex shader
    //return float4(pixelData.colors[3].color, 1.0); // load color from the argument buffer given from the draw_indexed_call
}
