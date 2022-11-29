Shader "Individuales/ShaderInd3"
{
     Properties
    {
        _MainTex("Texture", 2D) = "white"{}
        _NormalMap("Normal", 2D) = "bump" {}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        sampler2D _Normal;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_NormalMap;
        };
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
            o.Normal = UnpackNormal(tex2D (_Normal, IN.uv_NormalMap));
        }
        ENDCG
    }
    FallBack "Diffuse"
}