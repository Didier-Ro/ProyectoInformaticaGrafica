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
            //Valor con el que compara
            Ref 1
            //Compara el valor de referencia con el contenido
            Comp always
            //Cuando pasa la prueba del stencil la referencia pasa
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
