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
    uint32_t colorIndex;
    uint8_t useVertexOut;
};

// This is your Argument Table entry
uniform PixelData pixelData;

// NOTE: Using SV_Target0 seems a bit against the spirit of No API where
// you can use any texture on the heap from any shader. But it's probably
// still useful for binding to your color targets. IDK, need to learn more
// and come back to this.
[shader("pixel")]
float4 main(RenderData in) : SV_Target0 {
    // NOTE: apparently you don't really want to do things this way in shaders
    // as conditionals are expensive. But it's fine for demonstration purposes.
    if ((bool)(pixelData.useVertexOut)) { 
        // load color from the vertex shader
        return float4(in.color, 1.0); 
    } else {
        // load color from the argument buffer given from the draw_indexed_call
        return float4(pixelData.colors[pixelData.colorIndex].color, 1.0); 
    }
}
