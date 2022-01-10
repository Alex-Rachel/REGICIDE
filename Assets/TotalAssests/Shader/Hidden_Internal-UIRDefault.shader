//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-UIRDefault" {
Properties {
_MainTex ("Atlas", 2D) = "white" { }
_FontTex ("Font", 2D) = "black" { }
_CustomTex ("Custom", 2D) = "black" { }
_Color ("Tint", Color) = (1,1,1,1)
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UIE_VertexTexturingIsAvailable" = "1" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UIE_VertexTexturingIsAvailable" = "1" }
  Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Stencil {
   Ref 255
   CompFront Always
   PassFront Keep
   FailFront Keep
   ZFailFront Replace
   CompBack Equal
   PassBack Keep
   FailBack Keep
   ZFailBack Zero
  }
  GpuProgramID 1529
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _1PixelClipInvView;
UNITY_LOCATION(4) uniform mediump sampler2D _ShaderInfoTex;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
flat out mediump vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
vec2 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat12;
vec2 u_xlat14;
vec2 u_xlat15;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0 = in_TEXCOORD2.xxzz * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb1 = greaterThanEqual(u_xlat0.yyww, (-u_xlat0.yyww));
    u_xlat1.x = (u_xlatb1.x) ? float(32.0) : float(-32.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.03125) : float(-0.03125);
    u_xlat1.z = (u_xlatb1.z) ? float(32.0) : float(-32.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.03125) : float(-0.03125);
    u_xlat0.xy = u_xlat0.xz * u_xlat1.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xz;
    u_xlat12.x = in_TEXCOORD3.x * 8160.0 + u_xlat0.y;
    u_xlat1.xy = in_TEXCOORD2.xz * vec2(255.0, 255.0) + (-u_xlat0.xy);
    u_xlat0.x = in_TEXCOORD1.x * 8160.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat1.xy * vec2(0.09375, 0.03125);
    u_xlat12.y = in_TEXCOORD3.y * 2040.0 + u_xlat1.y;
    u_xlat0.y = in_TEXCOORD1.y * 2040.0 + u_xlat1.x;
    u_xlat12.xy = u_xlat12.xy + vec2(0.5, 0.5);
    u_xlat1.zw = u_xlat12.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat12.x = textureLod(_ShaderInfoTex, u_xlat1.zw, 0.0).w;
    u_xlat2.w = u_xlat12.x * in_COLOR0.w;
    u_xlat2.xyz = in_COLOR0.xyz;
    vs_COLOR0 = u_xlat2;
    u_xlat2 = u_xlat0.xyxy + vec4(0.5, 0.5, 0.5, 1.5);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 2.5);
    u_xlat0.xy = u_xlat0.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat0 = textureLod(_ShaderInfoTex, u_xlat0.xy, 0.0);
    u_xlat0.x = dot(u_xlat0, in_POSITION0);
    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
    u_xlat2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
    u_xlat12.x = dot(u_xlat3.xy, in_TEXCOORD0.xy);
    u_xlat15.x = dot(u_xlat3, in_POSITION0);
    u_xlat12.y = dot(u_xlat2.xy, in_TEXCOORD0.xy);
    u_xlat15.y = dot(u_xlat2, in_POSITION0);
    u_xlat2.xy = u_xlat12.xy * _1PixelClipInvView.zw;
    u_xlat14.xy = abs(u_xlat2.xy) + vec2(9.99999997e-07, 9.99999997e-07);
    u_xlat2.xy = max(abs(u_xlat2.xy), vec2(1.0, 1.0));
    u_xlat3.xy = u_xlat2.xy + vec2(0.0199999996, 0.0199999996);
    u_xlat3.xy = roundEven(u_xlat3.xy);
    u_xlat2.xy = max(u_xlat2.xy, u_xlat3.xy);
    u_xlatb4 = equal(in_TEXCOORD2.wwww, vec4(0.0352941193, 0.0313725509, 0.0274509806, 0.0235294122));
    {
        vec4 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb4.w) ? u_xlat2.x : u_xlat3.x;
        hlslcc_movcTemp.y = (u_xlatb4.z) ? u_xlat2.y : u_xlat3.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat2.xy = u_xlat2.xy / u_xlat14.xy;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = min(u_xlat2.xy, vec2(100.0, 100.0));
    u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat6.xy = u_xlat12.xy * u_xlat2.xy;
    u_xlatb2 = equal(in_TEXCOORD2.wwww, vec4(0.0196078438, 0.0156862754, 0.0117647061, 0.00784313772));
    u_xlatb18 = u_xlatb4.w || u_xlatb2.x;
    u_xlatb18 = u_xlatb4.z || u_xlatb18;
    u_xlat4.x = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.x ? float(1.0) : 0.0;
;
    u_xlat6.xy = bool(u_xlatb18) ? u_xlat6.xy : vec2(0.0, 0.0);
    u_xlat6.xy = u_xlat6.xy + u_xlat15.xy;
    vs_TEXCOORD0.zw = u_xlat6.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = u_xlat3.xy * _MainTex_TexelSize.xy;
    u_xlat2.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat2.z = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat18 = (u_xlatb2.w) ? -1.0 : -0.0;
    u_xlat5.y = u_xlat18 + u_xlat2.y;
    u_xlat18 = u_xlat2.z + u_xlat2.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat18==1.0);
#else
    u_xlatb8 = u_xlat18==1.0;
#endif
    vs_TEXCOORD0.xy = (bool(u_xlatb8)) ? u_xlat15.xy : u_xlat3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(in_TEXCOORD2.w==0.00392156886);
#else
    u_xlatb8 = in_TEXCOORD2.w==0.00392156886;
#endif
    u_xlat5.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat18 = u_xlat18 + u_xlat5.x;
    u_xlat18 = u_xlat2.x + u_xlat18;
    u_xlat5.z = u_xlat2.x;
    u_xlat18 = u_xlat4.x + u_xlat18;
    u_xlat18 = u_xlat4.y + u_xlat18;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat5.w = (-u_xlat18) + 1.0;
    vs_TEXCOORD1 = u_xlat5;
    u_xlat4.z = dot(in_TEXCOORD3.zw, vec2(65025.0, 255.0));
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat2.xy = in_TEXCOORD2.yy * vec2(255.0, 8160.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat2.y>=(-u_xlat2.y));
#else
    u_xlatb18 = u_xlat2.y>=(-u_xlat2.y);
#endif
    u_xlat8.xy = (bool(u_xlatb18)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat18 = u_xlat8.y * u_xlat2.x;
    u_xlat18 = fract(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat8.x;
    u_xlat2.x = in_TEXCOORD2.y * 255.0 + (-u_xlat18);
    u_xlat3.x = in_TEXCOORD1.z * 8160.0 + u_xlat18;
    u_xlat18 = in_TEXCOORD1.w * 2040.0;
    u_xlat3.y = u_xlat2.x * 0.03125 + u_xlat18;
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat2.xy * _ShaderInfoTex_TexelSize.xy;
    vs_TEXCOORD3 = u_xlat1;
    u_xlat1 = textureLod(_ShaderInfoTex, u_xlat1.xy, 0.0);
    vs_TEXCOORD5 = u_xlat1;
    u_xlat1 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD4.xy = u_xlat0.xy / u_xlat0.ww;
    gl_Position = u_xlat0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _CustomTex_TexelSize;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ScreenClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GradientSettingsTex;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD4;
flat in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bvec3 u_xlatb3;
vec3 u_xlat4;
float u_xlat5;
mediump vec2 u_xlat16_6;
mediump float u_xlat16_8;
float u_xlat9;
vec3 u_xlat10;
bool u_xlatb10;
vec2 u_xlat11;
bool u_xlatb11;
bool u_xlatb12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
vec2 u_xlat16;
vec2 u_xlat17;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD5.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD5.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(vs_TEXCOORD4.xyxy, _ScreenClipRect.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(_ScreenClipRect.zwzw, vs_TEXCOORD4.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_1.x = (-vs_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_8 = vs_TEXCOORD1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8 = min(max(u_xlat16_8, 0.0), 1.0);
#else
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
#endif
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * u_xlat16_1.xxxx + vs_TEXCOORD1.wwww;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_2 * vec4(u_xlat16_8) + u_xlat0;
    u_xlat2.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat9 = dFdx(u_xlat2.x);
    u_xlat16.x = dFdy(u_xlat2.x);
    u_xlat9 = abs(u_xlat16.x) + abs(u_xlat9);
    u_xlat16.x = (-u_xlat9) + 0.5;
    u_xlat2.y = u_xlat9 + 0.5;
    u_xlat2.xy = (-u_xlat16.xx) + u_xlat2.xy;
    u_xlat9 = float(1.0) / u_xlat2.y;
    u_xlat2.x = u_xlat9 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat9;
    u_xlat16_1.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_1.w = u_xlat2.x * vs_TEXCOORD1.x;
    u_xlat16_0 = u_xlat0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    u_xlatb2.xy = equal(vs_TEXCOORD2.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y || u_xlatb2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = (u_xlatb2.y) ? _CustomTex_TexelSize.xy : _MainTex_TexelSize.xy;
        u_xlat1.y = vs_TEXCOORD2.z + 0.5;
        u_xlat1.x = float(0.5);
        u_xlat15.y = float(0.0);
        u_xlat16.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy;
        u_xlat16_3 = texture(_GradientSettingsTex, u_xlat16.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.0<u_xlat16_3.x);
#else
        u_xlatb3.x = 0.0<u_xlat16_3.x;
#endif
        u_xlat17.xy = u_xlat16_3.zw + vec2(-0.5, -0.5);
        u_xlat17.xy = u_xlat17.xy + u_xlat17.xy;
        u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
        u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + (-u_xlat17.xy);
        u_xlat18.x = dot(u_xlat4.xy, u_xlat4.xy);
        u_xlat18.x = inversesqrt(u_xlat18.x);
        u_xlat18.xy = u_xlat18.xx * u_xlat4.xy;
        u_xlat5 = dot((-u_xlat17.xy), u_xlat18.xy);
        u_xlat17.x = dot(u_xlat17.xy, u_xlat17.xy);
        u_xlat17.x = (-u_xlat5) * u_xlat5 + u_xlat17.x;
        u_xlat17.x = (-u_xlat17.x) + 1.0;
        u_xlat17.x = sqrt(u_xlat17.x);
        u_xlat24 = (-u_xlat17.x) + u_xlat5;
        u_xlat17.x = u_xlat17.x + u_xlat5;
        u_xlat5 = min(u_xlat17.x, u_xlat24);
#ifdef UNITY_ADRENO_ES3
        u_xlatb12 = !!(u_xlat5<0.0);
#else
        u_xlatb12 = u_xlat5<0.0;
#endif
        u_xlat17.x = max(u_xlat17.x, u_xlat24);
        u_xlat17.x = (u_xlatb12) ? u_xlat17.x : u_xlat5;
        u_xlat17.xy = u_xlat17.xx * u_xlat18.xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(9.99999975e-05>=abs(u_xlat17.x));
#else
        u_xlatb18 = 9.99999975e-05>=abs(u_xlat17.x);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb25 = !!(9.99999975e-05<abs(u_xlat17.y));
#else
        u_xlatb25 = 9.99999975e-05<abs(u_xlat17.y);
#endif
        u_xlat17.xy = u_xlat4.xy / u_xlat17.xy;
        u_xlat24 = u_xlatb25 ? u_xlat17.y : float(0.0);
        u_xlat11.x = (u_xlatb18) ? u_xlat24 : u_xlat17.x;
        u_xlat11.y = 0.0;
        u_xlat4.yz = (u_xlatb3.x) ? u_xlat11.xy : vs_TEXCOORD0.xy;
        u_xlat16_6.x = u_xlat16_3.y * 255.0;
        u_xlat16_6.x = roundEven(u_xlat16_6.x);
        u_xlati3 = int(u_xlat16_6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat4.y>=(-u_xlat4.y));
#else
        u_xlatb10 = u_xlat4.y>=(-u_xlat4.y);
#endif
        u_xlat17.x = fract(abs(u_xlat4.y));
        u_xlat10.x = (u_xlatb10) ? u_xlat17.x : (-u_xlat17.x);
        u_xlat10.x = (u_xlati3 != 0) ? u_xlat4.y : u_xlat10.x;
        u_xlatb3.xz = equal(ivec4(u_xlati3), ivec4(1, 0, 2, 0)).xz;
        u_xlat24 = u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
        u_xlat3.x = (u_xlatb3.x) ? u_xlat24 : u_xlat10.x;
        u_xlat10.x = u_xlat3.x * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat10.x>=(-u_xlat10.x));
#else
        u_xlatb24 = u_xlat10.x>=(-u_xlat10.x);
#endif
        u_xlat10.x = fract(abs(u_xlat10.x));
        u_xlat10.x = (u_xlatb24) ? u_xlat10.x : (-u_xlat10.x);
        u_xlat24 = u_xlat10.x + u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(0.5<u_xlat10.x);
#else
        u_xlatb10 = 0.5<u_xlat10.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat24>=(-u_xlat24));
#else
        u_xlatb11 = u_xlat24>=(-u_xlat24);
#endif
        u_xlat25 = fract(abs(u_xlat24));
        u_xlat11.x = (u_xlatb11) ? u_xlat25 : (-u_xlat25);
        u_xlat11.x = (-u_xlat11.x) + 1.0;
        u_xlat10.x = (u_xlatb10) ? u_xlat11.x : u_xlat24;
        u_xlat4.x = (u_xlatb3.z) ? u_xlat10.x : u_xlat3.x;
        u_xlat15.x = _GradientSettingsTex_TexelSize.x;
        u_xlat3.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy + u_xlat15.xy;
        u_xlat16_3 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlat10.xz = u_xlat16_3.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat10.xz;
        u_xlat3.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
        u_xlat16.xy = u_xlat15.xy * vec2(2.0, 2.0) + u_xlat16.xy;
        u_xlat16_1 = texture(_GradientSettingsTex, u_xlat16.xy);
        u_xlat16.xy = u_xlat16_1.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_1.xz * vec2(65025.0, 65025.0) + u_xlat16.xy;
        u_xlat16.xy = u_xlat2.xy * u_xlat3.xy;
        u_xlat2.xy = u_xlat2.xy * u_xlat16_6.xy;
        u_xlat2.xy = u_xlat4.xz * u_xlat2.xy + u_xlat16.xy;
        u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
        u_xlat1 = u_xlat10_1 * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat16_2 = texture(_CustomTex, u_xlat2.xy);
        u_xlat1 = u_xlat16_2 * vs_TEXCOORD2.yyyy + u_xlat1;
        u_xlat16_1 = u_xlat1;
    } else {
        u_xlat16_1 = u_xlat0;
    }
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _1PixelClipInvView;
UNITY_LOCATION(4) uniform mediump sampler2D _ShaderInfoTex;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
flat out mediump vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
vec2 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat12;
vec2 u_xlat14;
vec2 u_xlat15;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0 = in_TEXCOORD2.xxzz * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb1 = greaterThanEqual(u_xlat0.yyww, (-u_xlat0.yyww));
    u_xlat1.x = (u_xlatb1.x) ? float(32.0) : float(-32.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.03125) : float(-0.03125);
    u_xlat1.z = (u_xlatb1.z) ? float(32.0) : float(-32.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.03125) : float(-0.03125);
    u_xlat0.xy = u_xlat0.xz * u_xlat1.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xz;
    u_xlat12.x = in_TEXCOORD3.x * 8160.0 + u_xlat0.y;
    u_xlat1.xy = in_TEXCOORD2.xz * vec2(255.0, 255.0) + (-u_xlat0.xy);
    u_xlat0.x = in_TEXCOORD1.x * 8160.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat1.xy * vec2(0.09375, 0.03125);
    u_xlat12.y = in_TEXCOORD3.y * 2040.0 + u_xlat1.y;
    u_xlat0.y = in_TEXCOORD1.y * 2040.0 + u_xlat1.x;
    u_xlat12.xy = u_xlat12.xy + vec2(0.5, 0.5);
    u_xlat1.zw = u_xlat12.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat12.x = textureLod(_ShaderInfoTex, u_xlat1.zw, 0.0).w;
    u_xlat2.w = u_xlat12.x * in_COLOR0.w;
    u_xlat2.xyz = in_COLOR0.xyz;
    vs_COLOR0 = u_xlat2;
    u_xlat2 = u_xlat0.xyxy + vec4(0.5, 0.5, 0.5, 1.5);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 2.5);
    u_xlat0.xy = u_xlat0.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat0 = textureLod(_ShaderInfoTex, u_xlat0.xy, 0.0);
    u_xlat0.x = dot(u_xlat0, in_POSITION0);
    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
    u_xlat2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
    u_xlat12.x = dot(u_xlat3.xy, in_TEXCOORD0.xy);
    u_xlat15.x = dot(u_xlat3, in_POSITION0);
    u_xlat12.y = dot(u_xlat2.xy, in_TEXCOORD0.xy);
    u_xlat15.y = dot(u_xlat2, in_POSITION0);
    u_xlat2.xy = u_xlat12.xy * _1PixelClipInvView.zw;
    u_xlat14.xy = abs(u_xlat2.xy) + vec2(9.99999997e-07, 9.99999997e-07);
    u_xlat2.xy = max(abs(u_xlat2.xy), vec2(1.0, 1.0));
    u_xlat3.xy = u_xlat2.xy + vec2(0.0199999996, 0.0199999996);
    u_xlat3.xy = roundEven(u_xlat3.xy);
    u_xlat2.xy = max(u_xlat2.xy, u_xlat3.xy);
    u_xlatb4 = equal(in_TEXCOORD2.wwww, vec4(0.0352941193, 0.0313725509, 0.0274509806, 0.0235294122));
    {
        vec4 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb4.w) ? u_xlat2.x : u_xlat3.x;
        hlslcc_movcTemp.y = (u_xlatb4.z) ? u_xlat2.y : u_xlat3.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat2.xy = u_xlat2.xy / u_xlat14.xy;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = min(u_xlat2.xy, vec2(100.0, 100.0));
    u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat6.xy = u_xlat12.xy * u_xlat2.xy;
    u_xlatb2 = equal(in_TEXCOORD2.wwww, vec4(0.0196078438, 0.0156862754, 0.0117647061, 0.00784313772));
    u_xlatb18 = u_xlatb4.w || u_xlatb2.x;
    u_xlatb18 = u_xlatb4.z || u_xlatb18;
    u_xlat4.x = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.x ? float(1.0) : 0.0;
;
    u_xlat6.xy = bool(u_xlatb18) ? u_xlat6.xy : vec2(0.0, 0.0);
    u_xlat6.xy = u_xlat6.xy + u_xlat15.xy;
    vs_TEXCOORD0.zw = u_xlat6.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = u_xlat3.xy * _MainTex_TexelSize.xy;
    u_xlat2.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat2.z = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat18 = (u_xlatb2.w) ? -1.0 : -0.0;
    u_xlat5.y = u_xlat18 + u_xlat2.y;
    u_xlat18 = u_xlat2.z + u_xlat2.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat18==1.0);
#else
    u_xlatb8 = u_xlat18==1.0;
#endif
    vs_TEXCOORD0.xy = (bool(u_xlatb8)) ? u_xlat15.xy : u_xlat3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(in_TEXCOORD2.w==0.00392156886);
#else
    u_xlatb8 = in_TEXCOORD2.w==0.00392156886;
#endif
    u_xlat5.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat18 = u_xlat18 + u_xlat5.x;
    u_xlat18 = u_xlat2.x + u_xlat18;
    u_xlat5.z = u_xlat2.x;
    u_xlat18 = u_xlat4.x + u_xlat18;
    u_xlat18 = u_xlat4.y + u_xlat18;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat5.w = (-u_xlat18) + 1.0;
    vs_TEXCOORD1 = u_xlat5;
    u_xlat4.z = dot(in_TEXCOORD3.zw, vec2(65025.0, 255.0));
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat2.xy = in_TEXCOORD2.yy * vec2(255.0, 8160.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat2.y>=(-u_xlat2.y));
#else
    u_xlatb18 = u_xlat2.y>=(-u_xlat2.y);
#endif
    u_xlat8.xy = (bool(u_xlatb18)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat18 = u_xlat8.y * u_xlat2.x;
    u_xlat18 = fract(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat8.x;
    u_xlat2.x = in_TEXCOORD2.y * 255.0 + (-u_xlat18);
    u_xlat3.x = in_TEXCOORD1.z * 8160.0 + u_xlat18;
    u_xlat18 = in_TEXCOORD1.w * 2040.0;
    u_xlat3.y = u_xlat2.x * 0.03125 + u_xlat18;
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat2.xy * _ShaderInfoTex_TexelSize.xy;
    vs_TEXCOORD3 = u_xlat1;
    u_xlat1 = textureLod(_ShaderInfoTex, u_xlat1.xy, 0.0);
    vs_TEXCOORD5 = u_xlat1;
    u_xlat1 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD4.xy = u_xlat0.xy / u_xlat0.ww;
    gl_Position = u_xlat0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _CustomTex_TexelSize;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ScreenClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GradientSettingsTex;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD4;
flat in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bvec3 u_xlatb3;
vec3 u_xlat4;
float u_xlat5;
mediump vec2 u_xlat16_6;
mediump float u_xlat16_8;
float u_xlat9;
vec3 u_xlat10;
bool u_xlatb10;
vec2 u_xlat11;
bool u_xlatb11;
bool u_xlatb12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
vec2 u_xlat16;
vec2 u_xlat17;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD5.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD5.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(vs_TEXCOORD4.xyxy, _ScreenClipRect.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(_ScreenClipRect.zwzw, vs_TEXCOORD4.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_1.x = (-vs_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_8 = vs_TEXCOORD1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8 = min(max(u_xlat16_8, 0.0), 1.0);
#else
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
#endif
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * u_xlat16_1.xxxx + vs_TEXCOORD1.wwww;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_2 * vec4(u_xlat16_8) + u_xlat0;
    u_xlat2.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat9 = dFdx(u_xlat2.x);
    u_xlat16.x = dFdy(u_xlat2.x);
    u_xlat9 = abs(u_xlat16.x) + abs(u_xlat9);
    u_xlat16.x = (-u_xlat9) + 0.5;
    u_xlat2.y = u_xlat9 + 0.5;
    u_xlat2.xy = (-u_xlat16.xx) + u_xlat2.xy;
    u_xlat9 = float(1.0) / u_xlat2.y;
    u_xlat2.x = u_xlat9 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat9;
    u_xlat16_1.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_1.w = u_xlat2.x * vs_TEXCOORD1.x;
    u_xlat16_0 = u_xlat0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    u_xlatb2.xy = equal(vs_TEXCOORD2.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y || u_xlatb2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = (u_xlatb2.y) ? _CustomTex_TexelSize.xy : _MainTex_TexelSize.xy;
        u_xlat1.y = vs_TEXCOORD2.z + 0.5;
        u_xlat1.x = float(0.5);
        u_xlat15.y = float(0.0);
        u_xlat16.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy;
        u_xlat16_3 = texture(_GradientSettingsTex, u_xlat16.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.0<u_xlat16_3.x);
#else
        u_xlatb3.x = 0.0<u_xlat16_3.x;
#endif
        u_xlat17.xy = u_xlat16_3.zw + vec2(-0.5, -0.5);
        u_xlat17.xy = u_xlat17.xy + u_xlat17.xy;
        u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
        u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + (-u_xlat17.xy);
        u_xlat18.x = dot(u_xlat4.xy, u_xlat4.xy);
        u_xlat18.x = inversesqrt(u_xlat18.x);
        u_xlat18.xy = u_xlat18.xx * u_xlat4.xy;
        u_xlat5 = dot((-u_xlat17.xy), u_xlat18.xy);
        u_xlat17.x = dot(u_xlat17.xy, u_xlat17.xy);
        u_xlat17.x = (-u_xlat5) * u_xlat5 + u_xlat17.x;
        u_xlat17.x = (-u_xlat17.x) + 1.0;
        u_xlat17.x = sqrt(u_xlat17.x);
        u_xlat24 = (-u_xlat17.x) + u_xlat5;
        u_xlat17.x = u_xlat17.x + u_xlat5;
        u_xlat5 = min(u_xlat17.x, u_xlat24);
#ifdef UNITY_ADRENO_ES3
        u_xlatb12 = !!(u_xlat5<0.0);
#else
        u_xlatb12 = u_xlat5<0.0;
#endif
        u_xlat17.x = max(u_xlat17.x, u_xlat24);
        u_xlat17.x = (u_xlatb12) ? u_xlat17.x : u_xlat5;
        u_xlat17.xy = u_xlat17.xx * u_xlat18.xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(9.99999975e-05>=abs(u_xlat17.x));
#else
        u_xlatb18 = 9.99999975e-05>=abs(u_xlat17.x);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb25 = !!(9.99999975e-05<abs(u_xlat17.y));
#else
        u_xlatb25 = 9.99999975e-05<abs(u_xlat17.y);
#endif
        u_xlat17.xy = u_xlat4.xy / u_xlat17.xy;
        u_xlat24 = u_xlatb25 ? u_xlat17.y : float(0.0);
        u_xlat11.x = (u_xlatb18) ? u_xlat24 : u_xlat17.x;
        u_xlat11.y = 0.0;
        u_xlat4.yz = (u_xlatb3.x) ? u_xlat11.xy : vs_TEXCOORD0.xy;
        u_xlat16_6.x = u_xlat16_3.y * 255.0;
        u_xlat16_6.x = roundEven(u_xlat16_6.x);
        u_xlati3 = int(u_xlat16_6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat4.y>=(-u_xlat4.y));
#else
        u_xlatb10 = u_xlat4.y>=(-u_xlat4.y);
#endif
        u_xlat17.x = fract(abs(u_xlat4.y));
        u_xlat10.x = (u_xlatb10) ? u_xlat17.x : (-u_xlat17.x);
        u_xlat10.x = (u_xlati3 != 0) ? u_xlat4.y : u_xlat10.x;
        u_xlatb3.xz = equal(ivec4(u_xlati3), ivec4(1, 0, 2, 0)).xz;
        u_xlat24 = u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
        u_xlat3.x = (u_xlatb3.x) ? u_xlat24 : u_xlat10.x;
        u_xlat10.x = u_xlat3.x * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat10.x>=(-u_xlat10.x));
#else
        u_xlatb24 = u_xlat10.x>=(-u_xlat10.x);
#endif
        u_xlat10.x = fract(abs(u_xlat10.x));
        u_xlat10.x = (u_xlatb24) ? u_xlat10.x : (-u_xlat10.x);
        u_xlat24 = u_xlat10.x + u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(0.5<u_xlat10.x);
#else
        u_xlatb10 = 0.5<u_xlat10.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat24>=(-u_xlat24));
#else
        u_xlatb11 = u_xlat24>=(-u_xlat24);
#endif
        u_xlat25 = fract(abs(u_xlat24));
        u_xlat11.x = (u_xlatb11) ? u_xlat25 : (-u_xlat25);
        u_xlat11.x = (-u_xlat11.x) + 1.0;
        u_xlat10.x = (u_xlatb10) ? u_xlat11.x : u_xlat24;
        u_xlat4.x = (u_xlatb3.z) ? u_xlat10.x : u_xlat3.x;
        u_xlat15.x = _GradientSettingsTex_TexelSize.x;
        u_xlat3.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy + u_xlat15.xy;
        u_xlat16_3 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlat10.xz = u_xlat16_3.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat10.xz;
        u_xlat3.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
        u_xlat16.xy = u_xlat15.xy * vec2(2.0, 2.0) + u_xlat16.xy;
        u_xlat16_1 = texture(_GradientSettingsTex, u_xlat16.xy);
        u_xlat16.xy = u_xlat16_1.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_1.xz * vec2(65025.0, 65025.0) + u_xlat16.xy;
        u_xlat16.xy = u_xlat2.xy * u_xlat3.xy;
        u_xlat2.xy = u_xlat2.xy * u_xlat16_6.xy;
        u_xlat2.xy = u_xlat4.xz * u_xlat2.xy + u_xlat16.xy;
        u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
        u_xlat1 = u_xlat10_1 * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat16_2 = texture(_CustomTex, u_xlat2.xy);
        u_xlat1 = u_xlat16_2 * vs_TEXCOORD2.yyyy + u_xlat1;
        u_xlat16_1 = u_xlat1;
    } else {
        u_xlat16_1 = u_xlat0;
    }
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _1PixelClipInvView;
UNITY_LOCATION(4) uniform mediump sampler2D _ShaderInfoTex;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
flat out mediump vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
vec2 u_xlat6;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat12;
vec2 u_xlat14;
vec2 u_xlat15;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0 = in_TEXCOORD2.xxzz * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb1 = greaterThanEqual(u_xlat0.yyww, (-u_xlat0.yyww));
    u_xlat1.x = (u_xlatb1.x) ? float(32.0) : float(-32.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.03125) : float(-0.03125);
    u_xlat1.z = (u_xlatb1.z) ? float(32.0) : float(-32.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.03125) : float(-0.03125);
    u_xlat0.xy = u_xlat0.xz * u_xlat1.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xz;
    u_xlat12.x = in_TEXCOORD3.x * 8160.0 + u_xlat0.y;
    u_xlat1.xy = in_TEXCOORD2.xz * vec2(255.0, 255.0) + (-u_xlat0.xy);
    u_xlat0.x = in_TEXCOORD1.x * 8160.0 + u_xlat0.x;
    u_xlat1.xy = u_xlat1.xy * vec2(0.09375, 0.03125);
    u_xlat12.y = in_TEXCOORD3.y * 2040.0 + u_xlat1.y;
    u_xlat0.y = in_TEXCOORD1.y * 2040.0 + u_xlat1.x;
    u_xlat12.xy = u_xlat12.xy + vec2(0.5, 0.5);
    u_xlat1.zw = u_xlat12.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat12.x = textureLod(_ShaderInfoTex, u_xlat1.zw, 0.0).w;
    u_xlat2.w = u_xlat12.x * in_COLOR0.w;
    u_xlat2.xyz = in_COLOR0.xyz;
    vs_COLOR0 = u_xlat2;
    u_xlat2 = u_xlat0.xyxy + vec4(0.5, 0.5, 0.5, 1.5);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 2.5);
    u_xlat0.xy = u_xlat0.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat0 = textureLod(_ShaderInfoTex, u_xlat0.xy, 0.0);
    u_xlat0.x = dot(u_xlat0, in_POSITION0);
    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
    u_xlat2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
    u_xlat12.x = dot(u_xlat3.xy, in_TEXCOORD0.xy);
    u_xlat15.x = dot(u_xlat3, in_POSITION0);
    u_xlat12.y = dot(u_xlat2.xy, in_TEXCOORD0.xy);
    u_xlat15.y = dot(u_xlat2, in_POSITION0);
    u_xlat2.xy = u_xlat12.xy * _1PixelClipInvView.zw;
    u_xlat14.xy = abs(u_xlat2.xy) + vec2(9.99999997e-07, 9.99999997e-07);
    u_xlat2.xy = max(abs(u_xlat2.xy), vec2(1.0, 1.0));
    u_xlat3.xy = u_xlat2.xy + vec2(0.0199999996, 0.0199999996);
    u_xlat3.xy = roundEven(u_xlat3.xy);
    u_xlat2.xy = max(u_xlat2.xy, u_xlat3.xy);
    u_xlatb4 = equal(in_TEXCOORD2.wwww, vec4(0.0352941193, 0.0313725509, 0.0274509806, 0.0235294122));
    {
        vec4 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb4.w) ? u_xlat2.x : u_xlat3.x;
        hlslcc_movcTemp.y = (u_xlatb4.z) ? u_xlat2.y : u_xlat3.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat2.xy = u_xlat2.xy / u_xlat14.xy;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = min(u_xlat2.xy, vec2(100.0, 100.0));
    u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat6.xy = u_xlat12.xy * u_xlat2.xy;
    u_xlatb2 = equal(in_TEXCOORD2.wwww, vec4(0.0196078438, 0.0156862754, 0.0117647061, 0.00784313772));
    u_xlatb18 = u_xlatb4.w || u_xlatb2.x;
    u_xlatb18 = u_xlatb4.z || u_xlatb18;
    u_xlat4.x = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.x ? float(1.0) : 0.0;
;
    u_xlat6.xy = bool(u_xlatb18) ? u_xlat6.xy : vec2(0.0, 0.0);
    u_xlat6.xy = u_xlat6.xy + u_xlat15.xy;
    vs_TEXCOORD0.zw = u_xlat6.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = u_xlat3.xy * _MainTex_TexelSize.xy;
    u_xlat2.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat2.z = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat18 = (u_xlatb2.w) ? -1.0 : -0.0;
    u_xlat5.y = u_xlat18 + u_xlat2.y;
    u_xlat18 = u_xlat2.z + u_xlat2.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat18==1.0);
#else
    u_xlatb8 = u_xlat18==1.0;
#endif
    vs_TEXCOORD0.xy = (bool(u_xlatb8)) ? u_xlat15.xy : u_xlat3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(in_TEXCOORD2.w==0.00392156886);
#else
    u_xlatb8 = in_TEXCOORD2.w==0.00392156886;
#endif
    u_xlat5.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat18 = u_xlat18 + u_xlat5.x;
    u_xlat18 = u_xlat2.x + u_xlat18;
    u_xlat5.z = u_xlat2.x;
    u_xlat18 = u_xlat4.x + u_xlat18;
    u_xlat18 = u_xlat4.y + u_xlat18;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat5.w = (-u_xlat18) + 1.0;
    vs_TEXCOORD1 = u_xlat5;
    u_xlat4.z = dot(in_TEXCOORD3.zw, vec2(65025.0, 255.0));
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat2.xy = in_TEXCOORD2.yy * vec2(255.0, 8160.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat2.y>=(-u_xlat2.y));
#else
    u_xlatb18 = u_xlat2.y>=(-u_xlat2.y);
#endif
    u_xlat8.xy = (bool(u_xlatb18)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat18 = u_xlat8.y * u_xlat2.x;
    u_xlat18 = fract(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat8.x;
    u_xlat2.x = in_TEXCOORD2.y * 255.0 + (-u_xlat18);
    u_xlat3.x = in_TEXCOORD1.z * 8160.0 + u_xlat18;
    u_xlat18 = in_TEXCOORD1.w * 2040.0;
    u_xlat3.y = u_xlat2.x * 0.03125 + u_xlat18;
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat2.xy * _ShaderInfoTex_TexelSize.xy;
    vs_TEXCOORD3 = u_xlat1;
    u_xlat1 = textureLod(_ShaderInfoTex, u_xlat1.xy, 0.0);
    vs_TEXCOORD5 = u_xlat1;
    u_xlat1 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD4.xy = u_xlat0.xy / u_xlat0.ww;
    gl_Position = u_xlat0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _CustomTex_TexelSize;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ScreenClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GradientSettingsTex;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD4;
flat in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bvec3 u_xlatb3;
vec3 u_xlat4;
float u_xlat5;
mediump vec2 u_xlat16_6;
mediump float u_xlat16_8;
float u_xlat9;
vec3 u_xlat10;
bool u_xlatb10;
vec2 u_xlat11;
bool u_xlatb11;
bool u_xlatb12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
vec2 u_xlat16;
vec2 u_xlat17;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD5.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD5.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(vs_TEXCOORD4.xyxy, _ScreenClipRect.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(_ScreenClipRect.zwzw, vs_TEXCOORD4.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_1.x = (-vs_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_8 = vs_TEXCOORD1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8 = min(max(u_xlat16_8, 0.0), 1.0);
#else
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
#endif
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * u_xlat16_1.xxxx + vs_TEXCOORD1.wwww;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_2 * vec4(u_xlat16_8) + u_xlat0;
    u_xlat2.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat9 = dFdx(u_xlat2.x);
    u_xlat16.x = dFdy(u_xlat2.x);
    u_xlat9 = abs(u_xlat16.x) + abs(u_xlat9);
    u_xlat16.x = (-u_xlat9) + 0.5;
    u_xlat2.y = u_xlat9 + 0.5;
    u_xlat2.xy = (-u_xlat16.xx) + u_xlat2.xy;
    u_xlat9 = float(1.0) / u_xlat2.y;
    u_xlat2.x = u_xlat9 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat9;
    u_xlat16_1.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_1.w = u_xlat2.x * vs_TEXCOORD1.x;
    u_xlat16_0 = u_xlat0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    u_xlatb2.xy = equal(vs_TEXCOORD2.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y || u_xlatb2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = (u_xlatb2.y) ? _CustomTex_TexelSize.xy : _MainTex_TexelSize.xy;
        u_xlat1.y = vs_TEXCOORD2.z + 0.5;
        u_xlat1.x = float(0.5);
        u_xlat15.y = float(0.0);
        u_xlat16.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy;
        u_xlat16_3 = texture(_GradientSettingsTex, u_xlat16.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.0<u_xlat16_3.x);
#else
        u_xlatb3.x = 0.0<u_xlat16_3.x;
#endif
        u_xlat17.xy = u_xlat16_3.zw + vec2(-0.5, -0.5);
        u_xlat17.xy = u_xlat17.xy + u_xlat17.xy;
        u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
        u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + (-u_xlat17.xy);
        u_xlat18.x = dot(u_xlat4.xy, u_xlat4.xy);
        u_xlat18.x = inversesqrt(u_xlat18.x);
        u_xlat18.xy = u_xlat18.xx * u_xlat4.xy;
        u_xlat5 = dot((-u_xlat17.xy), u_xlat18.xy);
        u_xlat17.x = dot(u_xlat17.xy, u_xlat17.xy);
        u_xlat17.x = (-u_xlat5) * u_xlat5 + u_xlat17.x;
        u_xlat17.x = (-u_xlat17.x) + 1.0;
        u_xlat17.x = sqrt(u_xlat17.x);
        u_xlat24 = (-u_xlat17.x) + u_xlat5;
        u_xlat17.x = u_xlat17.x + u_xlat5;
        u_xlat5 = min(u_xlat17.x, u_xlat24);
#ifdef UNITY_ADRENO_ES3
        u_xlatb12 = !!(u_xlat5<0.0);
#else
        u_xlatb12 = u_xlat5<0.0;
#endif
        u_xlat17.x = max(u_xlat17.x, u_xlat24);
        u_xlat17.x = (u_xlatb12) ? u_xlat17.x : u_xlat5;
        u_xlat17.xy = u_xlat17.xx * u_xlat18.xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(9.99999975e-05>=abs(u_xlat17.x));
#else
        u_xlatb18 = 9.99999975e-05>=abs(u_xlat17.x);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb25 = !!(9.99999975e-05<abs(u_xlat17.y));
#else
        u_xlatb25 = 9.99999975e-05<abs(u_xlat17.y);
#endif
        u_xlat17.xy = u_xlat4.xy / u_xlat17.xy;
        u_xlat24 = u_xlatb25 ? u_xlat17.y : float(0.0);
        u_xlat11.x = (u_xlatb18) ? u_xlat24 : u_xlat17.x;
        u_xlat11.y = 0.0;
        u_xlat4.yz = (u_xlatb3.x) ? u_xlat11.xy : vs_TEXCOORD0.xy;
        u_xlat16_6.x = u_xlat16_3.y * 255.0;
        u_xlat16_6.x = roundEven(u_xlat16_6.x);
        u_xlati3 = int(u_xlat16_6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat4.y>=(-u_xlat4.y));
#else
        u_xlatb10 = u_xlat4.y>=(-u_xlat4.y);
#endif
        u_xlat17.x = fract(abs(u_xlat4.y));
        u_xlat10.x = (u_xlatb10) ? u_xlat17.x : (-u_xlat17.x);
        u_xlat10.x = (u_xlati3 != 0) ? u_xlat4.y : u_xlat10.x;
        u_xlatb3.xz = equal(ivec4(u_xlati3), ivec4(1, 0, 2, 0)).xz;
        u_xlat24 = u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
        u_xlat3.x = (u_xlatb3.x) ? u_xlat24 : u_xlat10.x;
        u_xlat10.x = u_xlat3.x * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat10.x>=(-u_xlat10.x));
#else
        u_xlatb24 = u_xlat10.x>=(-u_xlat10.x);
#endif
        u_xlat10.x = fract(abs(u_xlat10.x));
        u_xlat10.x = (u_xlatb24) ? u_xlat10.x : (-u_xlat10.x);
        u_xlat24 = u_xlat10.x + u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(0.5<u_xlat10.x);
#else
        u_xlatb10 = 0.5<u_xlat10.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat24>=(-u_xlat24));
#else
        u_xlatb11 = u_xlat24>=(-u_xlat24);
#endif
        u_xlat25 = fract(abs(u_xlat24));
        u_xlat11.x = (u_xlatb11) ? u_xlat25 : (-u_xlat25);
        u_xlat11.x = (-u_xlat11.x) + 1.0;
        u_xlat10.x = (u_xlatb10) ? u_xlat11.x : u_xlat24;
        u_xlat4.x = (u_xlatb3.z) ? u_xlat10.x : u_xlat3.x;
        u_xlat15.x = _GradientSettingsTex_TexelSize.x;
        u_xlat3.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy + u_xlat15.xy;
        u_xlat16_3 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlat10.xz = u_xlat16_3.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat10.xz;
        u_xlat3.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
        u_xlat16.xy = u_xlat15.xy * vec2(2.0, 2.0) + u_xlat16.xy;
        u_xlat16_1 = texture(_GradientSettingsTex, u_xlat16.xy);
        u_xlat16.xy = u_xlat16_1.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_1.xz * vec2(65025.0, 65025.0) + u_xlat16.xy;
        u_xlat16.xy = u_xlat2.xy * u_xlat3.xy;
        u_xlat2.xy = u_xlat2.xy * u_xlat16_6.xy;
        u_xlat2.xy = u_xlat4.xz * u_xlat2.xy + u_xlat16.xy;
        u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
        u_xlat1 = u_xlat10_1 * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat16_2 = texture(_CustomTex, u_xlat2.xy);
        u_xlat1 = u_xlat16_2 * vs_TEXCOORD2.yyyy + u_xlat1;
        u_xlat16_1 = u_xlat1;
    } else {
        u_xlat16_1 = u_xlat0;
    }
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
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
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Stencil {
   Ref 255
   CompFront Always
   PassFront Keep
   FailFront Keep
   ZFailFront Replace
   CompBack Equal
   PassBack Keep
   FailBack Keep
   ZFailBack Zero
  }
  GpuProgramID 79444
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _1PixelClipInvView;
uniform 	vec4 _Transforms[60];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec2 u_xlat1;
ivec2 u_xlati1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat7;
vec3 u_xlat11;
float u_xlat14;
vec2 u_xlat15;
bool u_xlatb15;
vec2 u_xlat16;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xyz = in_TEXCOORD2.xzz * vec3(765.0, 255.0, 8160.0);
    u_xlati0 = int(u_xlat0.x);
    u_xlati1.xy = ivec2(u_xlati0) + ivec2(1, 2);
    u_xlatb2 = equal(in_TEXCOORD2.wwww, vec4(0.0352941193, 0.0313725509, 0.0274509806, 0.0235294122));
    u_xlat3.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb2.x ? float(1.0) : 0.0;
;
    u_xlatb4 = equal(in_TEXCOORD2.wwww, vec4(0.0196078438, 0.0156862754, 0.0117647061, 0.00784313772));
    u_xlat11.x = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat11.y = u_xlatb4.z ? float(1.0) : 0.0;
    u_xlat11.z = u_xlatb4.w ? float(1.0) : 0.0;
;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(in_TEXCOORD2.w==0.00392156886);
#else
    u_xlatb21 = in_TEXCOORD2.w==0.00392156886;
#endif
    u_xlat5.x = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat5.y = u_xlat11.z + u_xlat11.y;
    u_xlat21 = u_xlat5.y + u_xlat5.x;
    u_xlat21 = u_xlat11.x + u_xlat21;
    u_xlat21 = u_xlat3.x + u_xlat21;
    u_xlat21 = u_xlat3.y + u_xlat21;
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat5.w = (-u_xlat21) + 1.0;
    u_xlatb21 = u_xlatb2.w || u_xlatb4.x;
    u_xlatb21 = u_xlatb2.z || u_xlatb21;
    if(u_xlatb21){
        u_xlat2.x = dot(_Transforms[u_xlati0].xy, in_TEXCOORD0.xy);
        u_xlat2.y = dot(_Transforms[u_xlati1.x].xy, in_TEXCOORD0.xy);
        u_xlat15.xy = u_xlat2.xy * _1PixelClipInvView.zw;
        u_xlat4.xz = max(abs(u_xlat15.xy), vec2(1.0, 1.0));
        u_xlat6.xy = u_xlat4.xz + vec2(0.0199999996, 0.0199999996);
        u_xlat6.xy = roundEven(u_xlat6.xy);
        u_xlat4.xz = max(u_xlat4.xz, u_xlat6.xy);
        u_xlat16.x = (u_xlatb2.w) ? u_xlat4.x : u_xlat6.x;
        u_xlat16.y = (u_xlatb2.z) ? u_xlat4.z : u_xlat6.y;
        u_xlat15.xy = abs(u_xlat15.xy) + vec2(9.99999997e-07, 9.99999997e-07);
        u_xlat15.xy = u_xlat16.xy / u_xlat15.xy;
        u_xlat15.xy = max(u_xlat15.xy, vec2(0.00999999978, 0.00999999978));
        u_xlat15.xy = min(u_xlat15.xy, vec2(100.0, 100.0));
        u_xlat15.xy = u_xlat15.xy + vec2(-1.0, -1.0);
        u_xlat15.xy = u_xlat2.xy * u_xlat15.xy;
    } else {
        u_xlat15.x = float(0.0);
        u_xlat15.y = float(0.0);
    }
    u_xlat16.x = dot(_Transforms[u_xlati0], in_POSITION0);
    u_xlat16.y = dot(_Transforms[u_xlati1.x], in_POSITION0);
    u_xlat0.x = dot(_Transforms[u_xlati1.y], in_POSITION0);
    u_xlat1.xy = u_xlat15.xy + u_xlat16.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat6 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat6 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat6;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat6;
    vs_TEXCOORD4.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat0.xw = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat5.y==1.0);
#else
    u_xlatb15 = u_xlat5.y==1.0;
#endif
    u_xlat4.xz = u_xlat0.xw * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (bool(u_xlatb15)) ? u_xlat4.xz : u_xlat0.xw;
    u_xlat3.z = dot(in_TEXCOORD3.zw, vec2(65025.0, 255.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.z>=(-u_xlat0.z));
#else
    u_xlatb0 = u_xlat0.z>=(-u_xlat0.z);
#endif
    u_xlat0.xz = (bool(u_xlatb0)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat7 = u_xlat0.z * u_xlat0.y;
    u_xlat7 = fract(u_xlat7);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat7 = in_TEXCOORD2.z * 255.0 + (-u_xlat0.x);
    u_xlat14 = in_TEXCOORD3.y * 2040.0;
    u_xlat15.x = in_TEXCOORD3.x * 8160.0 + u_xlat0.x;
    u_xlat15.y = u_xlat7 * 0.03125 + u_xlat14;
    u_xlat0.xy = u_xlat15.xy + vec2(0.5, 0.5);
    u_xlat0.zw = u_xlat0.xy * _ShaderInfoTex_TexelSize.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    u_xlat5.z = u_xlat11.x;
    vs_TEXCOORD1 = u_xlat5;
    u_xlat0.x = in_TEXCOORD2.y * 255.0;
    u_xlat0.y = 0.0;
    vs_TEXCOORD3 = u_xlat0;
    vs_TEXCOORD2.xyz = u_xlat3.xyz;
    gl_Position = u_xlat2;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _CustomTex_TexelSize;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ScreenClipRect;
uniform 	vec4 _ClipRects[20];
UNITY_LOCATION(0) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomTex;
UNITY_LOCATION(4) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
uint u_xlatu0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec2 u_xlat16_6;
vec2 u_xlat7;
bvec2 u_xlatb7;
vec2 u_xlat12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat16;
vec2 u_xlat17;
bool u_xlatb17;
float u_xlat18;
bool u_xlatb19;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlatu0 = uint(vs_TEXCOORD3.x);
    u_xlatb0.yz = greaterThanEqual(vs_TEXCOORD0.zzwz, _ClipRects[int(u_xlatu0)].xxyx).yz;
    u_xlatb0.xw = greaterThanEqual(_ClipRects[int(u_xlatu0)].zzzw, vs_TEXCOORD0.zzzw).xw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xw + u_xlat0.yz;
    u_xlatb14.xy = greaterThanEqual(vs_TEXCOORD4.xyxy, _ScreenClipRect.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(_ScreenClipRect.zwzw, vs_TEXCOORD4.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_0 = texture(_ShaderInfoTex, vs_TEXCOORD3.zw).w;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat7.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat14.x = dFdx(u_xlat7.x);
    u_xlat21 = dFdy(u_xlat7.x);
    u_xlat14.x = abs(u_xlat21) + abs(u_xlat14.x);
    u_xlat21 = (-u_xlat14.x) + 0.5;
    u_xlat7.y = u_xlat14.x + 0.5;
    u_xlat7.xy = (-vec2(u_xlat21)) + u_xlat7.xy;
    u_xlat14.x = float(1.0) / u_xlat7.y;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat16_2.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_2.w = u_xlat7.x * vs_TEXCOORD1.x;
    u_xlat16_1 = u_xlat1 + u_xlat16_2;
    u_xlat16_2 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vs_TEXCOORD1.zzzz + u_xlat16_1;
    u_xlatb7.xy = equal(vs_TEXCOORD2.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.y || u_xlatb7.x;
    if(u_xlatb7.x){
        u_xlat7.xy = (u_xlatb7.y) ? _CustomTex_TexelSize.xy : _MainTex_TexelSize.xy;
        u_xlat2.y = vs_TEXCOORD2.z + 0.5;
        u_xlat2.x = float(0.5);
        u_xlat16.y = float(0.0);
        u_xlat3.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy;
        u_xlat16_4 = texture(_GradientSettingsTex, u_xlat3.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(0.0<u_xlat16_4.x);
#else
        u_xlatb21 = 0.0<u_xlat16_4.x;
#endif
        u_xlat17.xy = u_xlat16_4.zw + vec2(-0.5, -0.5);
        u_xlat17.xy = u_xlat17.xy + u_xlat17.xy;
        u_xlat4.xz = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
        u_xlat4.xz = u_xlat4.xz * vec2(2.0, 2.0) + (-u_xlat17.xy);
        u_xlat25 = dot(u_xlat4.xz, u_xlat4.xz);
        u_xlat25 = inversesqrt(u_xlat25);
        u_xlat5.xy = vec2(u_xlat25) * u_xlat4.xz;
        u_xlat25 = dot((-u_xlat17.xy), u_xlat5.xy);
        u_xlat17.x = dot(u_xlat17.xy, u_xlat17.xy);
        u_xlat17.x = (-u_xlat25) * u_xlat25 + u_xlat17.x;
        u_xlat17.x = (-u_xlat17.x) + 1.0;
        u_xlat17.x = sqrt(u_xlat17.x);
        u_xlat24 = (-u_xlat17.x) + u_xlat25;
        u_xlat17.x = u_xlat17.x + u_xlat25;
        u_xlat25 = min(u_xlat17.x, u_xlat24);
#ifdef UNITY_ADRENO_ES3
        u_xlatb19 = !!(u_xlat25<0.0);
#else
        u_xlatb19 = u_xlat25<0.0;
#endif
        u_xlat17.x = max(u_xlat17.x, u_xlat24);
        u_xlat17.x = (u_xlatb19) ? u_xlat17.x : u_xlat25;
        u_xlat17.xy = u_xlat17.xx * u_xlat5.xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb25 = !!(9.99999975e-05>=abs(u_xlat17.x));
#else
        u_xlatb25 = 9.99999975e-05>=abs(u_xlat17.x);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(9.99999975e-05<abs(u_xlat17.y));
#else
        u_xlatb5 = 9.99999975e-05<abs(u_xlat17.y);
#endif
        u_xlat17.xy = u_xlat4.xz / u_xlat17.xy;
        u_xlat24 = u_xlatb5 ? u_xlat17.y : float(0.0);
        u_xlat12.x = (u_xlatb25) ? u_xlat24 : u_xlat17.x;
        u_xlat12.y = 0.0;
        u_xlat5.yz = (bool(u_xlatb21)) ? u_xlat12.xy : vs_TEXCOORD0.xy;
        u_xlat16_6.x = u_xlat16_4.y * 255.0;
        u_xlat16_6.x = roundEven(u_xlat16_6.x);
        u_xlati21 = int(u_xlat16_6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(u_xlat5.y>=(-u_xlat5.y));
#else
        u_xlatb17 = u_xlat5.y>=(-u_xlat5.y);
#endif
        u_xlat24 = fract(abs(u_xlat5.y));
        u_xlat17.x = (u_xlatb17) ? u_xlat24 : (-u_xlat24);
        u_xlat17.x = (u_xlati21 != 0) ? u_xlat5.y : u_xlat17.x;
        u_xlatb4.xy = equal(ivec4(u_xlati21), ivec4(1, 2, 0, 0)).xy;
        u_xlat21 = u_xlat17.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
        u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
        u_xlat21 = (u_xlatb4.x) ? u_xlat21 : u_xlat17.x;
        u_xlat17.x = u_xlat21 * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat17.x>=(-u_xlat17.x));
#else
        u_xlatb24 = u_xlat17.x>=(-u_xlat17.x);
#endif
        u_xlat17.x = fract(abs(u_xlat17.x));
        u_xlat17.x = (u_xlatb24) ? u_xlat17.x : (-u_xlat17.x);
        u_xlat24 = u_xlat17.x + u_xlat17.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(0.5<u_xlat17.x);
#else
        u_xlatb17 = 0.5<u_xlat17.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb4.x = !!(u_xlat24>=(-u_xlat24));
#else
        u_xlatb4.x = u_xlat24>=(-u_xlat24);
#endif
        u_xlat18 = fract(abs(u_xlat24));
        u_xlat4.x = (u_xlatb4.x) ? u_xlat18 : (-u_xlat18);
        u_xlat4.x = (-u_xlat4.x) + 1.0;
        u_xlat17.x = (u_xlatb17) ? u_xlat4.x : u_xlat24;
        u_xlat5.x = (u_xlatb4.y) ? u_xlat17.x : u_xlat21;
        u_xlat16.x = _GradientSettingsTex_TexelSize.x;
        u_xlat17.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy + u_xlat16.xy;
        u_xlat16_4 = texture(_GradientSettingsTex, u_xlat17.xy);
        u_xlat17.xy = u_xlat16_4.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_4.xz * vec2(65025.0, 65025.0) + u_xlat17.xy;
        u_xlat17.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
        u_xlat3.xy = u_xlat16.xy * vec2(2.0, 2.0) + u_xlat3.xy;
        u_xlat16_2 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlat3.xy = u_xlat16_2.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_2.xz * vec2(65025.0, 65025.0) + u_xlat3.xy;
        u_xlat3.xy = u_xlat7.xy * u_xlat17.xy;
        u_xlat7.xy = u_xlat7.xy * u_xlat16_6.xy;
        u_xlat7.xy = u_xlat5.xz * u_xlat7.xy + u_xlat3.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat7.xy);
        u_xlat2 = u_xlat16_2 * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat16_3 = texture(_CustomTex, u_xlat7.xy);
        u_xlat2 = u_xlat16_3 * vs_TEXCOORD2.yyyy + u_xlat2;
        u_xlat16_2 = u_xlat2;
    } else {
        u_xlat16_2 = u_xlat1;
    }
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.w;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _1PixelClipInvView;
uniform 	vec4 _Transforms[60];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec2 u_xlat1;
ivec2 u_xlati1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat7;
vec3 u_xlat11;
float u_xlat14;
vec2 u_xlat15;
bool u_xlatb15;
vec2 u_xlat16;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xyz = in_TEXCOORD2.xzz * vec3(765.0, 255.0, 8160.0);
    u_xlati0 = int(u_xlat0.x);
    u_xlati1.xy = ivec2(u_xlati0) + ivec2(1, 2);
    u_xlatb2 = equal(in_TEXCOORD2.wwww, vec4(0.0352941193, 0.0313725509, 0.0274509806, 0.0235294122));
    u_xlat3.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb2.x ? float(1.0) : 0.0;
;
    u_xlatb4 = equal(in_TEXCOORD2.wwww, vec4(0.0196078438, 0.0156862754, 0.0117647061, 0.00784313772));
    u_xlat11.x = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat11.y = u_xlatb4.z ? float(1.0) : 0.0;
    u_xlat11.z = u_xlatb4.w ? float(1.0) : 0.0;
;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(in_TEXCOORD2.w==0.00392156886);
#else
    u_xlatb21 = in_TEXCOORD2.w==0.00392156886;
#endif
    u_xlat5.x = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat5.y = u_xlat11.z + u_xlat11.y;
    u_xlat21 = u_xlat5.y + u_xlat5.x;
    u_xlat21 = u_xlat11.x + u_xlat21;
    u_xlat21 = u_xlat3.x + u_xlat21;
    u_xlat21 = u_xlat3.y + u_xlat21;
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat5.w = (-u_xlat21) + 1.0;
    u_xlatb21 = u_xlatb2.w || u_xlatb4.x;
    u_xlatb21 = u_xlatb2.z || u_xlatb21;
    if(u_xlatb21){
        u_xlat2.x = dot(_Transforms[u_xlati0].xy, in_TEXCOORD0.xy);
        u_xlat2.y = dot(_Transforms[u_xlati1.x].xy, in_TEXCOORD0.xy);
        u_xlat15.xy = u_xlat2.xy * _1PixelClipInvView.zw;
        u_xlat4.xz = max(abs(u_xlat15.xy), vec2(1.0, 1.0));
        u_xlat6.xy = u_xlat4.xz + vec2(0.0199999996, 0.0199999996);
        u_xlat6.xy = roundEven(u_xlat6.xy);
        u_xlat4.xz = max(u_xlat4.xz, u_xlat6.xy);
        u_xlat16.x = (u_xlatb2.w) ? u_xlat4.x : u_xlat6.x;
        u_xlat16.y = (u_xlatb2.z) ? u_xlat4.z : u_xlat6.y;
        u_xlat15.xy = abs(u_xlat15.xy) + vec2(9.99999997e-07, 9.99999997e-07);
        u_xlat15.xy = u_xlat16.xy / u_xlat15.xy;
        u_xlat15.xy = max(u_xlat15.xy, vec2(0.00999999978, 0.00999999978));
        u_xlat15.xy = min(u_xlat15.xy, vec2(100.0, 100.0));
        u_xlat15.xy = u_xlat15.xy + vec2(-1.0, -1.0);
        u_xlat15.xy = u_xlat2.xy * u_xlat15.xy;
    } else {
        u_xlat15.x = float(0.0);
        u_xlat15.y = float(0.0);
    }
    u_xlat16.x = dot(_Transforms[u_xlati0], in_POSITION0);
    u_xlat16.y = dot(_Transforms[u_xlati1.x], in_POSITION0);
    u_xlat0.x = dot(_Transforms[u_xlati1.y], in_POSITION0);
    u_xlat1.xy = u_xlat15.xy + u_xlat16.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat6 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat6 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat6;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat6;
    vs_TEXCOORD4.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat0.xw = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat5.y==1.0);
#else
    u_xlatb15 = u_xlat5.y==1.0;
#endif
    u_xlat4.xz = u_xlat0.xw * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (bool(u_xlatb15)) ? u_xlat4.xz : u_xlat0.xw;
    u_xlat3.z = dot(in_TEXCOORD3.zw, vec2(65025.0, 255.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.z>=(-u_xlat0.z));
#else
    u_xlatb0 = u_xlat0.z>=(-u_xlat0.z);
#endif
    u_xlat0.xz = (bool(u_xlatb0)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat7 = u_xlat0.z * u_xlat0.y;
    u_xlat7 = fract(u_xlat7);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat7 = in_TEXCOORD2.z * 255.0 + (-u_xlat0.x);
    u_xlat14 = in_TEXCOORD3.y * 2040.0;
    u_xlat15.x = in_TEXCOORD3.x * 8160.0 + u_xlat0.x;
    u_xlat15.y = u_xlat7 * 0.03125 + u_xlat14;
    u_xlat0.xy = u_xlat15.xy + vec2(0.5, 0.5);
    u_xlat0.zw = u_xlat0.xy * _ShaderInfoTex_TexelSize.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    u_xlat5.z = u_xlat11.x;
    vs_TEXCOORD1 = u_xlat5;
    u_xlat0.x = in_TEXCOORD2.y * 255.0;
    u_xlat0.y = 0.0;
    vs_TEXCOORD3 = u_xlat0;
    vs_TEXCOORD2.xyz = u_xlat3.xyz;
    gl_Position = u_xlat2;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _CustomTex_TexelSize;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ScreenClipRect;
uniform 	vec4 _ClipRects[20];
UNITY_LOCATION(0) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomTex;
UNITY_LOCATION(4) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
uint u_xlatu0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec2 u_xlat16_6;
vec2 u_xlat7;
bvec2 u_xlatb7;
vec2 u_xlat12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat16;
vec2 u_xlat17;
bool u_xlatb17;
float u_xlat18;
bool u_xlatb19;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlatu0 = uint(vs_TEXCOORD3.x);
    u_xlatb0.yz = greaterThanEqual(vs_TEXCOORD0.zzwz, _ClipRects[int(u_xlatu0)].xxyx).yz;
    u_xlatb0.xw = greaterThanEqual(_ClipRects[int(u_xlatu0)].zzzw, vs_TEXCOORD0.zzzw).xw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xw + u_xlat0.yz;
    u_xlatb14.xy = greaterThanEqual(vs_TEXCOORD4.xyxy, _ScreenClipRect.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(_ScreenClipRect.zwzw, vs_TEXCOORD4.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_0 = texture(_ShaderInfoTex, vs_TEXCOORD3.zw).w;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat7.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat14.x = dFdx(u_xlat7.x);
    u_xlat21 = dFdy(u_xlat7.x);
    u_xlat14.x = abs(u_xlat21) + abs(u_xlat14.x);
    u_xlat21 = (-u_xlat14.x) + 0.5;
    u_xlat7.y = u_xlat14.x + 0.5;
    u_xlat7.xy = (-vec2(u_xlat21)) + u_xlat7.xy;
    u_xlat14.x = float(1.0) / u_xlat7.y;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat16_2.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_2.w = u_xlat7.x * vs_TEXCOORD1.x;
    u_xlat16_1 = u_xlat1 + u_xlat16_2;
    u_xlat16_2 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vs_TEXCOORD1.zzzz + u_xlat16_1;
    u_xlatb7.xy = equal(vs_TEXCOORD2.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.y || u_xlatb7.x;
    if(u_xlatb7.x){
        u_xlat7.xy = (u_xlatb7.y) ? _CustomTex_TexelSize.xy : _MainTex_TexelSize.xy;
        u_xlat2.y = vs_TEXCOORD2.z + 0.5;
        u_xlat2.x = float(0.5);
        u_xlat16.y = float(0.0);
        u_xlat3.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy;
        u_xlat16_4 = texture(_GradientSettingsTex, u_xlat3.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(0.0<u_xlat16_4.x);
#else
        u_xlatb21 = 0.0<u_xlat16_4.x;
#endif
        u_xlat17.xy = u_xlat16_4.zw + vec2(-0.5, -0.5);
        u_xlat17.xy = u_xlat17.xy + u_xlat17.xy;
        u_xlat4.xz = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
        u_xlat4.xz = u_xlat4.xz * vec2(2.0, 2.0) + (-u_xlat17.xy);
        u_xlat25 = dot(u_xlat4.xz, u_xlat4.xz);
        u_xlat25 = inversesqrt(u_xlat25);
        u_xlat5.xy = vec2(u_xlat25) * u_xlat4.xz;
        u_xlat25 = dot((-u_xlat17.xy), u_xlat5.xy);
        u_xlat17.x = dot(u_xlat17.xy, u_xlat17.xy);
        u_xlat17.x = (-u_xlat25) * u_xlat25 + u_xlat17.x;
        u_xlat17.x = (-u_xlat17.x) + 1.0;
        u_xlat17.x = sqrt(u_xlat17.x);
        u_xlat24 = (-u_xlat17.x) + u_xlat25;
        u_xlat17.x = u_xlat17.x + u_xlat25;
        u_xlat25 = min(u_xlat17.x, u_xlat24);
#ifdef UNITY_ADRENO_ES3
        u_xlatb19 = !!(u_xlat25<0.0);
#else
        u_xlatb19 = u_xlat25<0.0;
#endif
        u_xlat17.x = max(u_xlat17.x, u_xlat24);
        u_xlat17.x = (u_xlatb19) ? u_xlat17.x : u_xlat25;
        u_xlat17.xy = u_xlat17.xx * u_xlat5.xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb25 = !!(9.99999975e-05>=abs(u_xlat17.x));
#else
        u_xlatb25 = 9.99999975e-05>=abs(u_xlat17.x);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(9.99999975e-05<abs(u_xlat17.y));
#else
        u_xlatb5 = 9.99999975e-05<abs(u_xlat17.y);
#endif
        u_xlat17.xy = u_xlat4.xz / u_xlat17.xy;
        u_xlat24 = u_xlatb5 ? u_xlat17.y : float(0.0);
        u_xlat12.x = (u_xlatb25) ? u_xlat24 : u_xlat17.x;
        u_xlat12.y = 0.0;
        u_xlat5.yz = (bool(u_xlatb21)) ? u_xlat12.xy : vs_TEXCOORD0.xy;
        u_xlat16_6.x = u_xlat16_4.y * 255.0;
        u_xlat16_6.x = roundEven(u_xlat16_6.x);
        u_xlati21 = int(u_xlat16_6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(u_xlat5.y>=(-u_xlat5.y));
#else
        u_xlatb17 = u_xlat5.y>=(-u_xlat5.y);
#endif
        u_xlat24 = fract(abs(u_xlat5.y));
        u_xlat17.x = (u_xlatb17) ? u_xlat24 : (-u_xlat24);
        u_xlat17.x = (u_xlati21 != 0) ? u_xlat5.y : u_xlat17.x;
        u_xlatb4.xy = equal(ivec4(u_xlati21), ivec4(1, 2, 0, 0)).xy;
        u_xlat21 = u_xlat17.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
        u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
        u_xlat21 = (u_xlatb4.x) ? u_xlat21 : u_xlat17.x;
        u_xlat17.x = u_xlat21 * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat17.x>=(-u_xlat17.x));
#else
        u_xlatb24 = u_xlat17.x>=(-u_xlat17.x);
#endif
        u_xlat17.x = fract(abs(u_xlat17.x));
        u_xlat17.x = (u_xlatb24) ? u_xlat17.x : (-u_xlat17.x);
        u_xlat24 = u_xlat17.x + u_xlat17.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(0.5<u_xlat17.x);
#else
        u_xlatb17 = 0.5<u_xlat17.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb4.x = !!(u_xlat24>=(-u_xlat24));
#else
        u_xlatb4.x = u_xlat24>=(-u_xlat24);
#endif
        u_xlat18 = fract(abs(u_xlat24));
        u_xlat4.x = (u_xlatb4.x) ? u_xlat18 : (-u_xlat18);
        u_xlat4.x = (-u_xlat4.x) + 1.0;
        u_xlat17.x = (u_xlatb17) ? u_xlat4.x : u_xlat24;
        u_xlat5.x = (u_xlatb4.y) ? u_xlat17.x : u_xlat21;
        u_xlat16.x = _GradientSettingsTex_TexelSize.x;
        u_xlat17.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy + u_xlat16.xy;
        u_xlat16_4 = texture(_GradientSettingsTex, u_xlat17.xy);
        u_xlat17.xy = u_xlat16_4.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_4.xz * vec2(65025.0, 65025.0) + u_xlat17.xy;
        u_xlat17.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
        u_xlat3.xy = u_xlat16.xy * vec2(2.0, 2.0) + u_xlat3.xy;
        u_xlat16_2 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlat3.xy = u_xlat16_2.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_2.xz * vec2(65025.0, 65025.0) + u_xlat3.xy;
        u_xlat3.xy = u_xlat7.xy * u_xlat17.xy;
        u_xlat7.xy = u_xlat7.xy * u_xlat16_6.xy;
        u_xlat7.xy = u_xlat5.xz * u_xlat7.xy + u_xlat3.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat7.xy);
        u_xlat2 = u_xlat16_2 * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat16_3 = texture(_CustomTex, u_xlat7.xy);
        u_xlat2 = u_xlat16_3 * vs_TEXCOORD2.yyyy + u_xlat2;
        u_xlat16_2 = u_xlat2;
    } else {
        u_xlat16_2 = u_xlat1;
    }
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.w;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _1PixelClipInvView;
uniform 	vec4 _Transforms[60];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec2 u_xlat1;
ivec2 u_xlati1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat7;
vec3 u_xlat11;
float u_xlat14;
vec2 u_xlat15;
bool u_xlatb15;
vec2 u_xlat16;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xyz = in_TEXCOORD2.xzz * vec3(765.0, 255.0, 8160.0);
    u_xlati0 = int(u_xlat0.x);
    u_xlati1.xy = ivec2(u_xlati0) + ivec2(1, 2);
    u_xlatb2 = equal(in_TEXCOORD2.wwww, vec4(0.0352941193, 0.0313725509, 0.0274509806, 0.0235294122));
    u_xlat3.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb2.x ? float(1.0) : 0.0;
;
    u_xlatb4 = equal(in_TEXCOORD2.wwww, vec4(0.0196078438, 0.0156862754, 0.0117647061, 0.00784313772));
    u_xlat11.x = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat11.y = u_xlatb4.z ? float(1.0) : 0.0;
    u_xlat11.z = u_xlatb4.w ? float(1.0) : 0.0;
;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(in_TEXCOORD2.w==0.00392156886);
#else
    u_xlatb21 = in_TEXCOORD2.w==0.00392156886;
#endif
    u_xlat5.x = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat5.y = u_xlat11.z + u_xlat11.y;
    u_xlat21 = u_xlat5.y + u_xlat5.x;
    u_xlat21 = u_xlat11.x + u_xlat21;
    u_xlat21 = u_xlat3.x + u_xlat21;
    u_xlat21 = u_xlat3.y + u_xlat21;
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat5.w = (-u_xlat21) + 1.0;
    u_xlatb21 = u_xlatb2.w || u_xlatb4.x;
    u_xlatb21 = u_xlatb2.z || u_xlatb21;
    if(u_xlatb21){
        u_xlat2.x = dot(_Transforms[u_xlati0].xy, in_TEXCOORD0.xy);
        u_xlat2.y = dot(_Transforms[u_xlati1.x].xy, in_TEXCOORD0.xy);
        u_xlat15.xy = u_xlat2.xy * _1PixelClipInvView.zw;
        u_xlat4.xz = max(abs(u_xlat15.xy), vec2(1.0, 1.0));
        u_xlat6.xy = u_xlat4.xz + vec2(0.0199999996, 0.0199999996);
        u_xlat6.xy = roundEven(u_xlat6.xy);
        u_xlat4.xz = max(u_xlat4.xz, u_xlat6.xy);
        u_xlat16.x = (u_xlatb2.w) ? u_xlat4.x : u_xlat6.x;
        u_xlat16.y = (u_xlatb2.z) ? u_xlat4.z : u_xlat6.y;
        u_xlat15.xy = abs(u_xlat15.xy) + vec2(9.99999997e-07, 9.99999997e-07);
        u_xlat15.xy = u_xlat16.xy / u_xlat15.xy;
        u_xlat15.xy = max(u_xlat15.xy, vec2(0.00999999978, 0.00999999978));
        u_xlat15.xy = min(u_xlat15.xy, vec2(100.0, 100.0));
        u_xlat15.xy = u_xlat15.xy + vec2(-1.0, -1.0);
        u_xlat15.xy = u_xlat2.xy * u_xlat15.xy;
    } else {
        u_xlat15.x = float(0.0);
        u_xlat15.y = float(0.0);
    }
    u_xlat16.x = dot(_Transforms[u_xlati0], in_POSITION0);
    u_xlat16.y = dot(_Transforms[u_xlati1.x], in_POSITION0);
    u_xlat0.x = dot(_Transforms[u_xlati1.y], in_POSITION0);
    u_xlat1.xy = u_xlat15.xy + u_xlat16.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat6 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat6 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat6;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat6;
    vs_TEXCOORD4.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat0.xw = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat5.y==1.0);
#else
    u_xlatb15 = u_xlat5.y==1.0;
#endif
    u_xlat4.xz = u_xlat0.xw * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (bool(u_xlatb15)) ? u_xlat4.xz : u_xlat0.xw;
    u_xlat3.z = dot(in_TEXCOORD3.zw, vec2(65025.0, 255.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.z>=(-u_xlat0.z));
#else
    u_xlatb0 = u_xlat0.z>=(-u_xlat0.z);
#endif
    u_xlat0.xz = (bool(u_xlatb0)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat7 = u_xlat0.z * u_xlat0.y;
    u_xlat7 = fract(u_xlat7);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat7 = in_TEXCOORD2.z * 255.0 + (-u_xlat0.x);
    u_xlat14 = in_TEXCOORD3.y * 2040.0;
    u_xlat15.x = in_TEXCOORD3.x * 8160.0 + u_xlat0.x;
    u_xlat15.y = u_xlat7 * 0.03125 + u_xlat14;
    u_xlat0.xy = u_xlat15.xy + vec2(0.5, 0.5);
    u_xlat0.zw = u_xlat0.xy * _ShaderInfoTex_TexelSize.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    u_xlat5.z = u_xlat11.x;
    vs_TEXCOORD1 = u_xlat5;
    u_xlat0.x = in_TEXCOORD2.y * 255.0;
    u_xlat0.y = 0.0;
    vs_TEXCOORD3 = u_xlat0;
    vs_TEXCOORD2.xyz = u_xlat3.xyz;
    gl_Position = u_xlat2;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _CustomTex_TexelSize;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ScreenClipRect;
uniform 	vec4 _ClipRects[20];
UNITY_LOCATION(0) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomTex;
UNITY_LOCATION(4) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
uint u_xlatu0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec2 u_xlat16_6;
vec2 u_xlat7;
bvec2 u_xlatb7;
vec2 u_xlat12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat16;
vec2 u_xlat17;
bool u_xlatb17;
float u_xlat18;
bool u_xlatb19;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlatu0 = uint(vs_TEXCOORD3.x);
    u_xlatb0.yz = greaterThanEqual(vs_TEXCOORD0.zzwz, _ClipRects[int(u_xlatu0)].xxyx).yz;
    u_xlatb0.xw = greaterThanEqual(_ClipRects[int(u_xlatu0)].zzzw, vs_TEXCOORD0.zzzw).xw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xw + u_xlat0.yz;
    u_xlatb14.xy = greaterThanEqual(vs_TEXCOORD4.xyxy, _ScreenClipRect.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(_ScreenClipRect.zwzw, vs_TEXCOORD4.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_0 = texture(_ShaderInfoTex, vs_TEXCOORD3.zw).w;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat7.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat14.x = dFdx(u_xlat7.x);
    u_xlat21 = dFdy(u_xlat7.x);
    u_xlat14.x = abs(u_xlat21) + abs(u_xlat14.x);
    u_xlat21 = (-u_xlat14.x) + 0.5;
    u_xlat7.y = u_xlat14.x + 0.5;
    u_xlat7.xy = (-vec2(u_xlat21)) + u_xlat7.xy;
    u_xlat14.x = float(1.0) / u_xlat7.y;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat16_2.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_2.w = u_xlat7.x * vs_TEXCOORD1.x;
    u_xlat16_1 = u_xlat1 + u_xlat16_2;
    u_xlat16_2 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vs_TEXCOORD1.zzzz + u_xlat16_1;
    u_xlatb7.xy = equal(vs_TEXCOORD2.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.y || u_xlatb7.x;
    if(u_xlatb7.x){
        u_xlat7.xy = (u_xlatb7.y) ? _CustomTex_TexelSize.xy : _MainTex_TexelSize.xy;
        u_xlat2.y = vs_TEXCOORD2.z + 0.5;
        u_xlat2.x = float(0.5);
        u_xlat16.y = float(0.0);
        u_xlat3.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy;
        u_xlat16_4 = texture(_GradientSettingsTex, u_xlat3.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(0.0<u_xlat16_4.x);
#else
        u_xlatb21 = 0.0<u_xlat16_4.x;
#endif
        u_xlat17.xy = u_xlat16_4.zw + vec2(-0.5, -0.5);
        u_xlat17.xy = u_xlat17.xy + u_xlat17.xy;
        u_xlat4.xz = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
        u_xlat4.xz = u_xlat4.xz * vec2(2.0, 2.0) + (-u_xlat17.xy);
        u_xlat25 = dot(u_xlat4.xz, u_xlat4.xz);
        u_xlat25 = inversesqrt(u_xlat25);
        u_xlat5.xy = vec2(u_xlat25) * u_xlat4.xz;
        u_xlat25 = dot((-u_xlat17.xy), u_xlat5.xy);
        u_xlat17.x = dot(u_xlat17.xy, u_xlat17.xy);
        u_xlat17.x = (-u_xlat25) * u_xlat25 + u_xlat17.x;
        u_xlat17.x = (-u_xlat17.x) + 1.0;
        u_xlat17.x = sqrt(u_xlat17.x);
        u_xlat24 = (-u_xlat17.x) + u_xlat25;
        u_xlat17.x = u_xlat17.x + u_xlat25;
        u_xlat25 = min(u_xlat17.x, u_xlat24);
#ifdef UNITY_ADRENO_ES3
        u_xlatb19 = !!(u_xlat25<0.0);
#else
        u_xlatb19 = u_xlat25<0.0;
#endif
        u_xlat17.x = max(u_xlat17.x, u_xlat24);
        u_xlat17.x = (u_xlatb19) ? u_xlat17.x : u_xlat25;
        u_xlat17.xy = u_xlat17.xx * u_xlat5.xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb25 = !!(9.99999975e-05>=abs(u_xlat17.x));
#else
        u_xlatb25 = 9.99999975e-05>=abs(u_xlat17.x);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(9.99999975e-05<abs(u_xlat17.y));
#else
        u_xlatb5 = 9.99999975e-05<abs(u_xlat17.y);
#endif
        u_xlat17.xy = u_xlat4.xz / u_xlat17.xy;
        u_xlat24 = u_xlatb5 ? u_xlat17.y : float(0.0);
        u_xlat12.x = (u_xlatb25) ? u_xlat24 : u_xlat17.x;
        u_xlat12.y = 0.0;
        u_xlat5.yz = (bool(u_xlatb21)) ? u_xlat12.xy : vs_TEXCOORD0.xy;
        u_xlat16_6.x = u_xlat16_4.y * 255.0;
        u_xlat16_6.x = roundEven(u_xlat16_6.x);
        u_xlati21 = int(u_xlat16_6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(u_xlat5.y>=(-u_xlat5.y));
#else
        u_xlatb17 = u_xlat5.y>=(-u_xlat5.y);
#endif
        u_xlat24 = fract(abs(u_xlat5.y));
        u_xlat17.x = (u_xlatb17) ? u_xlat24 : (-u_xlat24);
        u_xlat17.x = (u_xlati21 != 0) ? u_xlat5.y : u_xlat17.x;
        u_xlatb4.xy = equal(ivec4(u_xlati21), ivec4(1, 2, 0, 0)).xy;
        u_xlat21 = u_xlat17.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
        u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
        u_xlat21 = (u_xlatb4.x) ? u_xlat21 : u_xlat17.x;
        u_xlat17.x = u_xlat21 * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat17.x>=(-u_xlat17.x));
#else
        u_xlatb24 = u_xlat17.x>=(-u_xlat17.x);
#endif
        u_xlat17.x = fract(abs(u_xlat17.x));
        u_xlat17.x = (u_xlatb24) ? u_xlat17.x : (-u_xlat17.x);
        u_xlat24 = u_xlat17.x + u_xlat17.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(0.5<u_xlat17.x);
#else
        u_xlatb17 = 0.5<u_xlat17.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb4.x = !!(u_xlat24>=(-u_xlat24));
#else
        u_xlatb4.x = u_xlat24>=(-u_xlat24);
#endif
        u_xlat18 = fract(abs(u_xlat24));
        u_xlat4.x = (u_xlatb4.x) ? u_xlat18 : (-u_xlat18);
        u_xlat4.x = (-u_xlat4.x) + 1.0;
        u_xlat17.x = (u_xlatb17) ? u_xlat4.x : u_xlat24;
        u_xlat5.x = (u_xlatb4.y) ? u_xlat17.x : u_xlat21;
        u_xlat16.x = _GradientSettingsTex_TexelSize.x;
        u_xlat17.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy + u_xlat16.xy;
        u_xlat16_4 = texture(_GradientSettingsTex, u_xlat17.xy);
        u_xlat17.xy = u_xlat16_4.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_4.xz * vec2(65025.0, 65025.0) + u_xlat17.xy;
        u_xlat17.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
        u_xlat3.xy = u_xlat16.xy * vec2(2.0, 2.0) + u_xlat3.xy;
        u_xlat16_2 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlat3.xy = u_xlat16_2.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_2.xz * vec2(65025.0, 65025.0) + u_xlat3.xy;
        u_xlat3.xy = u_xlat7.xy * u_xlat17.xy;
        u_xlat7.xy = u_xlat7.xy * u_xlat16_6.xy;
        u_xlat7.xy = u_xlat5.xz * u_xlat7.xy + u_xlat3.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat7.xy);
        u_xlat2 = u_xlat16_2 * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat16_3 = texture(_CustomTex, u_xlat7.xy);
        u_xlat2 = u_xlat16_3 * vs_TEXCOORD2.yyyy + u_xlat2;
        u_xlat16_2 = u_xlat2;
    } else {
        u_xlat16_2 = u_xlat1;
    }
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.w;
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