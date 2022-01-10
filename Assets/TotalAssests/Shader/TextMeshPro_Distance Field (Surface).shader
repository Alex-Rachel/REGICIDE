//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TextMeshPro/Distance Field (Surface)" {
Properties {
_FaceTex ("Fill Texture", 2D) = "white" { }
_FaceUVSpeedX ("Face UV Speed X", Range(-5, 5)) = 0
_FaceUVSpeedY ("Face UV Speed Y", Range(-5, 5)) = 0
_FaceColor ("Fill Color", Color) = (1,1,1,1)
_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
_OutlineColor ("Outline Color", Color) = (0,0,0,1)
_OutlineTex ("Outline Texture", 2D) = "white" { }
_OutlineUVSpeedX ("Outline UV Speed X", Range(-5, 5)) = 0
_OutlineUVSpeedY ("Outline UV Speed Y", Range(-5, 5)) = 0
_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
_Bevel ("Bevel", Range(0, 1)) = 0.5
_BevelOffset ("Bevel Offset", Range(-0.5, 0.5)) = 0
_BevelWidth ("Bevel Width", Range(-0.5, 0.5)) = 0
_BevelClamp ("Bevel Clamp", Range(0, 1)) = 0
_BevelRoundness ("Bevel Roundness", Range(0, 1)) = 0
_BumpMap ("Normalmap", 2D) = "bump" { }
_BumpOutline ("Bump Outline", Range(0, 1)) = 0.5
_BumpFace ("Bump Face", Range(0, 1)) = 0.5
_ReflectFaceColor ("Face Color", Color) = (0,0,0,1)
_ReflectOutlineColor ("Outline Color", Color) = (0,0,0,1)
_Cube ("Reflection Cubemap", Cube) = "black" { }
_EnvMatrixRotation ("Texture Rotation", Vector) = (0,0,0,0)
_SpecColor ("Specular Color", Color) = (0,0,0,1)
_FaceShininess ("Face Shininess", Range(0, 1)) = 0
_OutlineShininess ("Outline Shininess", Range(0, 1)) = 0
_GlowColor ("Color", Color) = (0,1,0,0.5)
_GlowOffset ("Offset", Range(-1, 1)) = 0
_GlowInner ("Inner", Range(0, 1)) = 0.05
_GlowOuter ("Outer", Range(0, 1)) = 0.05
_GlowPower ("Falloff", Range(1, 0)) = 0.75
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
}
SubShader {
 LOD 300
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 19269
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
vec3 u_xlat9;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat2.x = u_xlat21 * u_xlat22;
    u_xlat9.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = u_xlat9.x * u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22 + (-u_xlat2.x);
    u_xlat9.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat9.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3 = u_xlat0.xxxx * u_xlat3.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat22 = dot(u_xlat3.xyw, u_xlat9.xyz);
    vs_TEXCOORD5.y = abs(u_xlat22) * u_xlat21 + u_xlat2.x;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD4.z = u_xlat3.w;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat16_5 = u_xlat3.y * u_xlat3.y;
    u_xlat16_5 = u_xlat3.x * u_xlat3.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat3.ywzx * u_xlat3;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD7.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform mediump samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
float u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
float u_xlat36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat16_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat30 = (-u_xlat16_30) + 0.5;
    u_xlat30 = u_xlat30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5 = min(u_xlat2.x, 1.0);
    u_xlat16_5 = sqrt(u_xlat16_5);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat12.xyz = u_xlat16_3.xyz * _OutlineColor.xyz;
    u_xlat3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat13 = u_xlat16_3.w * u_xlat3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_4 * u_xlat5;
    u_xlat16_7.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat12.xyz * vec3(u_xlat13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat3.x * u_xlat16_3.w + (-u_xlat6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat5.w * u_xlat16_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat16_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_7.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_7.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat16_7.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat6.x = log2(u_xlat16_1.x);
    u_xlat16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat6.x = u_xlat6.x * u_xlat16_1.x;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat8.xyz = u_xlat16_2.xyz / vec3(u_xlat36);
    u_xlat16_11.xyz = u_xlat8.xyz * _LightColor0.xyz;
    u_xlat6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_1.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat8.xyz * u_xlat9.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat16_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
vec3 u_xlat9;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat2.x = u_xlat21 * u_xlat22;
    u_xlat9.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = u_xlat9.x * u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22 + (-u_xlat2.x);
    u_xlat9.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat9.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3 = u_xlat0.xxxx * u_xlat3.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat22 = dot(u_xlat3.xyw, u_xlat9.xyz);
    vs_TEXCOORD5.y = abs(u_xlat22) * u_xlat21 + u_xlat2.x;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD4.z = u_xlat3.w;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat16_5 = u_xlat3.y * u_xlat3.y;
    u_xlat16_5 = u_xlat3.x * u_xlat3.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat3.ywzx * u_xlat3;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD7.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform mediump samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
float u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
float u_xlat36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat16_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat30 = (-u_xlat16_30) + 0.5;
    u_xlat30 = u_xlat30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5 = min(u_xlat2.x, 1.0);
    u_xlat16_5 = sqrt(u_xlat16_5);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat12.xyz = u_xlat16_3.xyz * _OutlineColor.xyz;
    u_xlat3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat13 = u_xlat16_3.w * u_xlat3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_4 * u_xlat5;
    u_xlat16_7.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat12.xyz * vec3(u_xlat13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat3.x * u_xlat16_3.w + (-u_xlat6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat5.w * u_xlat16_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat16_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_7.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_7.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat16_7.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat6.x = log2(u_xlat16_1.x);
    u_xlat16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat6.x = u_xlat6.x * u_xlat16_1.x;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat8.xyz = u_xlat16_2.xyz / vec3(u_xlat36);
    u_xlat16_11.xyz = u_xlat8.xyz * _LightColor0.xyz;
    u_xlat6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_1.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat8.xyz * u_xlat9.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat16_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
vec3 u_xlat9;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat2.x = u_xlat21 * u_xlat22;
    u_xlat9.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = u_xlat9.x * u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22 + (-u_xlat2.x);
    u_xlat9.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat9.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3 = u_xlat0.xxxx * u_xlat3.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat22 = dot(u_xlat3.xyw, u_xlat9.xyz);
    vs_TEXCOORD5.y = abs(u_xlat22) * u_xlat21 + u_xlat2.x;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD4.z = u_xlat3.w;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat16_5 = u_xlat3.y * u_xlat3.y;
    u_xlat16_5 = u_xlat3.x * u_xlat3.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat3.ywzx * u_xlat3;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD7.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform mediump samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
float u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
float u_xlat36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat16_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat30 = (-u_xlat16_30) + 0.5;
    u_xlat30 = u_xlat30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5 = min(u_xlat2.x, 1.0);
    u_xlat16_5 = sqrt(u_xlat16_5);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat12.xyz = u_xlat16_3.xyz * _OutlineColor.xyz;
    u_xlat3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat13 = u_xlat16_3.w * u_xlat3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_4 * u_xlat5;
    u_xlat16_7.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat12.xyz * vec3(u_xlat13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat3.x * u_xlat16_3.w + (-u_xlat6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat5.w * u_xlat16_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat16_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_7.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_7.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat16_7.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat6.x = log2(u_xlat16_1.x);
    u_xlat16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat6.x = u_xlat6.x * u_xlat16_1.x;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat8.xyz = u_xlat16_2.xyz / vec3(u_xlat36);
    u_xlat16_11.xyz = u_xlat8.xyz * _LightColor0.xyz;
    u_xlat6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_1.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat8.xyz * u_xlat9.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat16_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "DIRECTIONAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "DIRECTIONAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "DIRECTIONAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
vec3 u_xlat9;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat2.x = u_xlat21 * u_xlat22;
    u_xlat9.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = u_xlat9.x * u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22 + (-u_xlat2.x);
    u_xlat9.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat9.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3 = u_xlat0.xxxx * u_xlat3.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat22 = dot(u_xlat3.xyw, u_xlat9.xyz);
    vs_TEXCOORD5.y = abs(u_xlat22) * u_xlat21 + u_xlat2.x;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD4.z = u_xlat3.w;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat16_5 = u_xlat3.y * u_xlat3.y;
    u_xlat16_5 = u_xlat3.x * u_xlat3.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat3.ywzx * u_xlat3;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD7.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform mediump samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
float u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
float u_xlat36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat16_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat30 = (-u_xlat16_30) + 0.5;
    u_xlat30 = u_xlat30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5 = min(u_xlat2.x, 1.0);
    u_xlat16_5 = sqrt(u_xlat16_5);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat12.xyz = u_xlat16_3.xyz * _OutlineColor.xyz;
    u_xlat3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat13 = u_xlat16_3.w * u_xlat3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_4 * u_xlat5;
    u_xlat16_7.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat12.xyz * vec3(u_xlat13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat3.x * u_xlat16_3.w + (-u_xlat6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat5.w * u_xlat16_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat16_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_7.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_7.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat16_7.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat6.x = log2(u_xlat16_1.x);
    u_xlat16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat6.x = u_xlat6.x * u_xlat16_1.x;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat8.xyz = u_xlat16_2.xyz / vec3(u_xlat36);
    u_xlat16_11.xyz = u_xlat8.xyz * _LightColor0.xyz;
    u_xlat6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_1.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat8.xyz * u_xlat9.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat16_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
vec3 u_xlat9;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat2.x = u_xlat21 * u_xlat22;
    u_xlat9.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = u_xlat9.x * u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22 + (-u_xlat2.x);
    u_xlat9.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat9.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3 = u_xlat0.xxxx * u_xlat3.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat22 = dot(u_xlat3.xyw, u_xlat9.xyz);
    vs_TEXCOORD5.y = abs(u_xlat22) * u_xlat21 + u_xlat2.x;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD4.z = u_xlat3.w;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat16_5 = u_xlat3.y * u_xlat3.y;
    u_xlat16_5 = u_xlat3.x * u_xlat3.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat3.ywzx * u_xlat3;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD7.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform mediump samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
float u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
float u_xlat36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat16_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat30 = (-u_xlat16_30) + 0.5;
    u_xlat30 = u_xlat30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5 = min(u_xlat2.x, 1.0);
    u_xlat16_5 = sqrt(u_xlat16_5);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat12.xyz = u_xlat16_3.xyz * _OutlineColor.xyz;
    u_xlat3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat13 = u_xlat16_3.w * u_xlat3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_4 * u_xlat5;
    u_xlat16_7.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat12.xyz * vec3(u_xlat13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat3.x * u_xlat16_3.w + (-u_xlat6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat5.w * u_xlat16_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat16_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_7.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_7.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat16_7.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat6.x = log2(u_xlat16_1.x);
    u_xlat16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat6.x = u_xlat6.x * u_xlat16_1.x;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat8.xyz = u_xlat16_2.xyz / vec3(u_xlat36);
    u_xlat16_11.xyz = u_xlat8.xyz * _LightColor0.xyz;
    u_xlat6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_1.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat8.xyz * u_xlat9.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat16_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
vec3 u_xlat9;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat2.x = u_xlat21 * u_xlat22;
    u_xlat9.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = u_xlat9.x * u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22 + (-u_xlat2.x);
    u_xlat9.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat9.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3 = u_xlat0.xxxx * u_xlat3.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat22 = dot(u_xlat3.xyw, u_xlat9.xyz);
    vs_TEXCOORD5.y = abs(u_xlat22) * u_xlat21 + u_xlat2.x;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD4.z = u_xlat3.w;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat16_5 = u_xlat3.y * u_xlat3.y;
    u_xlat16_5 = u_xlat3.x * u_xlat3.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat3.ywzx * u_xlat3;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD7.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform mediump samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
float u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
float u_xlat36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat16_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat30 = (-u_xlat16_30) + 0.5;
    u_xlat30 = u_xlat30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5 = min(u_xlat2.x, 1.0);
    u_xlat16_5 = sqrt(u_xlat16_5);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat12.xyz = u_xlat16_3.xyz * _OutlineColor.xyz;
    u_xlat3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat13 = u_xlat16_3.w * u_xlat3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_4 * u_xlat5;
    u_xlat16_7.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat12.xyz * vec3(u_xlat13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat3.x * u_xlat16_3.w + (-u_xlat6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat5.w * u_xlat16_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat16_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_7.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_7.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat16_7.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat6.x = log2(u_xlat16_1.x);
    u_xlat16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat6.x = u_xlat6.x * u_xlat16_1.x;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat8.xyz = u_xlat16_2.xyz / vec3(u_xlat36);
    u_xlat16_11.xyz = u_xlat8.xyz * _LightColor0.xyz;
    u_xlat6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_1.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat8.xyz * u_xlat9.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat16_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
vec3 u_xlat9;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat2.x = u_xlat21 * u_xlat22;
    u_xlat9.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = u_xlat9.x * u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22 + (-u_xlat2.x);
    u_xlat9.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat9.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3 = u_xlat0.xxxx * u_xlat3.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat22 = dot(u_xlat3.xyw, u_xlat9.xyz);
    vs_TEXCOORD5.y = abs(u_xlat22) * u_xlat21 + u_xlat2.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.z = u_xlat3.w;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat2 = u_xlat3.yyyy * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat2 = u_xlat4 * u_xlat3.xxxx + u_xlat2;
    u_xlat0 = u_xlat4 * u_xlat4 + u_xlat0;
    u_xlat0 = u_xlat1 * u_xlat1 + u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3.wwzw + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.x = u_xlat3.y * u_xlat3.y;
    u_xlat16_5.x = u_xlat3.x * u_xlat3.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat3.ywzx * u_xlat3;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_5.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform mediump samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
float u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
float u_xlat36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat16_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat30 = (-u_xlat16_30) + 0.5;
    u_xlat30 = u_xlat30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5 = min(u_xlat2.x, 1.0);
    u_xlat16_5 = sqrt(u_xlat16_5);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat12.xyz = u_xlat16_3.xyz * _OutlineColor.xyz;
    u_xlat3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat13 = u_xlat16_3.w * u_xlat3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_4 * u_xlat5;
    u_xlat16_7.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat12.xyz * vec3(u_xlat13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat3.x * u_xlat16_3.w + (-u_xlat6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat5.w * u_xlat16_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat16_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_7.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_7.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat16_7.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat6.x = log2(u_xlat16_1.x);
    u_xlat16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat6.x = u_xlat6.x * u_xlat16_1.x;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat8.xyz = u_xlat16_2.xyz / vec3(u_xlat36);
    u_xlat16_11.xyz = u_xlat8.xyz * _LightColor0.xyz;
    u_xlat6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_1.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat8.xyz * u_xlat9.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat16_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
vec3 u_xlat9;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat2.x = u_xlat21 * u_xlat22;
    u_xlat9.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = u_xlat9.x * u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22 + (-u_xlat2.x);
    u_xlat9.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat9.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3 = u_xlat0.xxxx * u_xlat3.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat22 = dot(u_xlat3.xyw, u_xlat9.xyz);
    vs_TEXCOORD5.y = abs(u_xlat22) * u_xlat21 + u_xlat2.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.z = u_xlat3.w;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat2 = u_xlat3.yyyy * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat2 = u_xlat4 * u_xlat3.xxxx + u_xlat2;
    u_xlat0 = u_xlat4 * u_xlat4 + u_xlat0;
    u_xlat0 = u_xlat1 * u_xlat1 + u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3.wwzw + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.x = u_xlat3.y * u_xlat3.y;
    u_xlat16_5.x = u_xlat3.x * u_xlat3.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat3.ywzx * u_xlat3;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_5.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform mediump samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
float u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
float u_xlat36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat16_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat30 = (-u_xlat16_30) + 0.5;
    u_xlat30 = u_xlat30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5 = min(u_xlat2.x, 1.0);
    u_xlat16_5 = sqrt(u_xlat16_5);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat12.xyz = u_xlat16_3.xyz * _OutlineColor.xyz;
    u_xlat3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat13 = u_xlat16_3.w * u_xlat3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_4 * u_xlat5;
    u_xlat16_7.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat12.xyz * vec3(u_xlat13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat3.x * u_xlat16_3.w + (-u_xlat6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat5.w * u_xlat16_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat16_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_7.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_7.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat16_7.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat6.x = log2(u_xlat16_1.x);
    u_xlat16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat6.x = u_xlat6.x * u_xlat16_1.x;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat8.xyz = u_xlat16_2.xyz / vec3(u_xlat36);
    u_xlat16_11.xyz = u_xlat8.xyz * _LightColor0.xyz;
    u_xlat6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_1.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat8.xyz * u_xlat9.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat16_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
vec3 u_xlat9;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat2.x = u_xlat21 * u_xlat22;
    u_xlat9.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = u_xlat9.x * u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22 + (-u_xlat2.x);
    u_xlat9.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat9.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3 = u_xlat0.xxxx * u_xlat3.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat22 = dot(u_xlat3.xyw, u_xlat9.xyz);
    vs_TEXCOORD5.y = abs(u_xlat22) * u_xlat21 + u_xlat2.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.z = u_xlat3.w;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat2 = u_xlat3.yyyy * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat2 = u_xlat4 * u_xlat3.xxxx + u_xlat2;
    u_xlat0 = u_xlat4 * u_xlat4 + u_xlat0;
    u_xlat0 = u_xlat1 * u_xlat1 + u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3.wwzw + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.x = u_xlat3.y * u_xlat3.y;
    u_xlat16_5.x = u_xlat3.x * u_xlat3.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat3.ywzx * u_xlat3;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_5.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform mediump samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
float u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
float u_xlat36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat16_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat30 = (-u_xlat16_30) + 0.5;
    u_xlat30 = u_xlat30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5 = min(u_xlat2.x, 1.0);
    u_xlat16_5 = sqrt(u_xlat16_5);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat12.xyz = u_xlat16_3.xyz * _OutlineColor.xyz;
    u_xlat3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat13 = u_xlat16_3.w * u_xlat3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_4 * u_xlat5;
    u_xlat16_7.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat12.xyz * vec3(u_xlat13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat3.x * u_xlat16_3.w + (-u_xlat6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat5.w * u_xlat16_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat16_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_7.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_7.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat16_7.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat6.x = log2(u_xlat16_1.x);
    u_xlat16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat6.x = u_xlat6.x * u_xlat16_1.x;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat8.xyz = u_xlat16_2.xyz / vec3(u_xlat36);
    u_xlat16_11.xyz = u_xlat8.xyz * _LightColor0.xyz;
    u_xlat6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_1.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat8.xyz * u_xlat9.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat16_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
 Pass {
  Name "FORWARD"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 122792
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat7;
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
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat12 * u_xlat7;
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat7);
    u_xlat2.xzw = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xzw;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xzw;
    u_xlat2.xzw = u_xlat2.xzw + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xzw;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat3.xyz = (-u_xlat2.xzw) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xzw;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat2.x = dot(u_xlat0.yzx, u_xlat2.xzw);
    vs_TEXCOORD6.y = abs(u_xlat2.x) * u_xlat15 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat2.x + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat15 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat3.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat3.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_TEXCOORD8.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat8.x + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat8.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xx).x;
    u_xlat16_4.xyz = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat7;
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
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat12 * u_xlat7;
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat7);
    u_xlat2.xzw = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xzw;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xzw;
    u_xlat2.xzw = u_xlat2.xzw + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xzw;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat3.xyz = (-u_xlat2.xzw) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xzw;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat2.x = dot(u_xlat0.yzx, u_xlat2.xzw);
    vs_TEXCOORD6.y = abs(u_xlat2.x) * u_xlat15 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat2.x + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat15 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat3.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat3.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_TEXCOORD8.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat8.x + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat8.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xx).x;
    u_xlat16_4.xyz = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat7;
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
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat12 * u_xlat7;
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat7);
    u_xlat2.xzw = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xzw;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xzw;
    u_xlat2.xzw = u_xlat2.xzw + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xzw;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat3.xyz = (-u_xlat2.xzw) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xzw;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat2.x = dot(u_xlat0.yzx, u_xlat2.xzw);
    vs_TEXCOORD6.y = abs(u_xlat2.x) * u_xlat15 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat2.x + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat15 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat3.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat3.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_TEXCOORD8.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat8.x + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat8.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xx).x;
    u_xlat16_4.xyz = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "POINT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "POINT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "POINT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
vec3 u_xlat6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat2.x = u_xlat12 * u_xlat13;
    u_xlat6.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = u_xlat6.x * u_xlat2.x;
    u_xlat12 = u_xlat12 * u_xlat13 + (-u_xlat2.x);
    u_xlat6.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat6.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat6.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat6.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat6.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat6.zzz + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
float u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
mediump float u_xlat16_28;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat29) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8 = u_xlat24 * u_xlat8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8 * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_4.xzw = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xzw;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat5.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
vec3 u_xlat6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat2.x = u_xlat12 * u_xlat13;
    u_xlat6.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = u_xlat6.x * u_xlat2.x;
    u_xlat12 = u_xlat12 * u_xlat13 + (-u_xlat2.x);
    u_xlat6.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat6.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat6.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat6.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat6.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat6.zzz + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
float u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
mediump float u_xlat16_28;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat29) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8 = u_xlat24 * u_xlat8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8 * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_4.xzw = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xzw;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat5.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
vec3 u_xlat6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat2.x = _Sharpness + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat2.x = u_xlat12 * u_xlat13;
    u_xlat6.x = (-_PerspectiveFilter) + 1.0;
    u_xlat2.x = u_xlat6.x * u_xlat2.x;
    u_xlat12 = u_xlat12 * u_xlat13 + (-u_xlat2.x);
    u_xlat6.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat6.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat6.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat6.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat6.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat6.zzz + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
float u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
mediump float u_xlat16_28;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat29) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8 = u_xlat24 * u_xlat8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8 * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_4.xzw = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xzw;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat5.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "DIRECTIONAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "DIRECTIONAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "DIRECTIONAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat7;
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
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat12 * u_xlat7;
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat7);
    u_xlat2.xzw = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xzw;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xzw;
    u_xlat2.xzw = u_xlat2.xzw + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xzw;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat3.xyz = (-u_xlat2.xzw) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xzw;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat2.x = dot(u_xlat0.yzx, u_xlat2.xzw);
    vs_TEXCOORD6.y = abs(u_xlat2.x) * u_xlat15 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat2.x + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat15 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat3.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat3.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD8 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform highp sampler2D _LightTexture0;
UNITY_LOCATION(5) uniform highp sampler2D _LightTextureB0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
bool u_xlatb16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat8.x + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat8.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat8.xy = u_xlat8.xy + vec2(0.5, 0.5);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0<u_xlat2.z);
#else
    u_xlatb16 = 0.0<u_xlat2.z;
#endif
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = texture(_LightTextureB0, vec2(u_xlat24)).x;
    u_xlat16_4.x = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat16_4.x = u_xlat8.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat24 * u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat7;
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
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat12 * u_xlat7;
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat7);
    u_xlat2.xzw = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xzw;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xzw;
    u_xlat2.xzw = u_xlat2.xzw + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xzw;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat3.xyz = (-u_xlat2.xzw) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xzw;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat2.x = dot(u_xlat0.yzx, u_xlat2.xzw);
    vs_TEXCOORD6.y = abs(u_xlat2.x) * u_xlat15 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat2.x + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat15 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat3.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat3.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD8 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform highp sampler2D _LightTexture0;
UNITY_LOCATION(5) uniform highp sampler2D _LightTextureB0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
bool u_xlatb16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat8.x + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat8.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat8.xy = u_xlat8.xy + vec2(0.5, 0.5);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0<u_xlat2.z);
#else
    u_xlatb16 = 0.0<u_xlat2.z;
#endif
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = texture(_LightTextureB0, vec2(u_xlat24)).x;
    u_xlat16_4.x = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat16_4.x = u_xlat8.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat24 * u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat7;
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
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat12 * u_xlat7;
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat7);
    u_xlat2.xzw = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xzw;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xzw;
    u_xlat2.xzw = u_xlat2.xzw + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xzw;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat3.xyz = (-u_xlat2.xzw) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xzw;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat2.x = dot(u_xlat0.yzx, u_xlat2.xzw);
    vs_TEXCOORD6.y = abs(u_xlat2.x) * u_xlat15 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat2.x + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat15 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat3.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat3.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD8 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform highp sampler2D _LightTexture0;
UNITY_LOCATION(5) uniform highp sampler2D _LightTextureB0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
bool u_xlatb16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat8.x + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat8.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat8.xy = u_xlat8.xy + vec2(0.5, 0.5);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0<u_xlat2.z);
#else
    u_xlatb16 = 0.0<u_xlat2.z;
#endif
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = texture(_LightTextureB0, vec2(u_xlat24)).x;
    u_xlat16_4.x = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat16_4.x = u_xlat8.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat24 * u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "SPOT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "SPOT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "SPOT" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT_COOKIE" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat7;
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
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat12 * u_xlat7;
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat7);
    u_xlat2.xzw = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xzw;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xzw;
    u_xlat2.xzw = u_xlat2.xzw + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xzw;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat3.xyz = (-u_xlat2.xzw) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xzw;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat2.x = dot(u_xlat0.yzx, u_xlat2.xzw);
    vs_TEXCOORD6.y = abs(u_xlat2.x) * u_xlat15 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat2.x + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat15 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat3.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat3.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_TEXCOORD8.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform highp sampler2D _LightTextureB0;
UNITY_LOCATION(5) uniform highp samplerCube _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
float u_xlat16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat8.x + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat8.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xyz).w;
    u_xlat16 = texture(_LightTextureB0, u_xlat5.xx).x;
    u_xlat8.x = u_xlat8.x * u_xlat16;
    u_xlat16_4.xyz = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat7;
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
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat12 * u_xlat7;
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat7);
    u_xlat2.xzw = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xzw;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xzw;
    u_xlat2.xzw = u_xlat2.xzw + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xzw;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat3.xyz = (-u_xlat2.xzw) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xzw;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat2.x = dot(u_xlat0.yzx, u_xlat2.xzw);
    vs_TEXCOORD6.y = abs(u_xlat2.x) * u_xlat15 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat2.x + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat15 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat3.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat3.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_TEXCOORD8.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform highp sampler2D _LightTextureB0;
UNITY_LOCATION(5) uniform highp samplerCube _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
float u_xlat16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat8.x + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat8.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xyz).w;
    u_xlat16 = texture(_LightTextureB0, u_xlat5.xx).x;
    u_xlat8.x = u_xlat8.x * u_xlat16;
    u_xlat16_4.xyz = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat7;
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
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat12 * u_xlat7;
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat7);
    u_xlat2.xzw = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xzw;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xzw;
    u_xlat2.xzw = u_xlat2.xzw + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xzw;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat3.xyz = (-u_xlat2.xzw) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xzw;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat2.x = dot(u_xlat0.yzx, u_xlat2.xzw);
    vs_TEXCOORD6.y = abs(u_xlat2.x) * u_xlat15 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat2.x + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat15 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat3.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat3.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_TEXCOORD8.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform highp sampler2D _LightTextureB0;
UNITY_LOCATION(5) uniform highp samplerCube _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
float u_xlat16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat8.x + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat8.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xyz).w;
    u_xlat16 = texture(_LightTextureB0, u_xlat5.xx).x;
    u_xlat8.x = u_xlat8.x * u_xlat16;
    u_xlat16_4.xyz = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "POINT_COOKIE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "POINT_COOKIE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "POINT_COOKIE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD8;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat7;
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
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat12 * u_xlat7;
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat7);
    u_xlat2.xzw = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xzw;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xzw;
    u_xlat2.xzw = u_xlat2.xzw + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xzw;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat3.xyz = (-u_xlat2.xzw) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xzw;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat2.x = dot(u_xlat0.yzx, u_xlat2.xzw);
    vs_TEXCOORD6.y = abs(u_xlat2.x) * u_xlat15 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat2.x + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat15 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat3.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat3.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat1.zz + u_xlat0.xy;
    vs_TEXCOORD8.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat1.ww + u_xlat0.xy;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
mediump float u_xlat16_28;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat29) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat8.x + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat8.xy = vs_TEXCOORD5.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat8.xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat8.xy;
    u_xlat8.xy = u_xlat8.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
    u_xlat16_4.xzw = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xzw * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_4.xzw * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD8;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat7;
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
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat12 * u_xlat7;
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat7);
    u_xlat2.xzw = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xzw;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xzw;
    u_xlat2.xzw = u_xlat2.xzw + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xzw;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat3.xyz = (-u_xlat2.xzw) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xzw;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat2.x = dot(u_xlat0.yzx, u_xlat2.xzw);
    vs_TEXCOORD6.y = abs(u_xlat2.x) * u_xlat15 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat2.x + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat15 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat3.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat3.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat1.zz + u_xlat0.xy;
    vs_TEXCOORD8.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat1.ww + u_xlat0.xy;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
mediump float u_xlat16_28;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat29) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat8.x + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat8.xy = vs_TEXCOORD5.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat8.xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat8.xy;
    u_xlat8.xy = u_xlat8.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
    u_xlat16_4.xzw = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xzw * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_4.xzw * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	float _Sharpness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD8;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat7;
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
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat7 = _Sharpness + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat2.x;
    u_xlat7 = u_xlat15 * u_xlat2.x;
    u_xlat12 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat12 * u_xlat7;
    u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat7);
    u_xlat2.xzw = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xzw;
    u_xlat2.xzw = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xzw;
    u_xlat2.xzw = u_xlat2.xzw + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xzw;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat3.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat2.xzw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat3.xyz = (-u_xlat2.xzw) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xzw;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xzw = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat2.x = dot(u_xlat0.yzx, u_xlat2.xzw);
    vs_TEXCOORD6.y = abs(u_xlat2.x) * u_xlat15 + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat2.x = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat2.x + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat15 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat2.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat2.x;
    vs_TEXCOORD4.x = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat3.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat3.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat3.zzz + u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat1.zz + u_xlat0.xy;
    vs_TEXCOORD8.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat1.ww + u_xlat0.xy;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FaceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(4) uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
mediump float u_xlat16_28;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(1.0, 1.0) / vec2(_TextureWidth, _TextureHeight);
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat16_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat24 = (-u_xlat16_24) + 0.5;
    u_xlat24 = u_xlat24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat9.xyz = u_xlat16_2.xyz * _OutlineColor.xyz;
    u_xlat2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat10 = u_xlat16_2.w * u_xlat2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat16_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat5 = vs_COLOR0 * _FaceColor;
    u_xlat6 = u_xlat16_3 * u_xlat5;
    u_xlat16_12.xyz = u_xlat6.www * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat2.x * u_xlat16_2.w + (-u_xlat6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat5.w * u_xlat16_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat6.xyz * u_xlat6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat16_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat16_4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat29) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat16_4.x);
    u_xlat8.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat8.x + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat8.xy = vs_TEXCOORD5.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat8.xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat8.xy;
    u_xlat8.xy = u_xlat8.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
    u_xlat16_4.xzw = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xzw * _SpecColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat5.xyz = u_xlat16_1.xyz / vec3(u_xlat24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_4.xzw * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
 Pass {
  Name "Caster"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
  ColorMask RGB 0
  Cull Off
  Offset 1, 1
  Fog {
   Mode Off
  }
  GpuProgramID 184110
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _OutlineTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _OutlineTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _OutlineTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _OutlineTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _OutlineTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _OutlineTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
}
CustomEditor "TMPro.EditorUtilities.TMP_SDFShaderGUI"
}