Shader "Unlit/Shader5"
{
    Properties
    {

    }
        SubShader
    {
        Tags { "Queue" = "Geometry" }
        ColorMask 0
        Zwrite off

        Stencil
        {
            Ref 1
            Comp always
            Pass replace
        }

        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            
        }
        ENDCG
    }
}
