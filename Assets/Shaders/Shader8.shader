Shader "Unlit/Shader8"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _AOTex("AO", 2D) = "white" {}
        _MetallicTex("Metallic (R)", 2D) = "white" {}
        _Smootness ("Smootness", 2D) = "white"{}
        
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _Occlusion("OclussionStrength", Range(0,1)) = 0.5
        
        _ExtrudeX("Extrude", Range(-1, 1)) = 1
        _ExtrudeY("Extrude", Range(-1, 1)) = 1
        _ExtrudeZ("Extrude", Range(-1, 5)) = 1
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard vertex:vert
        #pragma target 3.0
        
        sampler2D _MainTex;
        sampler2D _MetallicTex;
        sampler2D _NormalMap;
        sampler2D _AmbientOcclusion;
        sampler2D _Smootness;

        half _ExtrudeX;
        half _ExtrudeY;
        half _ExtrudeZ;

         struct appdata
        {
            float4 vertex: POSITION;
            float3 normal: NORMAL;
            float4 texcoord: TEXCOORD0;
        };

        void vert(inout appdata_full v)
        {
            v.vertex.x += v.vertex * _ExtrudeX; //Extrución en la geometria
            v.vertex.y += v.normal * _ExtrudeY; //Extrución en la normal
            v.vertex.z += v.texcoord * _ExtrudeZ; //Extrucion en las coordenadas uv   
        }

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_NormalMap;
        };
       
        half _Metallic;
        half _Occlusion;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
            o.Metallic = tex2D(_MetallicTex, IN.uv_MainTex) * _Metallic;
            o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap));
            o.Occlusion = tex2D(_AmbientOcclusion, IN.uv_MainTex) * _Occlusion;
            o.Smoothness = tex2D(_Smootness, IN.uv_MainTex);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
