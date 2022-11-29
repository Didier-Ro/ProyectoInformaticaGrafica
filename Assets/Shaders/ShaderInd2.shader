Shader "Individuales/ShaderInd2"
{
     Properties
    {
        _NormalMap("Normal", 2D) = "bump" {}
    }
    SubShader
    {

        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _NormalMap;

        struct Input
        {
            float2 uv_NormalMap;
        };
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo.rgb = 1 * UnpackNormal(tex2D (_NormalMap, IN.uv_NormalMap));
        }
        ENDCG
    }
    FallBack "Diffuse"
}
