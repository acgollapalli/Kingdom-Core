struct RenderData { // same as OutputVertex
    float4 position : SV_POSITION;
    float3 color : COLOR;
    //float4 color : COLOR;
}

struct Vertex2D {
    float2 position;
    float3 color;
}

struct VertexData {
    Ptr<Vertex2D, Access.Immutable> vertices;
}

uniform VertexData vertexData;

[shader("vertex")]
RenderData main(uint vertex_id: SV_VertexId) {
    RenderData out;
    out.position = float4(vertexData.vertices[vertex_id].position, 0.0, 1.0);
    out.color = vertexData.vertices[vertex_id].color;
    return out;
}
