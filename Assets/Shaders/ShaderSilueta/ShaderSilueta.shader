Shader "custom/shader3"
{
    Properties
    {
        _Albedo("Albedo",Color)=(1,1,1,1)
        [HDR] _RimColor("Rim Color",Color)=(1,1,1,1)
        _RimStrength("Rim Strength",Range(0.1, 8))=1.0
    }
    SubShader
    {
        
            CGPROGRAM
            #pragma surface surf BlinnPhong
            
            fixed4 _Albedo;
            fixed4 _RimColor;
            float _RimStrength;

            struct Input
            {
                float2 uv_MainTex;
                float4 color : COLOR;
                float3 viewDir;
            };
            void surf(Input IN,inout SurfaceOutput o)
            {

            o.Albedo=_Albedo.rgb;
            half rim = 1.0 - saturate(dot(IN.viewDir, o.Normal));
            o.Emission= _RimColor.rgb * pow(rim,_RimStrength);
            }
     ENDCG
    }
}
