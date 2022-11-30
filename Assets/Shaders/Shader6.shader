Shader "Unlit/Shader6" 
{
    Properties
    {
      _MainTex("Texture", 2D) = "white" {}
      _Color("Color", Color) = (0,0,0,1)
      _RimColor("RimColor", Color)=(1,1,1,1)
      _Outline("Range Color", Range(0,1)) = 0.05
    }
    SubShader
    { 
          ZWrite on
          CGPROGRAM
          #pragma surface surf Lambert vertex:vert
          sampler2D _MainTex;
          float4 _Color;
          float4 _RimColor;
          half _Outline;
          struct Input 
          {
              float3 viewDir;
              float2 uv_MainTex;
          };
          struct appdata
          {
              float4 vertex : POSITION;
              float3 normal : NORMAL;
          };
          void vert(inout appdata_full v)
          {
                
              v.vertex.x += v.normal * (_Outline*(_Time*1));
              v.vertex.y += v.normal * (_Outline*(_Time*1)); //Extruciones en la normal por el tiempo 
              v.vertex.z += v.normal * (_Outline*(_Time*1));
          }
          void surf(Input IN, inout SurfaceOutput o)
          {
              half rim=1-saturate(dot(normalize(IN.viewDir),o.Normal));
              o.Emission = _RimColor.rgb*pow(rim,_RimColor);
              o.Albedo=rim;
          }
        ENDCG
        
        ZWrite on
        CGPROGRAM
        #pragma surface surf Lambert alpha:fade
        sampler2D _MainTex;
        struct Input
        {
            float2 uv_MainTex;
        };
        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Alpha=0;
        }
        ENDCG
    }
}