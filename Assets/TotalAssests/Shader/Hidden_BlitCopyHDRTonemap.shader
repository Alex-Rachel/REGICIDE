//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/BlitCopyHDRTonemap" {
Properties {
_MainTex ("Texture", any) = "" { }
_NitsForPaperWhite ("NitsForPaperWhite", Float) = 160
_ColorGamut ("ColorGamut", Float) = 0
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 57251
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	float _NitsForPaperWhite;
uniform 	int _ColorGamut;
UNITY_LOCATION(0) uniform highp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bvec3 u_xlatb2;
bvec3 u_xlatb3;
vec3 u_xlat4;
void main()
{
    u_xlat0.x = _NitsForPaperWhite * 9.99999975e-05;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat1.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlatb3.xyz = lessThan(u_xlat1.xyzx, vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat4;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat4.x : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat4.y : u_xlat2.y;
        hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat4.z : u_xlat2.z;
        u_xlat4 = hlslcc_movcTemp;
    }
    u_xlatb2.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat1.xyzx).xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    SV_Target0.w = u_xlat1.w;
    {
        vec3 hlslcc_movcTemp = u_xlat4;
        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat1.x : u_xlat4.x;
        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat1.y : u_xlat4.y;
        hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat1.z : u_xlat4.z;
        u_xlat4 = hlslcc_movcTemp;
    }
    u_xlat1.x = dot(vec3(0.627402008, 0.329291999, 0.0433060005), u_xlat4.xyz);
    u_xlat1.y = dot(vec3(0.0690950006, 0.919543982, 0.0113599999), u_xlat4.xyz);
    u_xlat1.z = dot(vec3(0.0163940005, 0.0880279988, 0.895578027), u_xlat4.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = log2(abs(u_xlat1.xyz));
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.159301758, 0.159301758, 0.159301758);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat1.xyz * vec3(18.8515625, 18.8515625, 18.8515625) + vec3(0.8359375, 0.8359375, 0.8359375);
    u_xlat1.xyz = u_xlat1.xyz * vec3(18.6875, 18.6875, 18.6875) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat2.xyz / u_xlat1.xyz;
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(78.84375, 78.84375, 78.84375);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ColorGamut==4);
#else
    u_xlatb0 = _ColorGamut==4;
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : u_xlat4.xyz;
    u_xlat2.xyz = log2(abs(u_xlat4.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb3.xyz = lessThan(u_xlat4.xyzx, vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0)).xyz;
    u_xlat0.xyz = u_xlat4.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    {
        vec3 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat0.x : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat0.y : u_xlat2.y;
        hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat0.z : u_xlat2.z;
        u_xlat0 = hlslcc_movcTemp;
    }
    SV_Target0.xyz = (int(_ColorGamut) != 0) ? u_xlat1.xyz : u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	float _NitsForPaperWhite;
uniform 	int _ColorGamut;
UNITY_LOCATION(0) uniform highp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bvec3 u_xlatb2;
bvec3 u_xlatb3;
vec3 u_xlat4;
void main()
{
    u_xlat0.x = _NitsForPaperWhite * 9.99999975e-05;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat1.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlatb3.xyz = lessThan(u_xlat1.xyzx, vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat4;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat4.x : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat4.y : u_xlat2.y;
        hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat4.z : u_xlat2.z;
        u_xlat4 = hlslcc_movcTemp;
    }
    u_xlatb2.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat1.xyzx).xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    SV_Target0.w = u_xlat1.w;
    {
        vec3 hlslcc_movcTemp = u_xlat4;
        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat1.x : u_xlat4.x;
        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat1.y : u_xlat4.y;
        hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat1.z : u_xlat4.z;
        u_xlat4 = hlslcc_movcTemp;
    }
    u_xlat1.x = dot(vec3(0.627402008, 0.329291999, 0.0433060005), u_xlat4.xyz);
    u_xlat1.y = dot(vec3(0.0690950006, 0.919543982, 0.0113599999), u_xlat4.xyz);
    u_xlat1.z = dot(vec3(0.0163940005, 0.0880279988, 0.895578027), u_xlat4.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = log2(abs(u_xlat1.xyz));
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.159301758, 0.159301758, 0.159301758);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat1.xyz * vec3(18.8515625, 18.8515625, 18.8515625) + vec3(0.8359375, 0.8359375, 0.8359375);
    u_xlat1.xyz = u_xlat1.xyz * vec3(18.6875, 18.6875, 18.6875) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat2.xyz / u_xlat1.xyz;
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(78.84375, 78.84375, 78.84375);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ColorGamut==4);
#else
    u_xlatb0 = _ColorGamut==4;
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : u_xlat4.xyz;
    u_xlat2.xyz = log2(abs(u_xlat4.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb3.xyz = lessThan(u_xlat4.xyzx, vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0)).xyz;
    u_xlat0.xyz = u_xlat4.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    {
        vec3 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat0.x : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat0.y : u_xlat2.y;
        hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat0.z : u_xlat2.z;
        u_xlat0 = hlslcc_movcTemp;
    }
    SV_Target0.xyz = (int(_ColorGamut) != 0) ? u_xlat1.xyz : u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	float _NitsForPaperWhite;
uniform 	int _ColorGamut;
UNITY_LOCATION(0) uniform highp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bvec3 u_xlatb2;
bvec3 u_xlatb3;
vec3 u_xlat4;
void main()
{
    u_xlat0.x = _NitsForPaperWhite * 9.99999975e-05;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat1.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlatb3.xyz = lessThan(u_xlat1.xyzx, vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat4;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat4.x : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat4.y : u_xlat2.y;
        hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat4.z : u_xlat2.z;
        u_xlat4 = hlslcc_movcTemp;
    }
    u_xlatb2.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat1.xyzx).xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    SV_Target0.w = u_xlat1.w;
    {
        vec3 hlslcc_movcTemp = u_xlat4;
        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat1.x : u_xlat4.x;
        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat1.y : u_xlat4.y;
        hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat1.z : u_xlat4.z;
        u_xlat4 = hlslcc_movcTemp;
    }
    u_xlat1.x = dot(vec3(0.627402008, 0.329291999, 0.0433060005), u_xlat4.xyz);
    u_xlat1.y = dot(vec3(0.0690950006, 0.919543982, 0.0113599999), u_xlat4.xyz);
    u_xlat1.z = dot(vec3(0.0163940005, 0.0880279988, 0.895578027), u_xlat4.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = log2(abs(u_xlat1.xyz));
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.159301758, 0.159301758, 0.159301758);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat1.xyz * vec3(18.8515625, 18.8515625, 18.8515625) + vec3(0.8359375, 0.8359375, 0.8359375);
    u_xlat1.xyz = u_xlat1.xyz * vec3(18.6875, 18.6875, 18.6875) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat2.xyz / u_xlat1.xyz;
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(78.84375, 78.84375, 78.84375);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ColorGamut==4);
#else
    u_xlatb0 = _ColorGamut==4;
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : u_xlat4.xyz;
    u_xlat2.xyz = log2(abs(u_xlat4.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb3.xyz = lessThan(u_xlat4.xyzx, vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0)).xyz;
    u_xlat0.xyz = u_xlat4.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    {
        vec3 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat0.x : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat0.y : u_xlat2.y;
        hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat0.z : u_xlat2.z;
        u_xlat0 = hlslcc_movcTemp;
    }
    SV_Target0.xyz = (int(_ColorGamut) != 0) ? u_xlat1.xyz : u_xlat0.xyz;
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