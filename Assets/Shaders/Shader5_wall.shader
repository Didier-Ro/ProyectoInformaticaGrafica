Shader "4toParc/StencilWall"
{   Properties
    {
        _MainTex("MainTex", 2D) = "white" {}
    }

        SubShader
        {
            Tags{ "Queue" = "Geometry" }
            
            Stencil
            {
                //Valor con el que compara
                Ref 1
                //Compara el contenido con la otra parte
                Comp equal
            }

            CGPROGRAM
            #pragma surface surf Lambert

            sampler2D _MainTex;
        
            struct Input
            {
                float2 uv_MainTex;
            };

            void surf(Input IN, inout SurfaceOutput o)
            {
                fixed4 a = tex2D(_MainTex, IN.uv_MainTex);
                o.Albedo = a.rgb;
            }
            ENDCG
        }
}