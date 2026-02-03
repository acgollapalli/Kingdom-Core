struct RenderData { // same as OutputVertex
    float4 position : SV_POSITION;
    float3 color : COLOR;
}

struct Vertex {
    float2 position;
    float3 color;
}

struct VertexData {
    Ptr<Vertex, Access.Immutable> vertices;
}


[shader("vertex")]
RenderData main(uint vertex_id: SV_VertexId,
                uniform Ptr<Vertex, Access.Immutable> vertexData) {
    RenderData out;
    out.position = float4(vertexData[vertex_id].position, 0.0, 1.0);
    out.color = vertexData[vertex_id].color;
    return out;
}

struct PixelData {
    Ptr<float3, Access.Immutable> color;
}



// NOTE: Using SV_Target0 seems a bit against the spirit of No API where
// you can use any texture on the heap from any shader. But it's probably
// still useful for binding to your color targets. IDK, need to learn more
// and come back to this
[shader("pixel")]
float4 main(RenderData in,
            uniform Ptr<PixelData, Access.Immutable> pixel_data) : SV_Target0 {
    return float4(in.color, 1.0);
}
