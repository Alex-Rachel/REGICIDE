//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-GUIRoundedRect" {
Properties {
_MainTex ("Texture", any) = "white" { }
_SrcBlend ("SrcBlend", Float) = 5
_DstBlend ("DstBlend", Float) = 10
}
SubShader {
 Pass {
  Blend Zero Zero, One OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 3629
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform 	int _SmoothCorners;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
    u_xlat18 = (-u_xlat6.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat6.x==0.0);
#else
    u_xlatb6.x = u_xlat6.x==0.0;
#endif
    u_xlat18 = (_SmoothCorners != 0) ? u_xlat18 : 0.0;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : u_xlat18;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform 	int _SmoothCorners;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
    u_xlat18 = (-u_xlat6.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat6.x==0.0);
#else
    u_xlatb6.x = u_xlat6.x==0.0;
#endif
    u_xlat18 = (_SmoothCorners != 0) ? u_xlat18 : 0.0;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : u_xlat18;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform 	int _SmoothCorners;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
    u_xlat18 = (-u_xlat6.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat6.x==0.0);
#else
    u_xlatb6.x = u_xlat6.x==0.0;
#endif
    u_xlat18 = (_SmoothCorners != 0) ? u_xlat18 : 0.0;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : u_xlat18;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
SubShader {
 Pass {
  Blend Zero Zero, Zero Zero
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 83701
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform 	int _SmoothCorners;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
    u_xlat18 = (-u_xlat6.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat6.x==0.0);
#else
    u_xlatb6.x = u_xlat6.x==0.0;
#endif
    u_xlat18 = (_SmoothCorners != 0) ? u_xlat18 : 0.0;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : u_xlat18;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform 	int _SmoothCorners;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
    u_xlat18 = (-u_xlat6.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat6.x==0.0);
#else
    u_xlatb6.x = u_xlat6.x==0.0;
#endif
    u_xlat18 = (_SmoothCorners != 0) ? u_xlat18 : 0.0;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : u_xlat18;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform 	int _SmoothCorners;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
    u_xlat18 = (-u_xlat6.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat6.x==0.0);
#else
    u_xlatb6.x = u_xlat6.x==0.0;
#endif
    u_xlat18 = (_SmoothCorners != 0) ? u_xlat18 : 0.0;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : u_xlat18;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
Fallback "Hidden/Internal-GUITextureClip"
}