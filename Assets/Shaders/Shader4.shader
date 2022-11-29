Shader "Unlit/Shader4"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _Range("Range", Range(0, 100)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        CGPROGRAM
        #pragma surface surf Lambert vertex:vert

        float4 _Color;
        float _Amount;
        half _Range;
        
        struct Input
        {
            float2 uv_MainTex;
        };

        void vert(inout appdata_full v)
        {
            v.vertex.x += sin(_Time.x * _Range + v.vertex.y * 2) * .7;
        }
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color;
        }
        ENDCG
    }
}