//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-GUIRoundedRectWithColorPerBorder" {
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
  GpuProgramID 54034
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
uniform 	vec4 _BorderColors[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
mediump vec4 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
int u_xlati4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec2 u_xlatb9;
float u_xlat10;
bool u_xlatb10;
int u_xlati12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
bool u_xlatb21;
int u_xlati22;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
float u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb30;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD2.x);
    u_xlat0.x = float(1.0) / abs(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_2.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = (_ManualTex2SRGB != 0) ? u_xlat9.xyz : u_xlat16_1.xyz;
    u_xlat9.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat9.x = (-_Rect[2]) * 0.5 + u_xlat9.x;
    u_xlat18 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat9.y = (-_Rect[3]) * 0.5 + u_xlat18;
    u_xlatb9.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlati1.xyz = (u_xlatb9.y) ? ivec3(0, 1, 2) : ivec3(3, 2, 8);
    u_xlati27 = (u_xlatb9.x) ? u_xlati1.x : u_xlati1.y;
    u_xlati1.x = (u_xlatb9.x) ? 1 : 4;
    u_xlat3.y = _Rect[0] + _CornerRadiuses[u_xlati27];
    u_xlat4.y = _Rect[1] + _CornerRadiuses[u_xlati27];
    u_xlat3.w = _BorderWidths[0] + _Rect[0];
    u_xlat4.w = _BorderWidths[1] + _Rect[1];
    u_xlat5.x = _Rect[0] + _Rect[2];
    u_xlat5.y = u_xlat5.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat5.w = u_xlat5.x + (-_BorderWidths[2]);
    u_xlat3.x = _Rect[0];
    u_xlat3.z = _BorderWidths[0];
    u_xlat5.z = _BorderWidths[2];
    u_xlat5 = (u_xlatb9.x) ? u_xlat3 : u_xlat5;
    u_xlat6.x = _Rect[1] + _Rect[3];
    u_xlat6.y = u_xlat6.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat6.w = u_xlat6.x + (-_BorderWidths[3]);
    u_xlat4.x = _Rect[1];
    u_xlat4.z = _BorderWidths[1];
    u_xlat6.z = _BorderWidths[3];
    u_xlat6 = (u_xlatb9.y) ? u_xlat4.yxzw : u_xlat6.yxzw;
    u_xlatb3.xy = greaterThanEqual(u_xlat5.ywyy, vs_TEXCOORD2.xxxx).xy;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.xxxx, u_xlat5.ywyy).xy;
    u_xlatb3.xy = (u_xlatb9.x) ? u_xlatb3.xy : u_xlatb4.xy;
    u_xlatb4.xy = greaterThanEqual(u_xlat6.xwxx, vs_TEXCOORD2.yyyy).xy;
    u_xlatb7.xy = greaterThanEqual(vs_TEXCOORD2.yyyy, u_xlat6.xwxx).xy;
    u_xlatb9.xy = (u_xlatb9.y) ? u_xlatb4.xy : u_xlatb7.xy;
    u_xlatb9.x = u_xlatb9.x && u_xlatb3.x;
    u_xlat10 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat10 = (-u_xlat10) + _Rect[2];
    u_xlat3.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat3.x = (-u_xlat3.x) + _Rect[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.x>=u_xlat3.w);
#else
    u_xlatb21 = vs_TEXCOORD2.x>=u_xlat3.w;
#endif
    u_xlat10 = u_xlat10 + u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10>=vs_TEXCOORD2.x);
#else
    u_xlatb10 = u_xlat10>=vs_TEXCOORD2.x;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.y>=u_xlat4.w);
#else
    u_xlatb21 = vs_TEXCOORD2.y>=u_xlat4.w;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
    u_xlat3.x = u_xlat3.x + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=vs_TEXCOORD2.y);
#else
    u_xlatb3.x = u_xlat3.x>=vs_TEXCOORD2.y;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb3.x;
    u_xlatb3.xz = equal(ivec4(u_xlati27), ivec4(0, 0, 2, 0)).xz;
    u_xlatb3.x = u_xlatb3.z || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_CornerRadiuses[u_xlati27]);
#else
    u_xlatb21 = 0.0<_CornerRadiuses[u_xlati27];
#endif
    u_xlatb21 = u_xlatb9.x && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<u_xlat5.z);
#else
    u_xlatb30 = 0.0<u_xlat5.z;
#endif
    u_xlati4 = u_xlatb30 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0<u_xlat6.z);
#else
    u_xlatb13 = 0.0<u_xlat6.z;
#endif
    u_xlati22 = u_xlatb13 ? 1 : int(0);
    u_xlati22 = u_xlati1.z * u_xlati22;
    u_xlati4 = u_xlati4 * u_xlati1.x + u_xlati22;
    u_xlatb12 = u_xlatb3.y && u_xlatb30;
    u_xlatb18 = u_xlatb9.y && u_xlatb13;
    u_xlati12 = u_xlatb12 ? 1 : int(0);
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlati18 = u_xlati1.z * u_xlati18;
    u_xlati18 = u_xlati12 * u_xlati1.x + u_xlati18;
    u_xlati18 = (u_xlatb10) ? 0 : u_xlati18;
    u_xlati18 = (u_xlatb21) ? u_xlati4 : u_xlati18;
    u_xlati12 = u_xlati1.z + u_xlati1.x;
    u_xlat3.x = (u_xlatb3.x) ? 1.0 : -1.0;
    u_xlat7.xz = u_xlat5.wy;
    u_xlat7.yw = u_xlat6.wx;
    u_xlat6.x = u_xlat5.x;
    u_xlat4.xz = (-u_xlat7.yx) + u_xlat6.yx;
    u_xlat3.xz = u_xlat3.xx * u_xlat4.xz;
    u_xlat4.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xz = u_xlat3.xz * u_xlat4.xx;
    u_xlat3.xz = u_xlat3.xz * vec2(100.0, 100.0) + u_xlat6.yx;
    u_xlat4.xz = (-u_xlat3.zx) + u_xlat6.xy;
    u_xlat3.xz = (-u_xlat3.xz) + vs_TEXCOORD2.yx;
    u_xlat21 = u_xlat3.z * u_xlat4.z;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + (-u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=0.0);
#else
    u_xlatb3.x = u_xlat3.x>=0.0;
#endif
    u_xlati1.x = (u_xlatb3.x) ? u_xlati1.x : u_xlati1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlati18!=u_xlati12);
#else
    u_xlatb19 = u_xlati18!=u_xlati12;
#endif
    u_xlati18 = (u_xlatb19) ? u_xlati18 : u_xlati1.x;
    if(u_xlati18 == 0) {
        u_xlat16_8.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
        u_xlat16_29 = u_xlat16_1.w * vs_COLOR0.w;
    } else {
        u_xlatb3.xyz = equal(ivec4(u_xlati18), ivec4(2, 4, 8, 0)).xyz;
        u_xlati18 = u_xlatb3.z ? 3 : int(0);
        u_xlati18 = (u_xlatb3.y) ? 2 : u_xlati18;
        u_xlati18 = (u_xlatb3.x) ? 1 : u_xlati18;
        u_xlat8.xyz = u_xlat16_2.xyz * _BorderColors[u_xlati18].xyz;
        u_xlat29 = u_xlat16_1.w * _BorderColors[u_xlati18].w;
        u_xlat16_8.xyz = u_xlat8.xyz;
        u_xlat16_29 = u_xlat29;
    }
    u_xlatb18 = u_xlatb30 || u_xlatb13;
    u_xlat3.xy = (-u_xlat7.zw) + vs_TEXCOORD2.xy;
    u_xlat1 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1 = sqrt(u_xlat1);
    u_xlat1 = u_xlat1 + (-_CornerRadiuses[u_xlati27]);
    u_xlat1 = u_xlat1 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat1 = u_xlatb18 ? u_xlat1 : float(0.0);
    u_xlat19 = (-u_xlat5.z) + _CornerRadiuses[u_xlati27];
    u_xlat27 = (-u_xlat6.z) + _CornerRadiuses[u_xlati27];
    u_xlat28 = u_xlat19 / u_xlat27;
    u_xlat3.z = u_xlat28 * u_xlat3.y;
    u_xlat28 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = (-u_xlat19) + u_xlat28;
    u_xlat0.x = u_xlat28 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0<u_xlat19);
#else
    u_xlatb19 = 0.0<u_xlat19;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0<u_xlat27);
#else
    u_xlatb27 = 0.0<u_xlat27;
#endif
    u_xlatb27 = u_xlatb27 && u_xlatb19;
    u_xlat0.x = (u_xlatb27) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1==0.0);
#else
    u_xlatb18 = u_xlat1==0.0;
#endif
    u_xlat27 = (-u_xlat1) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat27;
    u_xlat0.x = (u_xlatb9.x) ? u_xlat0.x : 1.0;
    u_xlat18 = u_xlat0.x * u_xlat16_29;
    u_xlat27 = (u_xlatb10) ? 0.0 : 1.0;
    u_xlat9.x = (u_xlatb9.x) ? 1.0 : u_xlat27;
    u_xlat0.z = u_xlat9.x * u_xlat18;
    u_xlat9.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_SrcBlend!=5);
#else
    u_xlatb1 = _SrcBlend!=5;
#endif
    u_xlat0.xz = u_xlat9.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat9.z * u_xlat0.x;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_8.xyz;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat0.xyw : u_xlat16_8.xyz;
    SV_Target0.w = u_xlat0.z;
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
uniform 	vec4 _BorderColors[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
mediump vec4 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
int u_xlati4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec2 u_xlatb9;
float u_xlat10;
bool u_xlatb10;
int u_xlati12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
bool u_xlatb21;
int u_xlati22;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
float u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb30;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD2.x);
    u_xlat0.x = float(1.0) / abs(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_2.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = (_ManualTex2SRGB != 0) ? u_xlat9.xyz : u_xlat16_1.xyz;
    u_xlat9.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat9.x = (-_Rect[2]) * 0.5 + u_xlat9.x;
    u_xlat18 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat9.y = (-_Rect[3]) * 0.5 + u_xlat18;
    u_xlatb9.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlati1.xyz = (u_xlatb9.y) ? ivec3(0, 1, 2) : ivec3(3, 2, 8);
    u_xlati27 = (u_xlatb9.x) ? u_xlati1.x : u_xlati1.y;
    u_xlati1.x = (u_xlatb9.x) ? 1 : 4;
    u_xlat3.y = _Rect[0] + _CornerRadiuses[u_xlati27];
    u_xlat4.y = _Rect[1] + _CornerRadiuses[u_xlati27];
    u_xlat3.w = _BorderWidths[0] + _Rect[0];
    u_xlat4.w = _BorderWidths[1] + _Rect[1];
    u_xlat5.x = _Rect[0] + _Rect[2];
    u_xlat5.y = u_xlat5.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat5.w = u_xlat5.x + (-_BorderWidths[2]);
    u_xlat3.x = _Rect[0];
    u_xlat3.z = _BorderWidths[0];
    u_xlat5.z = _BorderWidths[2];
    u_xlat5 = (u_xlatb9.x) ? u_xlat3 : u_xlat5;
    u_xlat6.x = _Rect[1] + _Rect[3];
    u_xlat6.y = u_xlat6.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat6.w = u_xlat6.x + (-_BorderWidths[3]);
    u_xlat4.x = _Rect[1];
    u_xlat4.z = _BorderWidths[1];
    u_xlat6.z = _BorderWidths[3];
    u_xlat6 = (u_xlatb9.y) ? u_xlat4.yxzw : u_xlat6.yxzw;
    u_xlatb3.xy = greaterThanEqual(u_xlat5.ywyy, vs_TEXCOORD2.xxxx).xy;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.xxxx, u_xlat5.ywyy).xy;
    u_xlatb3.xy = (u_xlatb9.x) ? u_xlatb3.xy : u_xlatb4.xy;
    u_xlatb4.xy = greaterThanEqual(u_xlat6.xwxx, vs_TEXCOORD2.yyyy).xy;
    u_xlatb7.xy = greaterThanEqual(vs_TEXCOORD2.yyyy, u_xlat6.xwxx).xy;
    u_xlatb9.xy = (u_xlatb9.y) ? u_xlatb4.xy : u_xlatb7.xy;
    u_xlatb9.x = u_xlatb9.x && u_xlatb3.x;
    u_xlat10 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat10 = (-u_xlat10) + _Rect[2];
    u_xlat3.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat3.x = (-u_xlat3.x) + _Rect[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.x>=u_xlat3.w);
#else
    u_xlatb21 = vs_TEXCOORD2.x>=u_xlat3.w;
#endif
    u_xlat10 = u_xlat10 + u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10>=vs_TEXCOORD2.x);
#else
    u_xlatb10 = u_xlat10>=vs_TEXCOORD2.x;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.y>=u_xlat4.w);
#else
    u_xlatb21 = vs_TEXCOORD2.y>=u_xlat4.w;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
    u_xlat3.x = u_xlat3.x + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=vs_TEXCOORD2.y);
#else
    u_xlatb3.x = u_xlat3.x>=vs_TEXCOORD2.y;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb3.x;
    u_xlatb3.xz = equal(ivec4(u_xlati27), ivec4(0, 0, 2, 0)).xz;
    u_xlatb3.x = u_xlatb3.z || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_CornerRadiuses[u_xlati27]);
#else
    u_xlatb21 = 0.0<_CornerRadiuses[u_xlati27];
#endif
    u_xlatb21 = u_xlatb9.x && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<u_xlat5.z);
#else
    u_xlatb30 = 0.0<u_xlat5.z;
#endif
    u_xlati4 = u_xlatb30 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0<u_xlat6.z);
#else
    u_xlatb13 = 0.0<u_xlat6.z;
#endif
    u_xlati22 = u_xlatb13 ? 1 : int(0);
    u_xlati22 = u_xlati1.z * u_xlati22;
    u_xlati4 = u_xlati4 * u_xlati1.x + u_xlati22;
    u_xlatb12 = u_xlatb3.y && u_xlatb30;
    u_xlatb18 = u_xlatb9.y && u_xlatb13;
    u_xlati12 = u_xlatb12 ? 1 : int(0);
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlati18 = u_xlati1.z * u_xlati18;
    u_xlati18 = u_xlati12 * u_xlati1.x + u_xlati18;
    u_xlati18 = (u_xlatb10) ? 0 : u_xlati18;
    u_xlati18 = (u_xlatb21) ? u_xlati4 : u_xlati18;
    u_xlati12 = u_xlati1.z + u_xlati1.x;
    u_xlat3.x = (u_xlatb3.x) ? 1.0 : -1.0;
    u_xlat7.xz = u_xlat5.wy;
    u_xlat7.yw = u_xlat6.wx;
    u_xlat6.x = u_xlat5.x;
    u_xlat4.xz = (-u_xlat7.yx) + u_xlat6.yx;
    u_xlat3.xz = u_xlat3.xx * u_xlat4.xz;
    u_xlat4.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xz = u_xlat3.xz * u_xlat4.xx;
    u_xlat3.xz = u_xlat3.xz * vec2(100.0, 100.0) + u_xlat6.yx;
    u_xlat4.xz = (-u_xlat3.zx) + u_xlat6.xy;
    u_xlat3.xz = (-u_xlat3.xz) + vs_TEXCOORD2.yx;
    u_xlat21 = u_xlat3.z * u_xlat4.z;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + (-u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=0.0);
#else
    u_xlatb3.x = u_xlat3.x>=0.0;
#endif
    u_xlati1.x = (u_xlatb3.x) ? u_xlati1.x : u_xlati1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlati18!=u_xlati12);
#else
    u_xlatb19 = u_xlati18!=u_xlati12;
#endif
    u_xlati18 = (u_xlatb19) ? u_xlati18 : u_xlati1.x;
    if(u_xlati18 == 0) {
        u_xlat16_8.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
        u_xlat16_29 = u_xlat16_1.w * vs_COLOR0.w;
    } else {
        u_xlatb3.xyz = equal(ivec4(u_xlati18), ivec4(2, 4, 8, 0)).xyz;
        u_xlati18 = u_xlatb3.z ? 3 : int(0);
        u_xlati18 = (u_xlatb3.y) ? 2 : u_xlati18;
        u_xlati18 = (u_xlatb3.x) ? 1 : u_xlati18;
        u_xlat8.xyz = u_xlat16_2.xyz * _BorderColors[u_xlati18].xyz;
        u_xlat29 = u_xlat16_1.w * _BorderColors[u_xlati18].w;
        u_xlat16_8.xyz = u_xlat8.xyz;
        u_xlat16_29 = u_xlat29;
    }
    u_xlatb18 = u_xlatb30 || u_xlatb13;
    u_xlat3.xy = (-u_xlat7.zw) + vs_TEXCOORD2.xy;
    u_xlat1 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1 = sqrt(u_xlat1);
    u_xlat1 = u_xlat1 + (-_CornerRadiuses[u_xlati27]);
    u_xlat1 = u_xlat1 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat1 = u_xlatb18 ? u_xlat1 : float(0.0);
    u_xlat19 = (-u_xlat5.z) + _CornerRadiuses[u_xlati27];
    u_xlat27 = (-u_xlat6.z) + _CornerRadiuses[u_xlati27];
    u_xlat28 = u_xlat19 / u_xlat27;
    u_xlat3.z = u_xlat28 * u_xlat3.y;
    u_xlat28 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = (-u_xlat19) + u_xlat28;
    u_xlat0.x = u_xlat28 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0<u_xlat19);
#else
    u_xlatb19 = 0.0<u_xlat19;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0<u_xlat27);
#else
    u_xlatb27 = 0.0<u_xlat27;
#endif
    u_xlatb27 = u_xlatb27 && u_xlatb19;
    u_xlat0.x = (u_xlatb27) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1==0.0);
#else
    u_xlatb18 = u_xlat1==0.0;
#endif
    u_xlat27 = (-u_xlat1) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat27;
    u_xlat0.x = (u_xlatb9.x) ? u_xlat0.x : 1.0;
    u_xlat18 = u_xlat0.x * u_xlat16_29;
    u_xlat27 = (u_xlatb10) ? 0.0 : 1.0;
    u_xlat9.x = (u_xlatb9.x) ? 1.0 : u_xlat27;
    u_xlat0.z = u_xlat9.x * u_xlat18;
    u_xlat9.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_SrcBlend!=5);
#else
    u_xlatb1 = _SrcBlend!=5;
#endif
    u_xlat0.xz = u_xlat9.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat9.z * u_xlat0.x;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_8.xyz;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat0.xyw : u_xlat16_8.xyz;
    SV_Target0.w = u_xlat0.z;
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
uniform 	vec4 _BorderColors[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
mediump vec4 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
int u_xlati4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec2 u_xlatb9;
float u_xlat10;
bool u_xlatb10;
int u_xlati12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
bool u_xlatb21;
int u_xlati22;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
float u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb30;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD2.x);
    u_xlat0.x = float(1.0) / abs(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_2.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = (_ManualTex2SRGB != 0) ? u_xlat9.xyz : u_xlat16_1.xyz;
    u_xlat9.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat9.x = (-_Rect[2]) * 0.5 + u_xlat9.x;
    u_xlat18 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat9.y = (-_Rect[3]) * 0.5 + u_xlat18;
    u_xlatb9.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlati1.xyz = (u_xlatb9.y) ? ivec3(0, 1, 2) : ivec3(3, 2, 8);
    u_xlati27 = (u_xlatb9.x) ? u_xlati1.x : u_xlati1.y;
    u_xlati1.x = (u_xlatb9.x) ? 1 : 4;
    u_xlat3.y = _Rect[0] + _CornerRadiuses[u_xlati27];
    u_xlat4.y = _Rect[1] + _CornerRadiuses[u_xlati27];
    u_xlat3.w = _BorderWidths[0] + _Rect[0];
    u_xlat4.w = _BorderWidths[1] + _Rect[1];
    u_xlat5.x = _Rect[0] + _Rect[2];
    u_xlat5.y = u_xlat5.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat5.w = u_xlat5.x + (-_BorderWidths[2]);
    u_xlat3.x = _Rect[0];
    u_xlat3.z = _BorderWidths[0];
    u_xlat5.z = _BorderWidths[2];
    u_xlat5 = (u_xlatb9.x) ? u_xlat3 : u_xlat5;
    u_xlat6.x = _Rect[1] + _Rect[3];
    u_xlat6.y = u_xlat6.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat6.w = u_xlat6.x + (-_BorderWidths[3]);
    u_xlat4.x = _Rect[1];
    u_xlat4.z = _BorderWidths[1];
    u_xlat6.z = _BorderWidths[3];
    u_xlat6 = (u_xlatb9.y) ? u_xlat4.yxzw : u_xlat6.yxzw;
    u_xlatb3.xy = greaterThanEqual(u_xlat5.ywyy, vs_TEXCOORD2.xxxx).xy;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.xxxx, u_xlat5.ywyy).xy;
    u_xlatb3.xy = (u_xlatb9.x) ? u_xlatb3.xy : u_xlatb4.xy;
    u_xlatb4.xy = greaterThanEqual(u_xlat6.xwxx, vs_TEXCOORD2.yyyy).xy;
    u_xlatb7.xy = greaterThanEqual(vs_TEXCOORD2.yyyy, u_xlat6.xwxx).xy;
    u_xlatb9.xy = (u_xlatb9.y) ? u_xlatb4.xy : u_xlatb7.xy;
    u_xlatb9.x = u_xlatb9.x && u_xlatb3.x;
    u_xlat10 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat10 = (-u_xlat10) + _Rect[2];
    u_xlat3.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat3.x = (-u_xlat3.x) + _Rect[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.x>=u_xlat3.w);
#else
    u_xlatb21 = vs_TEXCOORD2.x>=u_xlat3.w;
#endif
    u_xlat10 = u_xlat10 + u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10>=vs_TEXCOORD2.x);
#else
    u_xlatb10 = u_xlat10>=vs_TEXCOORD2.x;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.y>=u_xlat4.w);
#else
    u_xlatb21 = vs_TEXCOORD2.y>=u_xlat4.w;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
    u_xlat3.x = u_xlat3.x + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=vs_TEXCOORD2.y);
#else
    u_xlatb3.x = u_xlat3.x>=vs_TEXCOORD2.y;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb3.x;
    u_xlatb3.xz = equal(ivec4(u_xlati27), ivec4(0, 0, 2, 0)).xz;
    u_xlatb3.x = u_xlatb3.z || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_CornerRadiuses[u_xlati27]);
#else
    u_xlatb21 = 0.0<_CornerRadiuses[u_xlati27];
#endif
    u_xlatb21 = u_xlatb9.x && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<u_xlat5.z);
#else
    u_xlatb30 = 0.0<u_xlat5.z;
#endif
    u_xlati4 = u_xlatb30 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0<u_xlat6.z);
#else
    u_xlatb13 = 0.0<u_xlat6.z;
#endif
    u_xlati22 = u_xlatb13 ? 1 : int(0);
    u_xlati22 = u_xlati1.z * u_xlati22;
    u_xlati4 = u_xlati4 * u_xlati1.x + u_xlati22;
    u_xlatb12 = u_xlatb3.y && u_xlatb30;
    u_xlatb18 = u_xlatb9.y && u_xlatb13;
    u_xlati12 = u_xlatb12 ? 1 : int(0);
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlati18 = u_xlati1.z * u_xlati18;
    u_xlati18 = u_xlati12 * u_xlati1.x + u_xlati18;
    u_xlati18 = (u_xlatb10) ? 0 : u_xlati18;
    u_xlati18 = (u_xlatb21) ? u_xlati4 : u_xlati18;
    u_xlati12 = u_xlati1.z + u_xlati1.x;
    u_xlat3.x = (u_xlatb3.x) ? 1.0 : -1.0;
    u_xlat7.xz = u_xlat5.wy;
    u_xlat7.yw = u_xlat6.wx;
    u_xlat6.x = u_xlat5.x;
    u_xlat4.xz = (-u_xlat7.yx) + u_xlat6.yx;
    u_xlat3.xz = u_xlat3.xx * u_xlat4.xz;
    u_xlat4.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xz = u_xlat3.xz * u_xlat4.xx;
    u_xlat3.xz = u_xlat3.xz * vec2(100.0, 100.0) + u_xlat6.yx;
    u_xlat4.xz = (-u_xlat3.zx) + u_xlat6.xy;
    u_xlat3.xz = (-u_xlat3.xz) + vs_TEXCOORD2.yx;
    u_xlat21 = u_xlat3.z * u_xlat4.z;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + (-u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=0.0);
#else
    u_xlatb3.x = u_xlat3.x>=0.0;
#endif
    u_xlati1.x = (u_xlatb3.x) ? u_xlati1.x : u_xlati1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlati18!=u_xlati12);
#else
    u_xlatb19 = u_xlati18!=u_xlati12;
#endif
    u_xlati18 = (u_xlatb19) ? u_xlati18 : u_xlati1.x;
    if(u_xlati18 == 0) {
        u_xlat16_8.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
        u_xlat16_29 = u_xlat16_1.w * vs_COLOR0.w;
    } else {
        u_xlatb3.xyz = equal(ivec4(u_xlati18), ivec4(2, 4, 8, 0)).xyz;
        u_xlati18 = u_xlatb3.z ? 3 : int(0);
        u_xlati18 = (u_xlatb3.y) ? 2 : u_xlati18;
        u_xlati18 = (u_xlatb3.x) ? 1 : u_xlati18;
        u_xlat8.xyz = u_xlat16_2.xyz * _BorderColors[u_xlati18].xyz;
        u_xlat29 = u_xlat16_1.w * _BorderColors[u_xlati18].w;
        u_xlat16_8.xyz = u_xlat8.xyz;
        u_xlat16_29 = u_xlat29;
    }
    u_xlatb18 = u_xlatb30 || u_xlatb13;
    u_xlat3.xy = (-u_xlat7.zw) + vs_TEXCOORD2.xy;
    u_xlat1 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1 = sqrt(u_xlat1);
    u_xlat1 = u_xlat1 + (-_CornerRadiuses[u_xlati27]);
    u_xlat1 = u_xlat1 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat1 = u_xlatb18 ? u_xlat1 : float(0.0);
    u_xlat19 = (-u_xlat5.z) + _CornerRadiuses[u_xlati27];
    u_xlat27 = (-u_xlat6.z) + _CornerRadiuses[u_xlati27];
    u_xlat28 = u_xlat19 / u_xlat27;
    u_xlat3.z = u_xlat28 * u_xlat3.y;
    u_xlat28 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = (-u_xlat19) + u_xlat28;
    u_xlat0.x = u_xlat28 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0<u_xlat19);
#else
    u_xlatb19 = 0.0<u_xlat19;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0<u_xlat27);
#else
    u_xlatb27 = 0.0<u_xlat27;
#endif
    u_xlatb27 = u_xlatb27 && u_xlatb19;
    u_xlat0.x = (u_xlatb27) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1==0.0);
#else
    u_xlatb18 = u_xlat1==0.0;
#endif
    u_xlat27 = (-u_xlat1) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat27;
    u_xlat0.x = (u_xlatb9.x) ? u_xlat0.x : 1.0;
    u_xlat18 = u_xlat0.x * u_xlat16_29;
    u_xlat27 = (u_xlatb10) ? 0.0 : 1.0;
    u_xlat9.x = (u_xlatb9.x) ? 1.0 : u_xlat27;
    u_xlat0.z = u_xlat9.x * u_xlat18;
    u_xlat9.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_SrcBlend!=5);
#else
    u_xlatb1 = _SrcBlend!=5;
#endif
    u_xlat0.xz = u_xlat9.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat9.z * u_xlat0.x;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_8.xyz;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat0.xyw : u_xlat16_8.xyz;
    SV_Target0.w = u_xlat0.z;
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
  GpuProgramID 98697
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
uniform 	vec4 _BorderColors[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
mediump vec4 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
int u_xlati4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec2 u_xlatb9;
float u_xlat10;
bool u_xlatb10;
int u_xlati12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
bool u_xlatb21;
int u_xlati22;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
float u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb30;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD2.x);
    u_xlat0.x = float(1.0) / abs(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_2.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = (_ManualTex2SRGB != 0) ? u_xlat9.xyz : u_xlat16_1.xyz;
    u_xlat9.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat9.x = (-_Rect[2]) * 0.5 + u_xlat9.x;
    u_xlat18 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat9.y = (-_Rect[3]) * 0.5 + u_xlat18;
    u_xlatb9.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlati1.xyz = (u_xlatb9.y) ? ivec3(0, 1, 2) : ivec3(3, 2, 8);
    u_xlati27 = (u_xlatb9.x) ? u_xlati1.x : u_xlati1.y;
    u_xlati1.x = (u_xlatb9.x) ? 1 : 4;
    u_xlat3.y = _Rect[0] + _CornerRadiuses[u_xlati27];
    u_xlat4.y = _Rect[1] + _CornerRadiuses[u_xlati27];
    u_xlat3.w = _BorderWidths[0] + _Rect[0];
    u_xlat4.w = _BorderWidths[1] + _Rect[1];
    u_xlat5.x = _Rect[0] + _Rect[2];
    u_xlat5.y = u_xlat5.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat5.w = u_xlat5.x + (-_BorderWidths[2]);
    u_xlat3.x = _Rect[0];
    u_xlat3.z = _BorderWidths[0];
    u_xlat5.z = _BorderWidths[2];
    u_xlat5 = (u_xlatb9.x) ? u_xlat3 : u_xlat5;
    u_xlat6.x = _Rect[1] + _Rect[3];
    u_xlat6.y = u_xlat6.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat6.w = u_xlat6.x + (-_BorderWidths[3]);
    u_xlat4.x = _Rect[1];
    u_xlat4.z = _BorderWidths[1];
    u_xlat6.z = _BorderWidths[3];
    u_xlat6 = (u_xlatb9.y) ? u_xlat4.yxzw : u_xlat6.yxzw;
    u_xlatb3.xy = greaterThanEqual(u_xlat5.ywyy, vs_TEXCOORD2.xxxx).xy;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.xxxx, u_xlat5.ywyy).xy;
    u_xlatb3.xy = (u_xlatb9.x) ? u_xlatb3.xy : u_xlatb4.xy;
    u_xlatb4.xy = greaterThanEqual(u_xlat6.xwxx, vs_TEXCOORD2.yyyy).xy;
    u_xlatb7.xy = greaterThanEqual(vs_TEXCOORD2.yyyy, u_xlat6.xwxx).xy;
    u_xlatb9.xy = (u_xlatb9.y) ? u_xlatb4.xy : u_xlatb7.xy;
    u_xlatb9.x = u_xlatb9.x && u_xlatb3.x;
    u_xlat10 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat10 = (-u_xlat10) + _Rect[2];
    u_xlat3.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat3.x = (-u_xlat3.x) + _Rect[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.x>=u_xlat3.w);
#else
    u_xlatb21 = vs_TEXCOORD2.x>=u_xlat3.w;
#endif
    u_xlat10 = u_xlat10 + u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10>=vs_TEXCOORD2.x);
#else
    u_xlatb10 = u_xlat10>=vs_TEXCOORD2.x;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.y>=u_xlat4.w);
#else
    u_xlatb21 = vs_TEXCOORD2.y>=u_xlat4.w;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
    u_xlat3.x = u_xlat3.x + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=vs_TEXCOORD2.y);
#else
    u_xlatb3.x = u_xlat3.x>=vs_TEXCOORD2.y;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb3.x;
    u_xlatb3.xz = equal(ivec4(u_xlati27), ivec4(0, 0, 2, 0)).xz;
    u_xlatb3.x = u_xlatb3.z || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_CornerRadiuses[u_xlati27]);
#else
    u_xlatb21 = 0.0<_CornerRadiuses[u_xlati27];
#endif
    u_xlatb21 = u_xlatb9.x && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<u_xlat5.z);
#else
    u_xlatb30 = 0.0<u_xlat5.z;
#endif
    u_xlati4 = u_xlatb30 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0<u_xlat6.z);
#else
    u_xlatb13 = 0.0<u_xlat6.z;
#endif
    u_xlati22 = u_xlatb13 ? 1 : int(0);
    u_xlati22 = u_xlati1.z * u_xlati22;
    u_xlati4 = u_xlati4 * u_xlati1.x + u_xlati22;
    u_xlatb12 = u_xlatb3.y && u_xlatb30;
    u_xlatb18 = u_xlatb9.y && u_xlatb13;
    u_xlati12 = u_xlatb12 ? 1 : int(0);
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlati18 = u_xlati1.z * u_xlati18;
    u_xlati18 = u_xlati12 * u_xlati1.x + u_xlati18;
    u_xlati18 = (u_xlatb10) ? 0 : u_xlati18;
    u_xlati18 = (u_xlatb21) ? u_xlati4 : u_xlati18;
    u_xlati12 = u_xlati1.z + u_xlati1.x;
    u_xlat3.x = (u_xlatb3.x) ? 1.0 : -1.0;
    u_xlat7.xz = u_xlat5.wy;
    u_xlat7.yw = u_xlat6.wx;
    u_xlat6.x = u_xlat5.x;
    u_xlat4.xz = (-u_xlat7.yx) + u_xlat6.yx;
    u_xlat3.xz = u_xlat3.xx * u_xlat4.xz;
    u_xlat4.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xz = u_xlat3.xz * u_xlat4.xx;
    u_xlat3.xz = u_xlat3.xz * vec2(100.0, 100.0) + u_xlat6.yx;
    u_xlat4.xz = (-u_xlat3.zx) + u_xlat6.xy;
    u_xlat3.xz = (-u_xlat3.xz) + vs_TEXCOORD2.yx;
    u_xlat21 = u_xlat3.z * u_xlat4.z;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + (-u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=0.0);
#else
    u_xlatb3.x = u_xlat3.x>=0.0;
#endif
    u_xlati1.x = (u_xlatb3.x) ? u_xlati1.x : u_xlati1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlati18!=u_xlati12);
#else
    u_xlatb19 = u_xlati18!=u_xlati12;
#endif
    u_xlati18 = (u_xlatb19) ? u_xlati18 : u_xlati1.x;
    if(u_xlati18 == 0) {
        u_xlat16_8.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
        u_xlat16_29 = u_xlat16_1.w * vs_COLOR0.w;
    } else {
        u_xlatb3.xyz = equal(ivec4(u_xlati18), ivec4(2, 4, 8, 0)).xyz;
        u_xlati18 = u_xlatb3.z ? 3 : int(0);
        u_xlati18 = (u_xlatb3.y) ? 2 : u_xlati18;
        u_xlati18 = (u_xlatb3.x) ? 1 : u_xlati18;
        u_xlat8.xyz = u_xlat16_2.xyz * _BorderColors[u_xlati18].xyz;
        u_xlat29 = u_xlat16_1.w * _BorderColors[u_xlati18].w;
        u_xlat16_8.xyz = u_xlat8.xyz;
        u_xlat16_29 = u_xlat29;
    }
    u_xlatb18 = u_xlatb30 || u_xlatb13;
    u_xlat3.xy = (-u_xlat7.zw) + vs_TEXCOORD2.xy;
    u_xlat1 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1 = sqrt(u_xlat1);
    u_xlat1 = u_xlat1 + (-_CornerRadiuses[u_xlati27]);
    u_xlat1 = u_xlat1 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat1 = u_xlatb18 ? u_xlat1 : float(0.0);
    u_xlat19 = (-u_xlat5.z) + _CornerRadiuses[u_xlati27];
    u_xlat27 = (-u_xlat6.z) + _CornerRadiuses[u_xlati27];
    u_xlat28 = u_xlat19 / u_xlat27;
    u_xlat3.z = u_xlat28 * u_xlat3.y;
    u_xlat28 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = (-u_xlat19) + u_xlat28;
    u_xlat0.x = u_xlat28 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0<u_xlat19);
#else
    u_xlatb19 = 0.0<u_xlat19;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0<u_xlat27);
#else
    u_xlatb27 = 0.0<u_xlat27;
#endif
    u_xlatb27 = u_xlatb27 && u_xlatb19;
    u_xlat0.x = (u_xlatb27) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1==0.0);
#else
    u_xlatb18 = u_xlat1==0.0;
#endif
    u_xlat27 = (-u_xlat1) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat27;
    u_xlat0.x = (u_xlatb9.x) ? u_xlat0.x : 1.0;
    u_xlat18 = u_xlat0.x * u_xlat16_29;
    u_xlat27 = (u_xlatb10) ? 0.0 : 1.0;
    u_xlat9.x = (u_xlatb9.x) ? 1.0 : u_xlat27;
    u_xlat0.z = u_xlat9.x * u_xlat18;
    u_xlat9.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_SrcBlend!=5);
#else
    u_xlatb1 = _SrcBlend!=5;
#endif
    u_xlat0.xz = u_xlat9.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat9.z * u_xlat0.x;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_8.xyz;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat0.xyw : u_xlat16_8.xyz;
    SV_Target0.w = u_xlat0.z;
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
uniform 	vec4 _BorderColors[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
mediump vec4 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
int u_xlati4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec2 u_xlatb9;
float u_xlat10;
bool u_xlatb10;
int u_xlati12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
bool u_xlatb21;
int u_xlati22;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
float u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb30;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD2.x);
    u_xlat0.x = float(1.0) / abs(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_2.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = (_ManualTex2SRGB != 0) ? u_xlat9.xyz : u_xlat16_1.xyz;
    u_xlat9.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat9.x = (-_Rect[2]) * 0.5 + u_xlat9.x;
    u_xlat18 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat9.y = (-_Rect[3]) * 0.5 + u_xlat18;
    u_xlatb9.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlati1.xyz = (u_xlatb9.y) ? ivec3(0, 1, 2) : ivec3(3, 2, 8);
    u_xlati27 = (u_xlatb9.x) ? u_xlati1.x : u_xlati1.y;
    u_xlati1.x = (u_xlatb9.x) ? 1 : 4;
    u_xlat3.y = _Rect[0] + _CornerRadiuses[u_xlati27];
    u_xlat4.y = _Rect[1] + _CornerRadiuses[u_xlati27];
    u_xlat3.w = _BorderWidths[0] + _Rect[0];
    u_xlat4.w = _BorderWidths[1] + _Rect[1];
    u_xlat5.x = _Rect[0] + _Rect[2];
    u_xlat5.y = u_xlat5.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat5.w = u_xlat5.x + (-_BorderWidths[2]);
    u_xlat3.x = _Rect[0];
    u_xlat3.z = _BorderWidths[0];
    u_xlat5.z = _BorderWidths[2];
    u_xlat5 = (u_xlatb9.x) ? u_xlat3 : u_xlat5;
    u_xlat6.x = _Rect[1] + _Rect[3];
    u_xlat6.y = u_xlat6.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat6.w = u_xlat6.x + (-_BorderWidths[3]);
    u_xlat4.x = _Rect[1];
    u_xlat4.z = _BorderWidths[1];
    u_xlat6.z = _BorderWidths[3];
    u_xlat6 = (u_xlatb9.y) ? u_xlat4.yxzw : u_xlat6.yxzw;
    u_xlatb3.xy = greaterThanEqual(u_xlat5.ywyy, vs_TEXCOORD2.xxxx).xy;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.xxxx, u_xlat5.ywyy).xy;
    u_xlatb3.xy = (u_xlatb9.x) ? u_xlatb3.xy : u_xlatb4.xy;
    u_xlatb4.xy = greaterThanEqual(u_xlat6.xwxx, vs_TEXCOORD2.yyyy).xy;
    u_xlatb7.xy = greaterThanEqual(vs_TEXCOORD2.yyyy, u_xlat6.xwxx).xy;
    u_xlatb9.xy = (u_xlatb9.y) ? u_xlatb4.xy : u_xlatb7.xy;
    u_xlatb9.x = u_xlatb9.x && u_xlatb3.x;
    u_xlat10 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat10 = (-u_xlat10) + _Rect[2];
    u_xlat3.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat3.x = (-u_xlat3.x) + _Rect[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.x>=u_xlat3.w);
#else
    u_xlatb21 = vs_TEXCOORD2.x>=u_xlat3.w;
#endif
    u_xlat10 = u_xlat10 + u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10>=vs_TEXCOORD2.x);
#else
    u_xlatb10 = u_xlat10>=vs_TEXCOORD2.x;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.y>=u_xlat4.w);
#else
    u_xlatb21 = vs_TEXCOORD2.y>=u_xlat4.w;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
    u_xlat3.x = u_xlat3.x + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=vs_TEXCOORD2.y);
#else
    u_xlatb3.x = u_xlat3.x>=vs_TEXCOORD2.y;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb3.x;
    u_xlatb3.xz = equal(ivec4(u_xlati27), ivec4(0, 0, 2, 0)).xz;
    u_xlatb3.x = u_xlatb3.z || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_CornerRadiuses[u_xlati27]);
#else
    u_xlatb21 = 0.0<_CornerRadiuses[u_xlati27];
#endif
    u_xlatb21 = u_xlatb9.x && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<u_xlat5.z);
#else
    u_xlatb30 = 0.0<u_xlat5.z;
#endif
    u_xlati4 = u_xlatb30 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0<u_xlat6.z);
#else
    u_xlatb13 = 0.0<u_xlat6.z;
#endif
    u_xlati22 = u_xlatb13 ? 1 : int(0);
    u_xlati22 = u_xlati1.z * u_xlati22;
    u_xlati4 = u_xlati4 * u_xlati1.x + u_xlati22;
    u_xlatb12 = u_xlatb3.y && u_xlatb30;
    u_xlatb18 = u_xlatb9.y && u_xlatb13;
    u_xlati12 = u_xlatb12 ? 1 : int(0);
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlati18 = u_xlati1.z * u_xlati18;
    u_xlati18 = u_xlati12 * u_xlati1.x + u_xlati18;
    u_xlati18 = (u_xlatb10) ? 0 : u_xlati18;
    u_xlati18 = (u_xlatb21) ? u_xlati4 : u_xlati18;
    u_xlati12 = u_xlati1.z + u_xlati1.x;
    u_xlat3.x = (u_xlatb3.x) ? 1.0 : -1.0;
    u_xlat7.xz = u_xlat5.wy;
    u_xlat7.yw = u_xlat6.wx;
    u_xlat6.x = u_xlat5.x;
    u_xlat4.xz = (-u_xlat7.yx) + u_xlat6.yx;
    u_xlat3.xz = u_xlat3.xx * u_xlat4.xz;
    u_xlat4.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xz = u_xlat3.xz * u_xlat4.xx;
    u_xlat3.xz = u_xlat3.xz * vec2(100.0, 100.0) + u_xlat6.yx;
    u_xlat4.xz = (-u_xlat3.zx) + u_xlat6.xy;
    u_xlat3.xz = (-u_xlat3.xz) + vs_TEXCOORD2.yx;
    u_xlat21 = u_xlat3.z * u_xlat4.z;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + (-u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=0.0);
#else
    u_xlatb3.x = u_xlat3.x>=0.0;
#endif
    u_xlati1.x = (u_xlatb3.x) ? u_xlati1.x : u_xlati1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlati18!=u_xlati12);
#else
    u_xlatb19 = u_xlati18!=u_xlati12;
#endif
    u_xlati18 = (u_xlatb19) ? u_xlati18 : u_xlati1.x;
    if(u_xlati18 == 0) {
        u_xlat16_8.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
        u_xlat16_29 = u_xlat16_1.w * vs_COLOR0.w;
    } else {
        u_xlatb3.xyz = equal(ivec4(u_xlati18), ivec4(2, 4, 8, 0)).xyz;
        u_xlati18 = u_xlatb3.z ? 3 : int(0);
        u_xlati18 = (u_xlatb3.y) ? 2 : u_xlati18;
        u_xlati18 = (u_xlatb3.x) ? 1 : u_xlati18;
        u_xlat8.xyz = u_xlat16_2.xyz * _BorderColors[u_xlati18].xyz;
        u_xlat29 = u_xlat16_1.w * _BorderColors[u_xlati18].w;
        u_xlat16_8.xyz = u_xlat8.xyz;
        u_xlat16_29 = u_xlat29;
    }
    u_xlatb18 = u_xlatb30 || u_xlatb13;
    u_xlat3.xy = (-u_xlat7.zw) + vs_TEXCOORD2.xy;
    u_xlat1 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1 = sqrt(u_xlat1);
    u_xlat1 = u_xlat1 + (-_CornerRadiuses[u_xlati27]);
    u_xlat1 = u_xlat1 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat1 = u_xlatb18 ? u_xlat1 : float(0.0);
    u_xlat19 = (-u_xlat5.z) + _CornerRadiuses[u_xlati27];
    u_xlat27 = (-u_xlat6.z) + _CornerRadiuses[u_xlati27];
    u_xlat28 = u_xlat19 / u_xlat27;
    u_xlat3.z = u_xlat28 * u_xlat3.y;
    u_xlat28 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = (-u_xlat19) + u_xlat28;
    u_xlat0.x = u_xlat28 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0<u_xlat19);
#else
    u_xlatb19 = 0.0<u_xlat19;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0<u_xlat27);
#else
    u_xlatb27 = 0.0<u_xlat27;
#endif
    u_xlatb27 = u_xlatb27 && u_xlatb19;
    u_xlat0.x = (u_xlatb27) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1==0.0);
#else
    u_xlatb18 = u_xlat1==0.0;
#endif
    u_xlat27 = (-u_xlat1) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat27;
    u_xlat0.x = (u_xlatb9.x) ? u_xlat0.x : 1.0;
    u_xlat18 = u_xlat0.x * u_xlat16_29;
    u_xlat27 = (u_xlatb10) ? 0.0 : 1.0;
    u_xlat9.x = (u_xlatb9.x) ? 1.0 : u_xlat27;
    u_xlat0.z = u_xlat9.x * u_xlat18;
    u_xlat9.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_SrcBlend!=5);
#else
    u_xlatb1 = _SrcBlend!=5;
#endif
    u_xlat0.xz = u_xlat9.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat9.z * u_xlat0.x;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_8.xyz;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat0.xyw : u_xlat16_8.xyz;
    SV_Target0.w = u_xlat0.z;
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
uniform 	vec4 _BorderColors[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
mediump vec4 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
int u_xlati4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec2 u_xlatb9;
float u_xlat10;
bool u_xlatb10;
int u_xlati12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
bool u_xlatb21;
int u_xlati22;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
float u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb30;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD2.x);
    u_xlat0.x = float(1.0) / abs(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_2.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = (_ManualTex2SRGB != 0) ? u_xlat9.xyz : u_xlat16_1.xyz;
    u_xlat9.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat9.x = (-_Rect[2]) * 0.5 + u_xlat9.x;
    u_xlat18 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat9.y = (-_Rect[3]) * 0.5 + u_xlat18;
    u_xlatb9.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlati1.xyz = (u_xlatb9.y) ? ivec3(0, 1, 2) : ivec3(3, 2, 8);
    u_xlati27 = (u_xlatb9.x) ? u_xlati1.x : u_xlati1.y;
    u_xlati1.x = (u_xlatb9.x) ? 1 : 4;
    u_xlat3.y = _Rect[0] + _CornerRadiuses[u_xlati27];
    u_xlat4.y = _Rect[1] + _CornerRadiuses[u_xlati27];
    u_xlat3.w = _BorderWidths[0] + _Rect[0];
    u_xlat4.w = _BorderWidths[1] + _Rect[1];
    u_xlat5.x = _Rect[0] + _Rect[2];
    u_xlat5.y = u_xlat5.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat5.w = u_xlat5.x + (-_BorderWidths[2]);
    u_xlat3.x = _Rect[0];
    u_xlat3.z = _BorderWidths[0];
    u_xlat5.z = _BorderWidths[2];
    u_xlat5 = (u_xlatb9.x) ? u_xlat3 : u_xlat5;
    u_xlat6.x = _Rect[1] + _Rect[3];
    u_xlat6.y = u_xlat6.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat6.w = u_xlat6.x + (-_BorderWidths[3]);
    u_xlat4.x = _Rect[1];
    u_xlat4.z = _BorderWidths[1];
    u_xlat6.z = _BorderWidths[3];
    u_xlat6 = (u_xlatb9.y) ? u_xlat4.yxzw : u_xlat6.yxzw;
    u_xlatb3.xy = greaterThanEqual(u_xlat5.ywyy, vs_TEXCOORD2.xxxx).xy;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.xxxx, u_xlat5.ywyy).xy;
    u_xlatb3.xy = (u_xlatb9.x) ? u_xlatb3.xy : u_xlatb4.xy;
    u_xlatb4.xy = greaterThanEqual(u_xlat6.xwxx, vs_TEXCOORD2.yyyy).xy;
    u_xlatb7.xy = greaterThanEqual(vs_TEXCOORD2.yyyy, u_xlat6.xwxx).xy;
    u_xlatb9.xy = (u_xlatb9.y) ? u_xlatb4.xy : u_xlatb7.xy;
    u_xlatb9.x = u_xlatb9.x && u_xlatb3.x;
    u_xlat10 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat10 = (-u_xlat10) + _Rect[2];
    u_xlat3.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat3.x = (-u_xlat3.x) + _Rect[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.x>=u_xlat3.w);
#else
    u_xlatb21 = vs_TEXCOORD2.x>=u_xlat3.w;
#endif
    u_xlat10 = u_xlat10 + u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10>=vs_TEXCOORD2.x);
#else
    u_xlatb10 = u_xlat10>=vs_TEXCOORD2.x;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.y>=u_xlat4.w);
#else
    u_xlatb21 = vs_TEXCOORD2.y>=u_xlat4.w;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
    u_xlat3.x = u_xlat3.x + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=vs_TEXCOORD2.y);
#else
    u_xlatb3.x = u_xlat3.x>=vs_TEXCOORD2.y;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb3.x;
    u_xlatb3.xz = equal(ivec4(u_xlati27), ivec4(0, 0, 2, 0)).xz;
    u_xlatb3.x = u_xlatb3.z || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_CornerRadiuses[u_xlati27]);
#else
    u_xlatb21 = 0.0<_CornerRadiuses[u_xlati27];
#endif
    u_xlatb21 = u_xlatb9.x && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<u_xlat5.z);
#else
    u_xlatb30 = 0.0<u_xlat5.z;
#endif
    u_xlati4 = u_xlatb30 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0<u_xlat6.z);
#else
    u_xlatb13 = 0.0<u_xlat6.z;
#endif
    u_xlati22 = u_xlatb13 ? 1 : int(0);
    u_xlati22 = u_xlati1.z * u_xlati22;
    u_xlati4 = u_xlati4 * u_xlati1.x + u_xlati22;
    u_xlatb12 = u_xlatb3.y && u_xlatb30;
    u_xlatb18 = u_xlatb9.y && u_xlatb13;
    u_xlati12 = u_xlatb12 ? 1 : int(0);
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlati18 = u_xlati1.z * u_xlati18;
    u_xlati18 = u_xlati12 * u_xlati1.x + u_xlati18;
    u_xlati18 = (u_xlatb10) ? 0 : u_xlati18;
    u_xlati18 = (u_xlatb21) ? u_xlati4 : u_xlati18;
    u_xlati12 = u_xlati1.z + u_xlati1.x;
    u_xlat3.x = (u_xlatb3.x) ? 1.0 : -1.0;
    u_xlat7.xz = u_xlat5.wy;
    u_xlat7.yw = u_xlat6.wx;
    u_xlat6.x = u_xlat5.x;
    u_xlat4.xz = (-u_xlat7.yx) + u_xlat6.yx;
    u_xlat3.xz = u_xlat3.xx * u_xlat4.xz;
    u_xlat4.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xz = u_xlat3.xz * u_xlat4.xx;
    u_xlat3.xz = u_xlat3.xz * vec2(100.0, 100.0) + u_xlat6.yx;
    u_xlat4.xz = (-u_xlat3.zx) + u_xlat6.xy;
    u_xlat3.xz = (-u_xlat3.xz) + vs_TEXCOORD2.yx;
    u_xlat21 = u_xlat3.z * u_xlat4.z;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + (-u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=0.0);
#else
    u_xlatb3.x = u_xlat3.x>=0.0;
#endif
    u_xlati1.x = (u_xlatb3.x) ? u_xlati1.x : u_xlati1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlati18!=u_xlati12);
#else
    u_xlatb19 = u_xlati18!=u_xlati12;
#endif
    u_xlati18 = (u_xlatb19) ? u_xlati18 : u_xlati1.x;
    if(u_xlati18 == 0) {
        u_xlat16_8.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
        u_xlat16_29 = u_xlat16_1.w * vs_COLOR0.w;
    } else {
        u_xlatb3.xyz = equal(ivec4(u_xlati18), ivec4(2, 4, 8, 0)).xyz;
        u_xlati18 = u_xlatb3.z ? 3 : int(0);
        u_xlati18 = (u_xlatb3.y) ? 2 : u_xlati18;
        u_xlati18 = (u_xlatb3.x) ? 1 : u_xlati18;
        u_xlat8.xyz = u_xlat16_2.xyz * _BorderColors[u_xlati18].xyz;
        u_xlat29 = u_xlat16_1.w * _BorderColors[u_xlati18].w;
        u_xlat16_8.xyz = u_xlat8.xyz;
        u_xlat16_29 = u_xlat29;
    }
    u_xlatb18 = u_xlatb30 || u_xlatb13;
    u_xlat3.xy = (-u_xlat7.zw) + vs_TEXCOORD2.xy;
    u_xlat1 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1 = sqrt(u_xlat1);
    u_xlat1 = u_xlat1 + (-_CornerRadiuses[u_xlati27]);
    u_xlat1 = u_xlat1 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat1 = u_xlatb18 ? u_xlat1 : float(0.0);
    u_xlat19 = (-u_xlat5.z) + _CornerRadiuses[u_xlati27];
    u_xlat27 = (-u_xlat6.z) + _CornerRadiuses[u_xlati27];
    u_xlat28 = u_xlat19 / u_xlat27;
    u_xlat3.z = u_xlat28 * u_xlat3.y;
    u_xlat28 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = (-u_xlat19) + u_xlat28;
    u_xlat0.x = u_xlat28 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0<u_xlat19);
#else
    u_xlatb19 = 0.0<u_xlat19;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0<u_xlat27);
#else
    u_xlatb27 = 0.0<u_xlat27;
#endif
    u_xlatb27 = u_xlatb27 && u_xlatb19;
    u_xlat0.x = (u_xlatb27) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1==0.0);
#else
    u_xlatb18 = u_xlat1==0.0;
#endif
    u_xlat27 = (-u_xlat1) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat27;
    u_xlat0.x = (u_xlatb9.x) ? u_xlat0.x : 1.0;
    u_xlat18 = u_xlat0.x * u_xlat16_29;
    u_xlat27 = (u_xlatb10) ? 0.0 : 1.0;
    u_xlat9.x = (u_xlatb9.x) ? 1.0 : u_xlat27;
    u_xlat0.z = u_xlat9.x * u_xlat18;
    u_xlat9.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_SrcBlend!=5);
#else
    u_xlatb1 = _SrcBlend!=5;
#endif
    u_xlat0.xz = u_xlat9.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat9.z * u_xlat0.x;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_8.xyz;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat0.xyw : u_xlat16_8.xyz;
    SV_Target0.w = u_xlat0.z;
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