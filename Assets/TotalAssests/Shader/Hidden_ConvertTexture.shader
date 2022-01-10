//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ConvertTexture" {
Properties {
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 35090
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
vec4 ImmCB_1[10];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _faceIndex;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
int u_xlati4;
void main()
{
ImmCB_1[0] = vec4(0.0,0.0,-1.0,0.0);
ImmCB_1[1] = vec4(0.0,0.0,1.0,0.0);
ImmCB_1[2] = vec4(1.0,0.0,0.0,0.0);
ImmCB_1[3] = vec4(1.0,0.0,0.0,0.0);
ImmCB_1[4] = vec4(1.0,0.0,0.0,-1.0);
ImmCB_1[5] = vec4(-1.0,0.0,0.0,-1.0);
ImmCB_1[6] = vec4(0.0,0.0,1.0,0.0);
ImmCB_1[7] = vec4(0.0,0.0,-1.0,0.0);
ImmCB_1[8] = vec4(0.0,0.0,0.0,-1.0);
ImmCB_1[9] = vec4(0.0,0.0,0.0,-1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = 0.0;
    u_xlat1.z = 0.0;
    u_xlati4 = int(_faceIndex);
    u_xlat1.xy = ImmCB_1[u_xlati4].zx * ImmCB_1[u_xlati4 + 4].wz;
    u_xlat2.xz = ImmCB_1[u_xlati4 + 4].zw;
    u_xlat2.y = ImmCB_1[u_xlati4].z;
    u_xlat0.z = ImmCB_1[u_xlati4].x;
    u_xlat0.xzw = (-u_xlat2.xyz) * u_xlat0.xxz + u_xlat1.xyz;
    u_xlat1.y = 0.0;
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xz = ImmCB_1[u_xlati4].xz;
    u_xlat3.yz = ImmCB_1[u_xlati4 + 4].wz;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat3.x = 0.0;
    vs_TEXCOORD0.xyz = u_xlat2.yyy * u_xlat3.xyz + u_xlat0.xyz;
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
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
    SV_Target0 = u_xlat16_0;
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
vec4 ImmCB_1[10];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _faceIndex;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
int u_xlati4;
void main()
{
ImmCB_1[0] = vec4(0.0,0.0,-1.0,0.0);
ImmCB_1[1] = vec4(0.0,0.0,1.0,0.0);
ImmCB_1[2] = vec4(1.0,0.0,0.0,0.0);
ImmCB_1[3] = vec4(1.0,0.0,0.0,0.0);
ImmCB_1[4] = vec4(1.0,0.0,0.0,-1.0);
ImmCB_1[5] = vec4(-1.0,0.0,0.0,-1.0);
ImmCB_1[6] = vec4(0.0,0.0,1.0,0.0);
ImmCB_1[7] = vec4(0.0,0.0,-1.0,0.0);
ImmCB_1[8] = vec4(0.0,0.0,0.0,-1.0);
ImmCB_1[9] = vec4(0.0,0.0,0.0,-1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = 0.0;
    u_xlat1.z = 0.0;
    u_xlati4 = int(_faceIndex);
    u_xlat1.xy = ImmCB_1[u_xlati4].zx * ImmCB_1[u_xlati4 + 4].wz;
    u_xlat2.xz = ImmCB_1[u_xlati4 + 4].zw;
    u_xlat2.y = ImmCB_1[u_xlati4].z;
    u_xlat0.z = ImmCB_1[u_xlati4].x;
    u_xlat0.xzw = (-u_xlat2.xyz) * u_xlat0.xxz + u_xlat1.xyz;
    u_xlat1.y = 0.0;
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xz = ImmCB_1[u_xlati4].xz;
    u_xlat3.yz = ImmCB_1[u_xlati4 + 4].wz;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat3.x = 0.0;
    vs_TEXCOORD0.xyz = u_xlat2.yyy * u_xlat3.xyz + u_xlat0.xyz;
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
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
    SV_Target0 = u_xlat16_0;
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
vec4 ImmCB_1[10];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _faceIndex;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
int u_xlati4;
void main()
{
ImmCB_1[0] = vec4(0.0,0.0,-1.0,0.0);
ImmCB_1[1] = vec4(0.0,0.0,1.0,0.0);
ImmCB_1[2] = vec4(1.0,0.0,0.0,0.0);
ImmCB_1[3] = vec4(1.0,0.0,0.0,0.0);
ImmCB_1[4] = vec4(1.0,0.0,0.0,-1.0);
ImmCB_1[5] = vec4(-1.0,0.0,0.0,-1.0);
ImmCB_1[6] = vec4(0.0,0.0,1.0,0.0);
ImmCB_1[7] = vec4(0.0,0.0,-1.0,0.0);
ImmCB_1[8] = vec4(0.0,0.0,0.0,-1.0);
ImmCB_1[9] = vec4(0.0,0.0,0.0,-1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = 0.0;
    u_xlat1.z = 0.0;
    u_xlati4 = int(_faceIndex);
    u_xlat1.xy = ImmCB_1[u_xlati4].zx * ImmCB_1[u_xlati4 + 4].wz;
    u_xlat2.xz = ImmCB_1[u_xlati4 + 4].zw;
    u_xlat2.y = ImmCB_1[u_xlati4].z;
    u_xlat0.z = ImmCB_1[u_xlati4].x;
    u_xlat0.xzw = (-u_xlat2.xyz) * u_xlat0.xxz + u_xlat1.xyz;
    u_xlat1.y = 0.0;
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xz = ImmCB_1[u_xlati4].xz;
    u_xlat3.yz = ImmCB_1[u_xlati4 + 4].wz;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat3.x = 0.0;
    vs_TEXCOORD0.xyz = u_xlat2.yyy * u_xlat3.xyz + u_xlat0.xyz;
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
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
    SV_Target0 = u_xlat16_0;
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