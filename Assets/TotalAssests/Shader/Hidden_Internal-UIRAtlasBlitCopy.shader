//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-UIRAtlasBlitCopy" {
Properties {
_MainTex0 ("Texture", any) = "" { }
_MainTex1 ("Texture", any) = "" { }
_MainTex2 ("Texture", any) = "" { }
_MainTex3 ("Texture", any) = "" { }
_MainTex4 ("Texture", any) = "" { }
_MainTex5 ("Texture", any) = "" { }
_MainTex6 ("Texture", any) = "" { }
_MainTex7 ("Texture", any) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 52704
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
uniform 	vec4 _MainTex0_ST;
uniform 	vec4 _MainTex1_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	vec4 _MainTex3_ST;
uniform 	vec4 _MainTex4_ST;
uniform 	vec4 _MainTex5_ST;
uniform 	vec4 _MainTex6_ST;
uniform 	vec4 _MainTex7_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
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
    u_xlatu0 = uint(in_TEXCOORD0.z);
    switch(int(u_xlatu0)){
        case 0:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex0_ST.xy + _MainTex0_ST.zw;
            break;
        case 1:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex1_ST.xy + _MainTex1_ST.zw;
            break;
        case 2:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
            break;
        case 3:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex3_ST.xy + _MainTex3_ST.zw;
            break;
        case 4:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex4_ST.xy + _MainTex4_ST.zw;
            break;
        case 5:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex5_ST.xy + _MainTex5_ST.zw;
            break;
        case 6:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex6_ST.xy + _MainTex6_ST.zw;
            break;
        case 7:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex7_ST.xy + _MainTex7_ST.zw;
            break;
        default:
            u_xlat0.x = float(0.0);
            u_xlat0.y = float(0.0);
            break;
    }
    vs_TEXCOORD0.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex0;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex1;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex2;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex3;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex4;
UNITY_LOCATION(5) uniform mediump sampler2D _MainTex5;
UNITY_LOCATION(6) uniform mediump sampler2D _MainTex6;
UNITY_LOCATION(7) uniform mediump sampler2D _MainTex7;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uint u_xlatu0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlatu0 = uint(vs_TEXCOORD0.z);
    switch(int(u_xlatu0)){
        case 0:
            u_xlat16_1 = texture(_MainTex0, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_1;
            break;
        case 1:
            u_xlat16_1 = texture(_MainTex1, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_1;
            break;
        case 2:
            u_xlat16_1 = texture(_MainTex2, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_1;
            break;
        case 3:
            u_xlat16_1 = texture(_MainTex3, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_1;
            break;
        case 4:
            u_xlat16_0 = texture(_MainTex4, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_0;
            break;
        case 5:
            u_xlat16_0 = texture(_MainTex5, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_0;
            break;
        case 6:
            u_xlat16_0 = texture(_MainTex6, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_0;
            break;
        case 7:
            u_xlat16_0 = texture(_MainTex7, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_0;
            break;
        default:
            u_xlat16_0.x = float(1.0);
            u_xlat16_0.y = float(1.0);
            u_xlat16_0.z = float(1.0);
            u_xlat16_0.w = float(1.0);
            break;
    }
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex0_ST;
uniform 	vec4 _MainTex1_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	vec4 _MainTex3_ST;
uniform 	vec4 _MainTex4_ST;
uniform 	vec4 _MainTex5_ST;
uniform 	vec4 _MainTex6_ST;
uniform 	vec4 _MainTex7_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
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
    u_xlatu0 = uint(in_TEXCOORD0.z);
    switch(int(u_xlatu0)){
        case 0:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex0_ST.xy + _MainTex0_ST.zw;
            break;
        case 1:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex1_ST.xy + _MainTex1_ST.zw;
            break;
        case 2:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
            break;
        case 3:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex3_ST.xy + _MainTex3_ST.zw;
            break;
        case 4:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex4_ST.xy + _MainTex4_ST.zw;
            break;
        case 5:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex5_ST.xy + _MainTex5_ST.zw;
            break;
        case 6:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex6_ST.xy + _MainTex6_ST.zw;
            break;
        case 7:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex7_ST.xy + _MainTex7_ST.zw;
            break;
        default:
            u_xlat0.x = float(0.0);
            u_xlat0.y = float(0.0);
            break;
    }
    vs_TEXCOORD0.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex0;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex1;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex2;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex3;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex4;
UNITY_LOCATION(5) uniform mediump sampler2D _MainTex5;
UNITY_LOCATION(6) uniform mediump sampler2D _MainTex6;
UNITY_LOCATION(7) uniform mediump sampler2D _MainTex7;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uint u_xlatu0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlatu0 = uint(vs_TEXCOORD0.z);
    switch(int(u_xlatu0)){
        case 0:
            u_xlat16_1 = texture(_MainTex0, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_1;
            break;
        case 1:
            u_xlat16_1 = texture(_MainTex1, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_1;
            break;
        case 2:
            u_xlat16_1 = texture(_MainTex2, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_1;
            break;
        case 3:
            u_xlat16_1 = texture(_MainTex3, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_1;
            break;
        case 4:
            u_xlat16_0 = texture(_MainTex4, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_0;
            break;
        case 5:
            u_xlat16_0 = texture(_MainTex5, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_0;
            break;
        case 6:
            u_xlat16_0 = texture(_MainTex6, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_0;
            break;
        case 7:
            u_xlat16_0 = texture(_MainTex7, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_0;
            break;
        default:
            u_xlat16_0.x = float(1.0);
            u_xlat16_0.y = float(1.0);
            u_xlat16_0.z = float(1.0);
            u_xlat16_0.w = float(1.0);
            break;
    }
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex0_ST;
uniform 	vec4 _MainTex1_ST;
uniform 	vec4 _MainTex2_ST;
uniform 	vec4 _MainTex3_ST;
uniform 	vec4 _MainTex4_ST;
uniform 	vec4 _MainTex5_ST;
uniform 	vec4 _MainTex6_ST;
uniform 	vec4 _MainTex7_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
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
    u_xlatu0 = uint(in_TEXCOORD0.z);
    switch(int(u_xlatu0)){
        case 0:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex0_ST.xy + _MainTex0_ST.zw;
            break;
        case 1:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex1_ST.xy + _MainTex1_ST.zw;
            break;
        case 2:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex2_ST.xy + _MainTex2_ST.zw;
            break;
        case 3:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex3_ST.xy + _MainTex3_ST.zw;
            break;
        case 4:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex4_ST.xy + _MainTex4_ST.zw;
            break;
        case 5:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex5_ST.xy + _MainTex5_ST.zw;
            break;
        case 6:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex6_ST.xy + _MainTex6_ST.zw;
            break;
        case 7:
            u_xlat0.xy = in_TEXCOORD0.xy * _MainTex7_ST.xy + _MainTex7_ST.zw;
            break;
        default:
            u_xlat0.x = float(0.0);
            u_xlat0.y = float(0.0);
            break;
    }
    vs_TEXCOORD0.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.z = in_TEXCOORD0.z;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex0;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex1;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex2;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex3;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex4;
UNITY_LOCATION(5) uniform mediump sampler2D _MainTex5;
UNITY_LOCATION(6) uniform mediump sampler2D _MainTex6;
UNITY_LOCATION(7) uniform mediump sampler2D _MainTex7;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uint u_xlatu0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlatu0 = uint(vs_TEXCOORD0.z);
    switch(int(u_xlatu0)){
        case 0:
            u_xlat16_1 = texture(_MainTex0, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_1;
            break;
        case 1:
            u_xlat16_1 = texture(_MainTex1, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_1;
            break;
        case 2:
            u_xlat16_1 = texture(_MainTex2, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_1;
            break;
        case 3:
            u_xlat16_1 = texture(_MainTex3, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_1;
            break;
        case 4:
            u_xlat16_0 = texture(_MainTex4, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_0;
            break;
        case 5:
            u_xlat16_0 = texture(_MainTex5, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_0;
            break;
        case 6:
            u_xlat16_0 = texture(_MainTex6, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_0;
            break;
        case 7:
            u_xlat16_0 = texture(_MainTex7, vs_TEXCOORD0.xy);
            u_xlat16_0 = u_xlat16_0;
            break;
        default:
            u_xlat16_0.x = float(1.0);
            u_xlat16_0.y = float(1.0);
            u_xlat16_0.z = float(1.0);
            u_xlat16_0.w = float(1.0);
            break;
    }
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
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