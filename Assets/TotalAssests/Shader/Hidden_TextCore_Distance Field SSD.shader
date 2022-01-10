//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/TextCore/Distance Field SSD" {
Properties {
_FaceColor ("Face Color", Color) = (1,1,1,1)
_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
_OutlineColor ("Outline Color", Color) = (0,0,0,1)
_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
_UnderlayColor ("Border Color", Color) = (0,0,0,0.5)
_UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
_UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
_UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
_UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
_WeightNormal ("Weight Normal", Float) = 0
_WeightBold ("Weight Bold", Float) = 0.5
_ShaderFlags ("Flags", Float) = 0
_ScaleRatioA ("Scale RatioA", Float) = 1
_ScaleRatioB ("Scale RatioB", Float) = 1
_ScaleRatioC ("Scale RatioC", Float) = 1
_MainTex ("Font Atlas", 2D) = "white" { }
_TextureWidth ("Texture Width", Float) = 512
_TextureHeight ("Texture Height", Float) = 512
_GradientScale ("Gradient Scale", Float) = 5
_ScaleX ("Scale X", Float) = 1
_ScaleY ("Scale Y", Float) = 1
_Sharpness ("Sharpness", Range(-1, 1)) = 0
_VertexOffsetX ("Vertex OffsetX", Float) = 0
_VertexOffsetY ("Vertex OffsetY", Float) = 0
}
SubShader {
 Tags { "ForceSupported" = "true" }
 Pass {
  Tags { "ForceSupported" = "true" }
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 33620
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec2 u_xlat3;
void main()
{
    u_xlat0.x = in_POSITION0.y + _VertexOffsetY;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1.x = in_POSITION0.x + _VertexOffsetX;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_0 = in_COLOR0 * _FaceColor;
    vs_COLOR0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    vs_COLOR0.w = u_xlat16_0.w;
    u_xlat1.x = in_COLOR0.w * _OutlineColor.w;
    vs_COLOR1.xyz = u_xlat1.xxx * _OutlineColor.xyz;
    vs_COLOR1.w = u_xlat1.x;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat1.xy;
    u_xlat3.xy = u_xlat1.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat1.xx + u_xlat3.xy;
    vs_TEXCOORD1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _ScaleRatioA;
uniform 	float _Sharpness;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_4;
float u_xlat6;
void main()
{
    u_xlat0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = dFdx(u_xlat0.x);
    u_xlat16_4 = dFdy(u_xlat0.x);
    u_xlat16_1 = abs(u_xlat16_4) + abs(u_xlat16_1);
    u_xlat3 = (-_Sharpness) + 1.0;
    u_xlat6 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat16_1 * u_xlat3 + u_xlat6;
    u_xlat6 = _FaceDilate * _ScaleRatioA;
    u_xlat6 = (-u_xlat6) * 0.5 + 0.5;
    u_xlat16_1 = u_xlat3 + u_xlat6;
    u_xlat16_4 = (-u_xlat3) + u_xlat6;
    u_xlat16_1 = (-u_xlat16_4) + u_xlat16_1;
    u_xlat16_4 = u_xlat0.x + (-u_xlat16_4);
    u_xlat16_1 = float(1.0) / u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat16_1 * -2.0 + 3.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat16_0 = vec4(u_xlat16_1) * vs_COLOR0;
    u_xlat16_2 = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 * vec4(u_xlat16_2);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec2 u_xlat3;
void main()
{
    u_xlat0.x = in_POSITION0.y + _VertexOffsetY;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1.x = in_POSITION0.x + _VertexOffsetX;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_0 = in_COLOR0 * _FaceColor;
    vs_COLOR0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    vs_COLOR0.w = u_xlat16_0.w;
    u_xlat1.x = in_COLOR0.w * _OutlineColor.w;
    vs_COLOR1.xyz = u_xlat1.xxx * _OutlineColor.xyz;
    vs_COLOR1.w = u_xlat1.x;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat1.xy;
    u_xlat3.xy = u_xlat1.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat1.xx + u_xlat3.xy;
    vs_TEXCOORD1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _ScaleRatioA;
uniform 	float _Sharpness;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_4;
float u_xlat6;
void main()
{
    u_xlat0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = dFdx(u_xlat0.x);
    u_xlat16_4 = dFdy(u_xlat0.x);
    u_xlat16_1 = abs(u_xlat16_4) + abs(u_xlat16_1);
    u_xlat3 = (-_Sharpness) + 1.0;
    u_xlat6 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat16_1 * u_xlat3 + u_xlat6;
    u_xlat6 = _FaceDilate * _ScaleRatioA;
    u_xlat6 = (-u_xlat6) * 0.5 + 0.5;
    u_xlat16_1 = u_xlat3 + u_xlat6;
    u_xlat16_4 = (-u_xlat3) + u_xlat6;
    u_xlat16_1 = (-u_xlat16_4) + u_xlat16_1;
    u_xlat16_4 = u_xlat0.x + (-u_xlat16_4);
    u_xlat16_1 = float(1.0) / u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat16_1 * -2.0 + 3.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat16_0 = vec4(u_xlat16_1) * vs_COLOR0;
    u_xlat16_2 = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 * vec4(u_xlat16_2);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec2 u_xlat3;
void main()
{
    u_xlat0.x = in_POSITION0.y + _VertexOffsetY;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1.x = in_POSITION0.x + _VertexOffsetX;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_0 = in_COLOR0 * _FaceColor;
    vs_COLOR0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    vs_COLOR0.w = u_xlat16_0.w;
    u_xlat1.x = in_COLOR0.w * _OutlineColor.w;
    vs_COLOR1.xyz = u_xlat1.xxx * _OutlineColor.xyz;
    vs_COLOR1.w = u_xlat1.x;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat1.xy;
    u_xlat3.xy = u_xlat1.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat1.xx + u_xlat3.xy;
    vs_TEXCOORD1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _ScaleRatioA;
uniform 	float _Sharpness;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_4;
float u_xlat6;
void main()
{
    u_xlat0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = dFdx(u_xlat0.x);
    u_xlat16_4 = dFdy(u_xlat0.x);
    u_xlat16_1 = abs(u_xlat16_4) + abs(u_xlat16_1);
    u_xlat3 = (-_Sharpness) + 1.0;
    u_xlat6 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat16_1 * u_xlat3 + u_xlat6;
    u_xlat6 = _FaceDilate * _ScaleRatioA;
    u_xlat6 = (-u_xlat6) * 0.5 + 0.5;
    u_xlat16_1 = u_xlat3 + u_xlat6;
    u_xlat16_4 = (-u_xlat3) + u_xlat6;
    u_xlat16_1 = (-u_xlat16_4) + u_xlat16_1;
    u_xlat16_4 = u_xlat0.x + (-u_xlat16_4);
    u_xlat16_1 = float(1.0) / u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat16_1 * -2.0 + 3.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat16_0 = vec4(u_xlat16_1) * vs_COLOR0;
    u_xlat16_2 = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 * vec4(u_xlat16_2);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
}
}