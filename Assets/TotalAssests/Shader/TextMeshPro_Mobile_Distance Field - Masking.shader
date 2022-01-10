//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TextMeshPro/Mobile/Distance Field - Masking" {
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
_PerspectiveFilter ("Perspective Correction", Range(0, 1)) = 0.875
_Sharpness ("Sharpness", Range(-1, 1)) = 0
_VertexOffsetX ("Vertex OffsetX", Float) = 0
_VertexOffsetY ("Vertex OffsetY", Float) = 0
_ClipRect ("Clip Rect", Vector) = (-32767,-32767,32767,32767)
_MaskSoftnessX ("Mask SoftnessX", Float) = 0
_MaskSoftnessY ("Mask SoftnessY", Float) = 0
_MaskTex ("Mask Texture", 2D) = "white" { }
_MaskInverse ("Inverse", Float) = 0
_MaskEdgeColor ("Edge Color", Color) = (1,1,1,1)
_MaskEdgeSoftness ("Edge Softness", Range(0, 1)) = 0.01
_MaskWipeControl ("Wipe Position", Range(0, 1)) = 0.5
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ColorMask 0 0
  ZTest Off
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  GpuProgramID 29492
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec2 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    u_xlat16_3 = in_COLOR0 * _FaceColor;
    u_xlat16_3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    vs_COLOR0 = u_xlat16_3;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
    u_xlat1.zw = vec2(0.25, 0.25) / u_xlat1.xy;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat12 = u_xlat12 * abs(u_xlat7);
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat12);
    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat7;
    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
    u_xlat2.x = u_xlat10 / u_xlat15;
    u_xlat10 = _OutlineWidth * _ScaleRatioA;
    u_xlat10 = u_xlat2.x * u_xlat10;
    u_xlat15 = min(u_xlat10, 1.0);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat4.x = in_COLOR0.w * _OutlineColor.w;
    u_xlat4.xyz = _OutlineColor.xyz * u_xlat4.xxx + (-u_xlat16_3.xyz);
    u_xlat4.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat16_3.w);
    u_xlat3 = vec4(u_xlat15) * u_xlat4 + u_xlat16_3;
    vs_COLOR1 = u_xlat3;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat4.xy = u_xlat0.xy + (-u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    u_xlat1.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat3.xy) + u_xlat3.zw;
    vs_TEXCOORD0.zw = u_xlat4.xy / u_xlat0.xy;
    vs_TEXCOORD2 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5 = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat2.w = u_xlat0.x * u_xlat2.x + -0.5;
    u_xlat2.y = (-u_xlat10) * 0.5 + u_xlat2.w;
    u_xlat2.z = u_xlat10 * 0.5 + u_xlat2.w;
    vs_TEXCOORD1 = u_xlat2;
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
uniform 	float _MaskWipeControl;
uniform 	float _MaskEdgeSoftness;
uniform 	mediump vec4 _MaskEdgeColor;
uniform 	int _MaskInverse;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
void main()
{
    u_xlat0 = (_MaskInverse != 0) ? 1.0 : 0.0;
    u_xlat16_4 = texture(_MaskTex, vs_TEXCOORD0.zw).w;
    u_xlat0 = (-u_xlat16_4) + u_xlat0;
    u_xlat4.x = (-_MaskWipeControl) + 1.0;
    u_xlat0 = u_xlat4.x * _MaskEdgeSoftness + abs(u_xlat0);
    u_xlat0 = u_xlat0 + (-_MaskWipeControl);
    u_xlat0 = u_xlat0 / _MaskEdgeSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_4 * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_1 * vs_COLOR0.w;
    u_xlat16_2.xyz = vec3(u_xlat16_5) * _MaskEdgeColor.xyz;
    u_xlat3.w = u_xlat0 * u_xlat16_5;
    u_xlat4.xyz = vs_COLOR0.xyz * vec3(u_xlat16_1) + (-u_xlat16_2.xyz);
    u_xlat4.xyz = vec3(u_xlat0) * u_xlat4.xyz + u_xlat16_2.xyz;
    u_xlat3.xyz = vec3(u_xlat0) * u_xlat4.xyz;
    SV_Target0 = u_xlat3;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec2 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    u_xlat16_3 = in_COLOR0 * _FaceColor;
    u_xlat16_3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    vs_COLOR0 = u_xlat16_3;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
    u_xlat1.zw = vec2(0.25, 0.25) / u_xlat1.xy;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat12 = u_xlat12 * abs(u_xlat7);
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat12);
    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat7;
    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
    u_xlat2.x = u_xlat10 / u_xlat15;
    u_xlat10 = _OutlineWidth * _ScaleRatioA;
    u_xlat10 = u_xlat2.x * u_xlat10;
    u_xlat15 = min(u_xlat10, 1.0);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat4.x = in_COLOR0.w * _OutlineColor.w;
    u_xlat4.xyz = _OutlineColor.xyz * u_xlat4.xxx + (-u_xlat16_3.xyz);
    u_xlat4.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat16_3.w);
    u_xlat3 = vec4(u_xlat15) * u_xlat4 + u_xlat16_3;
    vs_COLOR1 = u_xlat3;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat4.xy = u_xlat0.xy + (-u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    u_xlat1.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat3.xy) + u_xlat3.zw;
    vs_TEXCOORD0.zw = u_xlat4.xy / u_xlat0.xy;
    vs_TEXCOORD2 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5 = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat2.w = u_xlat0.x * u_xlat2.x + -0.5;
    u_xlat2.y = (-u_xlat10) * 0.5 + u_xlat2.w;
    u_xlat2.z = u_xlat10 * 0.5 + u_xlat2.w;
    vs_TEXCOORD1 = u_xlat2;
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
uniform 	float _MaskWipeControl;
uniform 	float _MaskEdgeSoftness;
uniform 	mediump vec4 _MaskEdgeColor;
uniform 	int _MaskInverse;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
void main()
{
    u_xlat0 = (_MaskInverse != 0) ? 1.0 : 0.0;
    u_xlat16_4 = texture(_MaskTex, vs_TEXCOORD0.zw).w;
    u_xlat0 = (-u_xlat16_4) + u_xlat0;
    u_xlat4.x = (-_MaskWipeControl) + 1.0;
    u_xlat0 = u_xlat4.x * _MaskEdgeSoftness + abs(u_xlat0);
    u_xlat0 = u_xlat0 + (-_MaskWipeControl);
    u_xlat0 = u_xlat0 / _MaskEdgeSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_4 * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_1 * vs_COLOR0.w;
    u_xlat16_2.xyz = vec3(u_xlat16_5) * _MaskEdgeColor.xyz;
    u_xlat3.w = u_xlat0 * u_xlat16_5;
    u_xlat4.xyz = vs_COLOR0.xyz * vec3(u_xlat16_1) + (-u_xlat16_2.xyz);
    u_xlat4.xyz = vec3(u_xlat0) * u_xlat4.xyz + u_xlat16_2.xyz;
    u_xlat3.xyz = vec3(u_xlat0) * u_xlat4.xyz;
    SV_Target0 = u_xlat3;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec2 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    u_xlat16_3 = in_COLOR0 * _FaceColor;
    u_xlat16_3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    vs_COLOR0 = u_xlat16_3;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
    u_xlat1.zw = vec2(0.25, 0.25) / u_xlat1.xy;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat12 = u_xlat12 * abs(u_xlat7);
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat12);
    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat7;
    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
    u_xlat2.x = u_xlat10 / u_xlat15;
    u_xlat10 = _OutlineWidth * _ScaleRatioA;
    u_xlat10 = u_xlat2.x * u_xlat10;
    u_xlat15 = min(u_xlat10, 1.0);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat4.x = in_COLOR0.w * _OutlineColor.w;
    u_xlat4.xyz = _OutlineColor.xyz * u_xlat4.xxx + (-u_xlat16_3.xyz);
    u_xlat4.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat16_3.w);
    u_xlat3 = vec4(u_xlat15) * u_xlat4 + u_xlat16_3;
    vs_COLOR1 = u_xlat3;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat4.xy = u_xlat0.xy + (-u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    u_xlat1.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat3.xy) + u_xlat3.zw;
    vs_TEXCOORD0.zw = u_xlat4.xy / u_xlat0.xy;
    vs_TEXCOORD2 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5 = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat2.w = u_xlat0.x * u_xlat2.x + -0.5;
    u_xlat2.y = (-u_xlat10) * 0.5 + u_xlat2.w;
    u_xlat2.z = u_xlat10 * 0.5 + u_xlat2.w;
    vs_TEXCOORD1 = u_xlat2;
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
uniform 	float _MaskWipeControl;
uniform 	float _MaskEdgeSoftness;
uniform 	mediump vec4 _MaskEdgeColor;
uniform 	int _MaskInverse;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
void main()
{
    u_xlat0 = (_MaskInverse != 0) ? 1.0 : 0.0;
    u_xlat16_4 = texture(_MaskTex, vs_TEXCOORD0.zw).w;
    u_xlat0 = (-u_xlat16_4) + u_xlat0;
    u_xlat4.x = (-_MaskWipeControl) + 1.0;
    u_xlat0 = u_xlat4.x * _MaskEdgeSoftness + abs(u_xlat0);
    u_xlat0 = u_xlat0 + (-_MaskWipeControl);
    u_xlat0 = u_xlat0 / _MaskEdgeSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_4 * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_1 * vs_COLOR0.w;
    u_xlat16_2.xyz = vec3(u_xlat16_5) * _MaskEdgeColor.xyz;
    u_xlat3.w = u_xlat0 * u_xlat16_5;
    u_xlat4.xyz = vs_COLOR0.xyz * vec3(u_xlat16_1) + (-u_xlat16_2.xyz);
    u_xlat4.xyz = vec3(u_xlat0) * u_xlat4.xyz + u_xlat16_2.xyz;
    u_xlat3.xyz = vec3(u_xlat0) * u_xlat4.xyz;
    SV_Target0 = u_xlat3;
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
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec2 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    u_xlat16_3 = in_COLOR0 * _FaceColor;
    u_xlat16_3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    vs_COLOR0 = u_xlat16_3;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
    u_xlat1.zw = vec2(0.25, 0.25) / u_xlat1.xy;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat12 = u_xlat12 * abs(u_xlat7);
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat12);
    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat7;
    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
    u_xlat2.x = u_xlat10 / u_xlat15;
    u_xlat10 = _OutlineWidth * _ScaleRatioA;
    u_xlat10 = u_xlat2.x * u_xlat10;
    u_xlat15 = min(u_xlat10, 1.0);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat4.x = in_COLOR0.w * _OutlineColor.w;
    u_xlat4.xyz = _OutlineColor.xyz * u_xlat4.xxx + (-u_xlat16_3.xyz);
    u_xlat4.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat16_3.w);
    u_xlat3 = vec4(u_xlat15) * u_xlat4 + u_xlat16_3;
    vs_COLOR1 = u_xlat3;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat4.xy = u_xlat0.xy + (-u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    u_xlat1.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat3.xy) + u_xlat3.zw;
    vs_TEXCOORD0.zw = u_xlat4.xy / u_xlat0.xy;
    vs_TEXCOORD2 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5 = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat2.w = u_xlat0.x * u_xlat2.x + -0.5;
    u_xlat2.y = (-u_xlat10) * 0.5 + u_xlat2.w;
    u_xlat2.z = u_xlat10 * 0.5 + u_xlat2.w;
    vs_TEXCOORD1 = u_xlat2;
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
uniform 	float _MaskWipeControl;
uniform 	float _MaskEdgeSoftness;
uniform 	mediump vec4 _MaskEdgeColor;
uniform 	int _MaskInverse;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
mediump float u_xlat16_5;
mediump float u_xlat16_9;
void main()
{
    u_xlat0 = (_MaskInverse != 0) ? 1.0 : 0.0;
    u_xlat16_4 = texture(_MaskTex, vs_TEXCOORD0.zw).w;
    u_xlat0 = (-u_xlat16_4) + u_xlat0;
    u_xlat4.x = (-_MaskWipeControl) + 1.0;
    u_xlat0 = u_xlat4.x * _MaskEdgeSoftness + abs(u_xlat0);
    u_xlat0 = u_xlat0 + (-_MaskWipeControl);
    u_xlat0 = u_xlat0 / _MaskEdgeSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_4 * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_1 * vs_COLOR0.w;
    u_xlat16_9 = u_xlat16_5 * u_xlat0 + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_9<0.0);
#else
    u_xlatb4 = u_xlat16_9<0.0;
#endif
    if(u_xlatb4){discard;}
    u_xlat16_2.xyz = vec3(u_xlat16_5) * _MaskEdgeColor.xyz;
    u_xlat3.w = u_xlat0 * u_xlat16_5;
    u_xlat4.xyz = vs_COLOR0.xyz * vec3(u_xlat16_1) + (-u_xlat16_2.xyz);
    u_xlat4.xyz = vec3(u_xlat0) * u_xlat4.xyz + u_xlat16_2.xyz;
    u_xlat3.xyz = vec3(u_xlat0) * u_xlat4.xyz;
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec2 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    u_xlat16_3 = in_COLOR0 * _FaceColor;
    u_xlat16_3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    vs_COLOR0 = u_xlat16_3;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
    u_xlat1.zw = vec2(0.25, 0.25) / u_xlat1.xy;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat12 = u_xlat12 * abs(u_xlat7);
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat12);
    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat7;
    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
    u_xlat2.x = u_xlat10 / u_xlat15;
    u_xlat10 = _OutlineWidth * _ScaleRatioA;
    u_xlat10 = u_xlat2.x * u_xlat10;
    u_xlat15 = min(u_xlat10, 1.0);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat4.x = in_COLOR0.w * _OutlineColor.w;
    u_xlat4.xyz = _OutlineColor.xyz * u_xlat4.xxx + (-u_xlat16_3.xyz);
    u_xlat4.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat16_3.w);
    u_xlat3 = vec4(u_xlat15) * u_xlat4 + u_xlat16_3;
    vs_COLOR1 = u_xlat3;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat4.xy = u_xlat0.xy + (-u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    u_xlat1.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat3.xy) + u_xlat3.zw;
    vs_TEXCOORD0.zw = u_xlat4.xy / u_xlat0.xy;
    vs_TEXCOORD2 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5 = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat2.w = u_xlat0.x * u_xlat2.x + -0.5;
    u_xlat2.y = (-u_xlat10) * 0.5 + u_xlat2.w;
    u_xlat2.z = u_xlat10 * 0.5 + u_xlat2.w;
    vs_TEXCOORD1 = u_xlat2;
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
uniform 	float _MaskWipeControl;
uniform 	float _MaskEdgeSoftness;
uniform 	mediump vec4 _MaskEdgeColor;
uniform 	int _MaskInverse;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
mediump float u_xlat16_5;
mediump float u_xlat16_9;
void main()
{
    u_xlat0 = (_MaskInverse != 0) ? 1.0 : 0.0;
    u_xlat16_4 = texture(_MaskTex, vs_TEXCOORD0.zw).w;
    u_xlat0 = (-u_xlat16_4) + u_xlat0;
    u_xlat4.x = (-_MaskWipeControl) + 1.0;
    u_xlat0 = u_xlat4.x * _MaskEdgeSoftness + abs(u_xlat0);
    u_xlat0 = u_xlat0 + (-_MaskWipeControl);
    u_xlat0 = u_xlat0 / _MaskEdgeSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_4 * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_1 * vs_COLOR0.w;
    u_xlat16_9 = u_xlat16_5 * u_xlat0 + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_9<0.0);
#else
    u_xlatb4 = u_xlat16_9<0.0;
#endif
    if(u_xlatb4){discard;}
    u_xlat16_2.xyz = vec3(u_xlat16_5) * _MaskEdgeColor.xyz;
    u_xlat3.w = u_xlat0 * u_xlat16_5;
    u_xlat4.xyz = vs_COLOR0.xyz * vec3(u_xlat16_1) + (-u_xlat16_2.xyz);
    u_xlat4.xyz = vec3(u_xlat0) * u_xlat4.xyz + u_xlat16_2.xyz;
    u_xlat3.xyz = vec3(u_xlat0) * u_xlat4.xyz;
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec2 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    u_xlat16_3 = in_COLOR0 * _FaceColor;
    u_xlat16_3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    vs_COLOR0 = u_xlat16_3;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
    u_xlat1.zw = vec2(0.25, 0.25) / u_xlat1.xy;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat12 = u_xlat12 * abs(u_xlat7);
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat12);
    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat7;
    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
    u_xlat2.x = u_xlat10 / u_xlat15;
    u_xlat10 = _OutlineWidth * _ScaleRatioA;
    u_xlat10 = u_xlat2.x * u_xlat10;
    u_xlat15 = min(u_xlat10, 1.0);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat4.x = in_COLOR0.w * _OutlineColor.w;
    u_xlat4.xyz = _OutlineColor.xyz * u_xlat4.xxx + (-u_xlat16_3.xyz);
    u_xlat4.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat16_3.w);
    u_xlat3 = vec4(u_xlat15) * u_xlat4 + u_xlat16_3;
    vs_COLOR1 = u_xlat3;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat4.xy = u_xlat0.xy + (-u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    u_xlat1.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat3.xy) + u_xlat3.zw;
    vs_TEXCOORD0.zw = u_xlat4.xy / u_xlat0.xy;
    vs_TEXCOORD2 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5 = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat2.w = u_xlat0.x * u_xlat2.x + -0.5;
    u_xlat2.y = (-u_xlat10) * 0.5 + u_xlat2.w;
    u_xlat2.z = u_xlat10 * 0.5 + u_xlat2.w;
    vs_TEXCOORD1 = u_xlat2;
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
uniform 	float _MaskWipeControl;
uniform 	float _MaskEdgeSoftness;
uniform 	mediump vec4 _MaskEdgeColor;
uniform 	int _MaskInverse;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
mediump float u_xlat16_5;
mediump float u_xlat16_9;
void main()
{
    u_xlat0 = (_MaskInverse != 0) ? 1.0 : 0.0;
    u_xlat16_4 = texture(_MaskTex, vs_TEXCOORD0.zw).w;
    u_xlat0 = (-u_xlat16_4) + u_xlat0;
    u_xlat4.x = (-_MaskWipeControl) + 1.0;
    u_xlat0 = u_xlat4.x * _MaskEdgeSoftness + abs(u_xlat0);
    u_xlat0 = u_xlat0 + (-_MaskWipeControl);
    u_xlat0 = u_xlat0 / _MaskEdgeSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_4 * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_1 * vs_COLOR0.w;
    u_xlat16_9 = u_xlat16_5 * u_xlat0 + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_9<0.0);
#else
    u_xlatb4 = u_xlat16_9<0.0;
#endif
    if(u_xlatb4){discard;}
    u_xlat16_2.xyz = vec3(u_xlat16_5) * _MaskEdgeColor.xyz;
    u_xlat3.w = u_xlat0 * u_xlat16_5;
    u_xlat4.xyz = vs_COLOR0.xyz * vec3(u_xlat16_1) + (-u_xlat16_2.xyz);
    u_xlat4.xyz = vec3(u_xlat0) * u_xlat4.xyz + u_xlat16_2.xyz;
    u_xlat3.xyz = vec3(u_xlat0) * u_xlat4.xyz;
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_CLIP_RECT" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec2 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    u_xlat16_3 = in_COLOR0 * _FaceColor;
    u_xlat16_3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    vs_COLOR0 = u_xlat16_3;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
    u_xlat1.zw = vec2(0.25, 0.25) / u_xlat1.xy;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat12 = u_xlat12 * abs(u_xlat7);
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat12);
    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat7;
    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
    u_xlat2.x = u_xlat10 / u_xlat15;
    u_xlat10 = _OutlineWidth * _ScaleRatioA;
    u_xlat10 = u_xlat2.x * u_xlat10;
    u_xlat15 = min(u_xlat10, 1.0);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat4.x = in_COLOR0.w * _OutlineColor.w;
    u_xlat4.xyz = _OutlineColor.xyz * u_xlat4.xxx + (-u_xlat16_3.xyz);
    u_xlat4.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat16_3.w);
    u_xlat3 = vec4(u_xlat15) * u_xlat4 + u_xlat16_3;
    vs_COLOR1 = u_xlat3;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat4.xy = u_xlat0.xy + (-u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    u_xlat1.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat3.xy) + u_xlat3.zw;
    vs_TEXCOORD0.zw = u_xlat4.xy / u_xlat0.xy;
    vs_TEXCOORD2 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5 = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat2.w = u_xlat0.x * u_xlat2.x + -0.5;
    u_xlat2.y = (-u_xlat10) * 0.5 + u_xlat2.w;
    u_xlat2.z = u_xlat10 * 0.5 + u_xlat2.w;
    vs_TEXCOORD1 = u_xlat2;
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
uniform 	vec4 _ClipRect;
uniform 	float _MaskWipeControl;
uniform 	float _MaskEdgeSoftness;
uniform 	mediump vec4 _MaskEdgeColor;
uniform 	int _MaskInverse;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat4;
mediump float u_xlat16_4;
mediump float u_xlat16_6;
float u_xlat18;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_6 = u_xlat16_0.x * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat16_0 = vec4(u_xlat16_6) * vs_COLOR0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_0.w;
    u_xlat16_2.xyz = vec3(u_xlat16_6) * _MaskEdgeColor.xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(u_xlat16_1) + (-u_xlat16_2.xyz);
    u_xlat18 = (_MaskInverse != 0) ? 1.0 : 0.0;
    u_xlat16_4 = texture(_MaskTex, vs_TEXCOORD0.zw).w;
    u_xlat18 = u_xlat18 + (-u_xlat16_4);
    u_xlat4 = (-_MaskWipeControl) + 1.0;
    u_xlat18 = u_xlat4 * _MaskEdgeSoftness + abs(u_xlat18);
    u_xlat18 = u_xlat18 + (-_MaskWipeControl);
    u_xlat18 = u_xlat18 / _MaskEdgeSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat0.w = u_xlat16_6 * u_xlat18;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_CLIP_RECT" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec2 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    u_xlat16_3 = in_COLOR0 * _FaceColor;
    u_xlat16_3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    vs_COLOR0 = u_xlat16_3;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
    u_xlat1.zw = vec2(0.25, 0.25) / u_xlat1.xy;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat12 = u_xlat12 * abs(u_xlat7);
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat12);
    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat7;
    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
    u_xlat2.x = u_xlat10 / u_xlat15;
    u_xlat10 = _OutlineWidth * _ScaleRatioA;
    u_xlat10 = u_xlat2.x * u_xlat10;
    u_xlat15 = min(u_xlat10, 1.0);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat4.x = in_COLOR0.w * _OutlineColor.w;
    u_xlat4.xyz = _OutlineColor.xyz * u_xlat4.xxx + (-u_xlat16_3.xyz);
    u_xlat4.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat16_3.w);
    u_xlat3 = vec4(u_xlat15) * u_xlat4 + u_xlat16_3;
    vs_COLOR1 = u_xlat3;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat4.xy = u_xlat0.xy + (-u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    u_xlat1.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat3.xy) + u_xlat3.zw;
    vs_TEXCOORD0.zw = u_xlat4.xy / u_xlat0.xy;
    vs_TEXCOORD2 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5 = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat2.w = u_xlat0.x * u_xlat2.x + -0.5;
    u_xlat2.y = (-u_xlat10) * 0.5 + u_xlat2.w;
    u_xlat2.z = u_xlat10 * 0.5 + u_xlat2.w;
    vs_TEXCOORD1 = u_xlat2;
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
uniform 	vec4 _ClipRect;
uniform 	float _MaskWipeControl;
uniform 	float _MaskEdgeSoftness;
uniform 	mediump vec4 _MaskEdgeColor;
uniform 	int _MaskInverse;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat4;
mediump float u_xlat16_4;
mediump float u_xlat16_6;
float u_xlat18;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_6 = u_xlat16_0.x * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat16_0 = vec4(u_xlat16_6) * vs_COLOR0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_0.w;
    u_xlat16_2.xyz = vec3(u_xlat16_6) * _MaskEdgeColor.xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(u_xlat16_1) + (-u_xlat16_2.xyz);
    u_xlat18 = (_MaskInverse != 0) ? 1.0 : 0.0;
    u_xlat16_4 = texture(_MaskTex, vs_TEXCOORD0.zw).w;
    u_xlat18 = u_xlat18 + (-u_xlat16_4);
    u_xlat4 = (-_MaskWipeControl) + 1.0;
    u_xlat18 = u_xlat4 * _MaskEdgeSoftness + abs(u_xlat18);
    u_xlat18 = u_xlat18 + (-_MaskWipeControl);
    u_xlat18 = u_xlat18 / _MaskEdgeSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat0.w = u_xlat16_6 * u_xlat18;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_CLIP_RECT" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec2 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    u_xlat16_3 = in_COLOR0 * _FaceColor;
    u_xlat16_3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    vs_COLOR0 = u_xlat16_3;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
    u_xlat1.zw = vec2(0.25, 0.25) / u_xlat1.xy;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat12 = u_xlat12 * abs(u_xlat7);
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat12);
    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat7;
    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
    u_xlat2.x = u_xlat10 / u_xlat15;
    u_xlat10 = _OutlineWidth * _ScaleRatioA;
    u_xlat10 = u_xlat2.x * u_xlat10;
    u_xlat15 = min(u_xlat10, 1.0);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat4.x = in_COLOR0.w * _OutlineColor.w;
    u_xlat4.xyz = _OutlineColor.xyz * u_xlat4.xxx + (-u_xlat16_3.xyz);
    u_xlat4.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat16_3.w);
    u_xlat3 = vec4(u_xlat15) * u_xlat4 + u_xlat16_3;
    vs_COLOR1 = u_xlat3;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat4.xy = u_xlat0.xy + (-u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    u_xlat1.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat3.xy) + u_xlat3.zw;
    vs_TEXCOORD0.zw = u_xlat4.xy / u_xlat0.xy;
    vs_TEXCOORD2 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5 = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat2.w = u_xlat0.x * u_xlat2.x + -0.5;
    u_xlat2.y = (-u_xlat10) * 0.5 + u_xlat2.w;
    u_xlat2.z = u_xlat10 * 0.5 + u_xlat2.w;
    vs_TEXCOORD1 = u_xlat2;
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
uniform 	vec4 _ClipRect;
uniform 	float _MaskWipeControl;
uniform 	float _MaskEdgeSoftness;
uniform 	mediump vec4 _MaskEdgeColor;
uniform 	int _MaskInverse;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat4;
mediump float u_xlat16_4;
mediump float u_xlat16_6;
float u_xlat18;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_6 = u_xlat16_0.x * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat16_0 = vec4(u_xlat16_6) * vs_COLOR0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_0.w;
    u_xlat16_2.xyz = vec3(u_xlat16_6) * _MaskEdgeColor.xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(u_xlat16_1) + (-u_xlat16_2.xyz);
    u_xlat18 = (_MaskInverse != 0) ? 1.0 : 0.0;
    u_xlat16_4 = texture(_MaskTex, vs_TEXCOORD0.zw).w;
    u_xlat18 = u_xlat18 + (-u_xlat16_4);
    u_xlat4 = (-_MaskWipeControl) + 1.0;
    u_xlat18 = u_xlat4 * _MaskEdgeSoftness + abs(u_xlat18);
    u_xlat18 = u_xlat18 + (-_MaskWipeControl);
    u_xlat18 = u_xlat18 / _MaskEdgeSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat0.w = u_xlat16_6 * u_xlat18;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec2 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    u_xlat16_3 = in_COLOR0 * _FaceColor;
    u_xlat16_3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    vs_COLOR0 = u_xlat16_3;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
    u_xlat1.zw = vec2(0.25, 0.25) / u_xlat1.xy;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat12 = u_xlat12 * abs(u_xlat7);
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat12);
    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat7;
    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
    u_xlat2.x = u_xlat10 / u_xlat15;
    u_xlat10 = _OutlineWidth * _ScaleRatioA;
    u_xlat10 = u_xlat2.x * u_xlat10;
    u_xlat15 = min(u_xlat10, 1.0);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat4.x = in_COLOR0.w * _OutlineColor.w;
    u_xlat4.xyz = _OutlineColor.xyz * u_xlat4.xxx + (-u_xlat16_3.xyz);
    u_xlat4.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat16_3.w);
    u_xlat3 = vec4(u_xlat15) * u_xlat4 + u_xlat16_3;
    vs_COLOR1 = u_xlat3;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat4.xy = u_xlat0.xy + (-u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    u_xlat1.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat3.xy) + u_xlat3.zw;
    vs_TEXCOORD0.zw = u_xlat4.xy / u_xlat0.xy;
    vs_TEXCOORD2 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5 = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat2.w = u_xlat0.x * u_xlat2.x + -0.5;
    u_xlat2.y = (-u_xlat10) * 0.5 + u_xlat2.w;
    u_xlat2.z = u_xlat10 * 0.5 + u_xlat2.w;
    vs_TEXCOORD1 = u_xlat2;
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
uniform 	vec4 _ClipRect;
uniform 	float _MaskWipeControl;
uniform 	float _MaskEdgeSoftness;
uniform 	mediump vec4 _MaskEdgeColor;
uniform 	int _MaskInverse;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
void main()
{
    u_xlat0 = (_MaskInverse != 0) ? 1.0 : 0.0;
    u_xlat16_5 = texture(_MaskTex, vs_TEXCOORD0.zw).w;
    u_xlat0 = (-u_xlat16_5) + u_xlat0;
    u_xlat5.x = (-_MaskWipeControl) + 1.0;
    u_xlat0 = u_xlat5.x * _MaskEdgeSoftness + abs(u_xlat0);
    u_xlat0 = u_xlat0 + (-_MaskWipeControl);
    u_xlat0 = u_xlat0 / _MaskEdgeSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat5.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat5.xy = u_xlat5.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat5.xy = u_xlat5.xy * vs_TEXCOORD2.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xy = min(max(u_xlat5.xy, 0.0), 1.0);
#else
    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat5.y * u_xlat5.x;
    u_xlat16_5 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_6 = u_xlat16_5 * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat16_2 = vec4(u_xlat16_6) * vs_COLOR0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_2.w;
    u_xlat16_11 = u_xlat16_6 * u_xlat0 + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_11<0.0);
#else
    u_xlatb5 = u_xlat16_11<0.0;
#endif
    if(u_xlatb5){discard;}
    u_xlat16_3.xyz = vec3(u_xlat16_6) * _MaskEdgeColor.xyz;
    u_xlat4.w = u_xlat0 * u_xlat16_6;
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(u_xlat16_1) + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat0) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat4.xyz = vec3(u_xlat0) * u_xlat5.xyz;
    SV_Target0 = u_xlat4;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec2 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    u_xlat16_3 = in_COLOR0 * _FaceColor;
    u_xlat16_3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    vs_COLOR0 = u_xlat16_3;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
    u_xlat1.zw = vec2(0.25, 0.25) / u_xlat1.xy;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat12 = u_xlat12 * abs(u_xlat7);
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat12);
    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat7;
    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
    u_xlat2.x = u_xlat10 / u_xlat15;
    u_xlat10 = _OutlineWidth * _ScaleRatioA;
    u_xlat10 = u_xlat2.x * u_xlat10;
    u_xlat15 = min(u_xlat10, 1.0);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat4.x = in_COLOR0.w * _OutlineColor.w;
    u_xlat4.xyz = _OutlineColor.xyz * u_xlat4.xxx + (-u_xlat16_3.xyz);
    u_xlat4.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat16_3.w);
    u_xlat3 = vec4(u_xlat15) * u_xlat4 + u_xlat16_3;
    vs_COLOR1 = u_xlat3;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat4.xy = u_xlat0.xy + (-u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    u_xlat1.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat3.xy) + u_xlat3.zw;
    vs_TEXCOORD0.zw = u_xlat4.xy / u_xlat0.xy;
    vs_TEXCOORD2 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5 = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat2.w = u_xlat0.x * u_xlat2.x + -0.5;
    u_xlat2.y = (-u_xlat10) * 0.5 + u_xlat2.w;
    u_xlat2.z = u_xlat10 * 0.5 + u_xlat2.w;
    vs_TEXCOORD1 = u_xlat2;
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
uniform 	vec4 _ClipRect;
uniform 	float _MaskWipeControl;
uniform 	float _MaskEdgeSoftness;
uniform 	mediump vec4 _MaskEdgeColor;
uniform 	int _MaskInverse;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
void main()
{
    u_xlat0 = (_MaskInverse != 0) ? 1.0 : 0.0;
    u_xlat16_5 = texture(_MaskTex, vs_TEXCOORD0.zw).w;
    u_xlat0 = (-u_xlat16_5) + u_xlat0;
    u_xlat5.x = (-_MaskWipeControl) + 1.0;
    u_xlat0 = u_xlat5.x * _MaskEdgeSoftness + abs(u_xlat0);
    u_xlat0 = u_xlat0 + (-_MaskWipeControl);
    u_xlat0 = u_xlat0 / _MaskEdgeSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat5.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat5.xy = u_xlat5.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat5.xy = u_xlat5.xy * vs_TEXCOORD2.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xy = min(max(u_xlat5.xy, 0.0), 1.0);
#else
    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat5.y * u_xlat5.x;
    u_xlat16_5 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_6 = u_xlat16_5 * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat16_2 = vec4(u_xlat16_6) * vs_COLOR0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_2.w;
    u_xlat16_11 = u_xlat16_6 * u_xlat0 + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_11<0.0);
#else
    u_xlatb5 = u_xlat16_11<0.0;
#endif
    if(u_xlatb5){discard;}
    u_xlat16_3.xyz = vec3(u_xlat16_6) * _MaskEdgeColor.xyz;
    u_xlat4.w = u_xlat0 * u_xlat16_6;
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(u_xlat16_1) + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat0) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat4.xyz = vec3(u_xlat0) * u_xlat5.xyz;
    SV_Target0 = u_xlat4;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec2 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    gl_Position = u_xlat2;
    u_xlat16_3 = in_COLOR0 * _FaceColor;
    u_xlat16_3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    vs_COLOR0 = u_xlat16_3;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
    u_xlat1.zw = vec2(0.25, 0.25) / u_xlat1.xy;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat12 = u_xlat12 * abs(u_xlat7);
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat12);
    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat7;
    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
    u_xlat2.x = u_xlat10 / u_xlat15;
    u_xlat10 = _OutlineWidth * _ScaleRatioA;
    u_xlat10 = u_xlat2.x * u_xlat10;
    u_xlat15 = min(u_xlat10, 1.0);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat4.x = in_COLOR0.w * _OutlineColor.w;
    u_xlat4.xyz = _OutlineColor.xyz * u_xlat4.xxx + (-u_xlat16_3.xyz);
    u_xlat4.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat16_3.w);
    u_xlat3 = vec4(u_xlat15) * u_xlat4 + u_xlat16_3;
    vs_COLOR1 = u_xlat3;
    u_xlat3 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat3 = min(u_xlat3, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat4.xy = u_xlat0.xy + (-u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat3.xy);
    u_xlat1.xy = (-u_xlat3.zw) + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat3.xy) + u_xlat3.zw;
    vs_TEXCOORD0.zw = u_xlat4.xy / u_xlat0.xy;
    vs_TEXCOORD2 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5 = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat2.w = u_xlat0.x * u_xlat2.x + -0.5;
    u_xlat2.y = (-u_xlat10) * 0.5 + u_xlat2.w;
    u_xlat2.z = u_xlat10 * 0.5 + u_xlat2.w;
    vs_TEXCOORD1 = u_xlat2;
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
uniform 	vec4 _ClipRect;
uniform 	float _MaskWipeControl;
uniform 	float _MaskEdgeSoftness;
uniform 	mediump vec4 _MaskEdgeColor;
uniform 	int _MaskInverse;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
void main()
{
    u_xlat0 = (_MaskInverse != 0) ? 1.0 : 0.0;
    u_xlat16_5 = texture(_MaskTex, vs_TEXCOORD0.zw).w;
    u_xlat0 = (-u_xlat16_5) + u_xlat0;
    u_xlat5.x = (-_MaskWipeControl) + 1.0;
    u_xlat0 = u_xlat5.x * _MaskEdgeSoftness + abs(u_xlat0);
    u_xlat0 = u_xlat0 + (-_MaskWipeControl);
    u_xlat0 = u_xlat0 / _MaskEdgeSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat5.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat5.xy = u_xlat5.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat5.xy = u_xlat5.xy * vs_TEXCOORD2.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xy = min(max(u_xlat5.xy, 0.0), 1.0);
#else
    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat5.y * u_xlat5.x;
    u_xlat16_5 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_6 = u_xlat16_5 * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat16_2 = vec4(u_xlat16_6) * vs_COLOR0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_2.w;
    u_xlat16_11 = u_xlat16_6 * u_xlat0 + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_11<0.0);
#else
    u_xlatb5 = u_xlat16_11<0.0;
#endif
    if(u_xlatb5){discard;}
    u_xlat16_3.xyz = vec3(u_xlat16_6) * _MaskEdgeColor.xyz;
    u_xlat4.w = u_xlat0 * u_xlat16_6;
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(u_xlat16_1) + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat0) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat4.xyz = vec3(u_xlat0) * u_xlat5.xyz;
    SV_Target0 = u_xlat4;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
}
CustomEditor "TMPro.EditorUtilities.TMP_SDFShaderGUI"
}