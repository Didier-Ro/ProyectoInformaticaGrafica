Shader "Unlit/Shader10" 
{
    Properties
    {
      _MainTex("Texture", 2D) = "white" {}
      _Extrude("Extrude", Range(0,1)) = 1
      _BunnyColor("Bunny Color", Color) = (1,1,1,1)

    }
    SubShader
    { 
          ZWrite on
          CGPROGRAM
          #pragma surface surf Lambert vertex:vert
          sampler2D _MainTex;
          half _Extrude;
          float4 _FracColor;
          float4 _BunnyColor;
          struct Input 
          {
              float3 viewDir;
              float2 uv_MainTex;
              float3 worldPos;
          };
          struct appdata
          {
              float4 vertex : POSITION;
              float3 normal : NORMAL;
          };
          void vert(inout appdata_full v)
          {
              v.vertex.xyz += v.color * _Extrude * cos(_Time*5);
          }
          void surf(Input IN, inout SurfaceOutput o)
          {
              if (_Time.y>=1 )
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.9;
              }
              if (_Time.y>=3)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.5;
              }
              if (_Time.y>=6)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.1;
              }
              if (_Time.y>=9)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.5;
              }
              if (_Time.y>=12)
              {
                  _Time.y=0;
                  o.Emission= frac(IN.worldPos.x * 10)> 0.9;
              }
              if (_Time.y>=15)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.5;
              }
              if (_Time.y>=18)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.1;
              }
              if (_Time.y>=21)
              {

                  o.Emission= frac(IN.worldPos.x * 10)> 0.5;
              }
              if (_Time.y>=24)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.9;
              }
              if (_Time.y>=27)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.5;
              }
              if (_Time.y>=30)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.1;
              }
              if (_Time.y>=33)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.5;
              }
              if (_Time.y>=36)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.9;
              }
              if (_Time.y>=39)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.5;
              }
              if (_Time.y>=42)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.1;
              }
              if (_Time.y>=45)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.5;
              }
              if (_Time.y>=48)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.9;
              }
              if (_Time.y>=51)
              {
                  o.Emission= frac(IN.worldPos.x * 10)> 0.5;
              }
          }
        ENDCG
    }
}