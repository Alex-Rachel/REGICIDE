//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/VideoDecodeAndroid" {
Properties {
}
SubShader {
 Pass {
  Name "RGBAExternal_To_RGBA"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 37716
Program "vp" {
SubProgram "gles3 " {
"#version 100
#extension GL_OES_EGL_image_external : require
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 54

#line 12
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 4

    #line 1
#ifndef UNITY_CG_INCLUDED
#define UNITY_CG_INCLUDED

// -------------------------------------------------------------------
// Common functions

float saturate(float x)
{
    return max(0.0, min(1.0, x));
}


// -------------------------------------------------------------------
//  builtin values exposed from Unity

// Time values from Unity
uniform vec4 _Time;
uniform vec4 _SinTime;
uniform vec4 _CosTime;

// x = 1 or -1 (-1 if projection is flipped)
// y = near plane
// z = far plane
// w = 1/far plane
uniform vec4 _ProjectionParams;

// x = width
// y = height
// z = 1 + 1.0/width
// w = 1 + 1.0/height
uniform vec4 _ScreenParams;

uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform vec4 _LightPositionRange; // xyz = pos, w = 1/range

// -------------------------------------------------------------------
//  helper functions and macros used in many standard shaders

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE
#define USING_DIRECTIONAL_LIGHT
#endif

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE || defined POINT || defined SPOT || defined POINT_NOATT || defined POINT_COOKIE
#define USING_LIGHT_MULTI_COMPILE
#endif


// VERTEX



// Calculates UV offset for parallax bump mapping
vec2 ParallaxOffset( float h, float height, vec3 viewDir )
{
    h = h * height - height/2.0;
    vec3 v = normalize(viewDir);
    v.z += 0.42;
    return h * (v.xy / v.z);
}


// Converts color to luminance (grayscale)
float Luminance( vec3 c )
{
    return dot( c, vec3(0.22, 0.707, 0.071) );
}


#endif

#line 5

#line 12
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */

            
            // #pragma glsl_es2
            // #pragma multi_compile_local _ ADJUST_TO_LINEARSPACE

            uniform vec4 _MainTex_ST;

            
            
            

#ifdef VERTEX
#define gl_Vertex _glesVertex
attribute vec4 _glesVertex;
#define gl_Normal _glesNormal
attribute vec3 _glesNormal;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
attribute vec4 _glesMultiTexCoord0;
#define gl_TexCoord _glesTexCoord
varying highp vec4 _glesTexCoord[1];


// Computes world space light direction
vec3 WorldSpaceLightDir( vec4 v )
{
    vec3 worldPos = (unity_ObjectToWorld * v).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return _WorldSpaceLightPos0.xyz - worldPos * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return _WorldSpaceLightPos0.xyz - worldPos;
        #else
        return _WorldSpaceLightPos0.xyz;
        #endif
    #endif
}

// Computes object space light direction
vec3 ObjSpaceLightDir( vec4 v )
{
    vec3 objSpaceLightPos = (unity_WorldToObject * _WorldSpaceLightPos0).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return objSpaceLightPos.xyz - v.xyz * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return objSpaceLightPos.xyz - v.xyz;
        #else
        return objSpaceLightPos.xyz;
        #endif
    #endif
}

// Computes world space view direction
vec3 WorldSpaceViewDir( vec4 v )
{
    return _WorldSpaceCameraPos.xyz - (unity_ObjectToWorld * v).xyz;
}

// Computes object space view direction
vec3 ObjSpaceViewDir( vec4 v )
{
    vec3 objSpaceCameraPos = (unity_WorldToObject * vec4(_WorldSpaceCameraPos.xyz, 1.0)).xyz;
    return objSpaceCameraPos - v.xyz;
}

// Declares 3x3 matrix 'rotation', filled with tangent space basis
// Do not use multiline define here, nVidia OpenGL drivers are buggy in parsing that.
#define TANGENT_SPACE_ROTATION vec3 binormal = cross( gl_Normal.xyz, Tangent.xyz ) * Tangent.w; mat3 rotation = mat3( Tangent.x, binormal.x, gl_Normal.x, Tangent.y, binormal.y, gl_Normal.y, Tangent.z, binormal.z, gl_Normal.z );


// Transforms float2 UV by scale/bias property (new method)
// GLSL ES does not support ## concat operator so we also provide macro that expects xxx_ST
#define TRANSFORM_TEX_ST(tex,namest) (tex.xy * namest.xy + namest.zw)
#ifndef GL_ES
    #define TRANSFORM_TEX(tex,name) TRANSFORM_TEX_ST(tex, name##_ST)
#endif

// Deprecated. Used to transform 4D UV by a fixed function texture matrix. Now just returns the passed UV.
#define TRANSFORM_UV(idx) (gl_TexCoord[0].xy)



            varying vec2 textureCoord;
            void main()
            {
                gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                textureCoord = TRANSFORM_TEX_ST(gl_MultiTexCoord0, _MainTex_ST);
            }

            
#endif
#ifdef FRAGMENT
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
precision highp int;


            vec4 AdjustForColorSpace(vec4 color)
            {
            #if defined(UNITY_COLORSPACE_GAMMA) || !defined(ADJUST_TO_LINEARSPACE)
                return color;
            #else
                // Approximate version from http://chilliant.blogspot.com.au/2012/08/srgb-approximations-for-hlsl.html?m=1
                vec3 sRGB = color.rgb;
                return vec4(sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878), color.a);
            #endif
            }

            varying vec2 textureCoord;
            uniform samplerExternalOES _MainTex;
            void main()
            {
                gl_FragColor = AdjustForColorSpace(texture2D(_MainTex, textureCoord));
            }

            
#endif"
}
SubProgram "gles3 " {
"#version 100
#extension GL_OES_EGL_image_external : require
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 53

#line 12
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 4

    #line 1
#ifndef UNITY_CG_INCLUDED
#define UNITY_CG_INCLUDED

// -------------------------------------------------------------------
// Common functions

float saturate(float x)
{
    return max(0.0, min(1.0, x));
}


// -------------------------------------------------------------------
//  builtin values exposed from Unity

// Time values from Unity
uniform vec4 _Time;
uniform vec4 _SinTime;
uniform vec4 _CosTime;

// x = 1 or -1 (-1 if projection is flipped)
// y = near plane
// z = far plane
// w = 1/far plane
uniform vec4 _ProjectionParams;

// x = width
// y = height
// z = 1 + 1.0/width
// w = 1 + 1.0/height
uniform vec4 _ScreenParams;

uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform vec4 _LightPositionRange; // xyz = pos, w = 1/range

// -------------------------------------------------------------------
//  helper functions and macros used in many standard shaders

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE
#define USING_DIRECTIONAL_LIGHT
#endif

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE || defined POINT || defined SPOT || defined POINT_NOATT || defined POINT_COOKIE
#define USING_LIGHT_MULTI_COMPILE
#endif


// VERTEX



// Calculates UV offset for parallax bump mapping
vec2 ParallaxOffset( float h, float height, vec3 viewDir )
{
    h = h * height - height/2.0;
    vec3 v = normalize(viewDir);
    v.z += 0.42;
    return h * (v.xy / v.z);
}


// Converts color to luminance (grayscale)
float Luminance( vec3 c )
{
    return dot( c, vec3(0.22, 0.707, 0.071) );
}


#endif

#line 5

#line 12
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */

            
            // #pragma glsl_es2
            // #pragma multi_compile_local _ ADJUST_TO_LINEARSPACE

            uniform vec4 _MainTex_ST;

            
            
            

#ifdef VERTEX
#define gl_Vertex _glesVertex
attribute vec4 _glesVertex;
#define gl_Normal _glesNormal
attribute vec3 _glesNormal;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
attribute vec4 _glesMultiTexCoord0;
#define gl_TexCoord _glesTexCoord
varying highp vec4 _glesTexCoord[1];


// Computes world space light direction
vec3 WorldSpaceLightDir( vec4 v )
{
    vec3 worldPos = (unity_ObjectToWorld * v).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return _WorldSpaceLightPos0.xyz - worldPos * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return _WorldSpaceLightPos0.xyz - worldPos;
        #else
        return _WorldSpaceLightPos0.xyz;
        #endif
    #endif
}

// Computes object space light direction
vec3 ObjSpaceLightDir( vec4 v )
{
    vec3 objSpaceLightPos = (unity_WorldToObject * _WorldSpaceLightPos0).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return objSpaceLightPos.xyz - v.xyz * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return objSpaceLightPos.xyz - v.xyz;
        #else
        return objSpaceLightPos.xyz;
        #endif
    #endif
}

// Computes world space view direction
vec3 WorldSpaceViewDir( vec4 v )
{
    return _WorldSpaceCameraPos.xyz - (unity_ObjectToWorld * v).xyz;
}

// Computes object space view direction
vec3 ObjSpaceViewDir( vec4 v )
{
    vec3 objSpaceCameraPos = (unity_WorldToObject * vec4(_WorldSpaceCameraPos.xyz, 1.0)).xyz;
    return objSpaceCameraPos - v.xyz;
}

// Declares 3x3 matrix 'rotation', filled with tangent space basis
// Do not use multiline define here, nVidia OpenGL drivers are buggy in parsing that.
#define TANGENT_SPACE_ROTATION vec3 binormal = cross( gl_Normal.xyz, Tangent.xyz ) * Tangent.w; mat3 rotation = mat3( Tangent.x, binormal.x, gl_Normal.x, Tangent.y, binormal.y, gl_Normal.y, Tangent.z, binormal.z, gl_Normal.z );


// Transforms float2 UV by scale/bias property (new method)
// GLSL ES does not support ## concat operator so we also provide macro that expects xxx_ST
#define TRANSFORM_TEX_ST(tex,namest) (tex.xy * namest.xy + namest.zw)
#ifndef GL_ES
    #define TRANSFORM_TEX(tex,name) TRANSFORM_TEX_ST(tex, name##_ST)
#endif

// Deprecated. Used to transform 4D UV by a fixed function texture matrix. Now just returns the passed UV.
#define TRANSFORM_UV(idx) (gl_TexCoord[0].xy)



            varying vec2 textureCoord;
            void main()
            {
                gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                textureCoord = TRANSFORM_TEX_ST(gl_MultiTexCoord0, _MainTex_ST);
            }

            
#endif
#ifdef FRAGMENT
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
precision highp int;


            vec4 AdjustForColorSpace(vec4 color)
            {
            #if defined(UNITY_COLORSPACE_GAMMA) || !defined(ADJUST_TO_LINEARSPACE)
                return color;
            #else
                // Approximate version from http://chilliant.blogspot.com.au/2012/08/srgb-approximations-for-hlsl.html?m=1
                vec3 sRGB = color.rgb;
                return vec4(sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878), color.a);
            #endif
            }

            varying vec2 textureCoord;
            uniform samplerExternalOES _MainTex;
            void main()
            {
                gl_FragColor = AdjustForColorSpace(texture2D(_MainTex, textureCoord));
            }

            
#endif"
}
SubProgram "gles3 " {
"#version 100
#extension GL_OES_EGL_image_external : require
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 53

#line 12
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 4

    #line 1
#ifndef UNITY_CG_INCLUDED
#define UNITY_CG_INCLUDED

// -------------------------------------------------------------------
// Common functions

float saturate(float x)
{
    return max(0.0, min(1.0, x));
}


// -------------------------------------------------------------------
//  builtin values exposed from Unity

// Time values from Unity
uniform vec4 _Time;
uniform vec4 _SinTime;
uniform vec4 _CosTime;

// x = 1 or -1 (-1 if projection is flipped)
// y = near plane
// z = far plane
// w = 1/far plane
uniform vec4 _ProjectionParams;

// x = width
// y = height
// z = 1 + 1.0/width
// w = 1 + 1.0/height
uniform vec4 _ScreenParams;

uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform vec4 _LightPositionRange; // xyz = pos, w = 1/range

// -------------------------------------------------------------------
//  helper functions and macros used in many standard shaders

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE
#define USING_DIRECTIONAL_LIGHT
#endif

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE || defined POINT || defined SPOT || defined POINT_NOATT || defined POINT_COOKIE
#define USING_LIGHT_MULTI_COMPILE
#endif


// VERTEX



// Calculates UV offset for parallax bump mapping
vec2 ParallaxOffset( float h, float height, vec3 viewDir )
{
    h = h * height - height/2.0;
    vec3 v = normalize(viewDir);
    v.z += 0.42;
    return h * (v.xy / v.z);
}


// Converts color to luminance (grayscale)
float Luminance( vec3 c )
{
    return dot( c, vec3(0.22, 0.707, 0.071) );
}


#endif

#line 5

#line 12
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */

            
            // #pragma glsl_es2
            // #pragma multi_compile_local _ ADJUST_TO_LINEARSPACE

            uniform vec4 _MainTex_ST;

            
            
            

#ifdef VERTEX
#define gl_Vertex _glesVertex
attribute vec4 _glesVertex;
#define gl_Normal _glesNormal
attribute vec3 _glesNormal;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
attribute vec4 _glesMultiTexCoord0;
#define gl_TexCoord _glesTexCoord
varying highp vec4 _glesTexCoord[1];


// Computes world space light direction
vec3 WorldSpaceLightDir( vec4 v )
{
    vec3 worldPos = (unity_ObjectToWorld * v).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return _WorldSpaceLightPos0.xyz - worldPos * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return _WorldSpaceLightPos0.xyz - worldPos;
        #else
        return _WorldSpaceLightPos0.xyz;
        #endif
    #endif
}

// Computes object space light direction
vec3 ObjSpaceLightDir( vec4 v )
{
    vec3 objSpaceLightPos = (unity_WorldToObject * _WorldSpaceLightPos0).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return objSpaceLightPos.xyz - v.xyz * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return objSpaceLightPos.xyz - v.xyz;
        #else
        return objSpaceLightPos.xyz;
        #endif
    #endif
}

// Computes world space view direction
vec3 WorldSpaceViewDir( vec4 v )
{
    return _WorldSpaceCameraPos.xyz - (unity_ObjectToWorld * v).xyz;
}

// Computes object space view direction
vec3 ObjSpaceViewDir( vec4 v )
{
    vec3 objSpaceCameraPos = (unity_WorldToObject * vec4(_WorldSpaceCameraPos.xyz, 1.0)).xyz;
    return objSpaceCameraPos - v.xyz;
}

// Declares 3x3 matrix 'rotation', filled with tangent space basis
// Do not use multiline define here, nVidia OpenGL drivers are buggy in parsing that.
#define TANGENT_SPACE_ROTATION vec3 binormal = cross( gl_Normal.xyz, Tangent.xyz ) * Tangent.w; mat3 rotation = mat3( Tangent.x, binormal.x, gl_Normal.x, Tangent.y, binormal.y, gl_Normal.y, Tangent.z, binormal.z, gl_Normal.z );


// Transforms float2 UV by scale/bias property (new method)
// GLSL ES does not support ## concat operator so we also provide macro that expects xxx_ST
#define TRANSFORM_TEX_ST(tex,namest) (tex.xy * namest.xy + namest.zw)
#ifndef GL_ES
    #define TRANSFORM_TEX(tex,name) TRANSFORM_TEX_ST(tex, name##_ST)
#endif

// Deprecated. Used to transform 4D UV by a fixed function texture matrix. Now just returns the passed UV.
#define TRANSFORM_UV(idx) (gl_TexCoord[0].xy)



            varying vec2 textureCoord;
            void main()
            {
                gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                textureCoord = TRANSFORM_TEX_ST(gl_MultiTexCoord0, _MainTex_ST);
            }

            
#endif
#ifdef FRAGMENT
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
precision highp int;


            vec4 AdjustForColorSpace(vec4 color)
            {
            #if defined(UNITY_COLORSPACE_GAMMA) || !defined(ADJUST_TO_LINEARSPACE)
                return color;
            #else
                // Approximate version from http://chilliant.blogspot.com.au/2012/08/srgb-approximations-for-hlsl.html?m=1
                vec3 sRGB = color.rgb;
                return vec4(sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878), color.a);
            #endif
            }

            varying vec2 textureCoord;
            uniform samplerExternalOES _MainTex;
            void main()
            {
                gl_FragColor = AdjustForColorSpace(texture2D(_MainTex, textureCoord));
            }

            
#endif"
}
SubProgram "gles3 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"#version 100
#extension GL_OES_EGL_image_external : require
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define ADJUST_TO_LINEARSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 12
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 4

    #line 1
#ifndef UNITY_CG_INCLUDED
#define UNITY_CG_INCLUDED

// -------------------------------------------------------------------
// Common functions

float saturate(float x)
{
    return max(0.0, min(1.0, x));
}


// -------------------------------------------------------------------
//  builtin values exposed from Unity

// Time values from Unity
uniform vec4 _Time;
uniform vec4 _SinTime;
uniform vec4 _CosTime;

// x = 1 or -1 (-1 if projection is flipped)
// y = near plane
// z = far plane
// w = 1/far plane
uniform vec4 _ProjectionParams;

// x = width
// y = height
// z = 1 + 1.0/width
// w = 1 + 1.0/height
uniform vec4 _ScreenParams;

uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform vec4 _LightPositionRange; // xyz = pos, w = 1/range

// -------------------------------------------------------------------
//  helper functions and macros used in many standard shaders

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE
#define USING_DIRECTIONAL_LIGHT
#endif

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE || defined POINT || defined SPOT || defined POINT_NOATT || defined POINT_COOKIE
#define USING_LIGHT_MULTI_COMPILE
#endif


// VERTEX



// Calculates UV offset for parallax bump mapping
vec2 ParallaxOffset( float h, float height, vec3 viewDir )
{
    h = h * height - height/2.0;
    vec3 v = normalize(viewDir);
    v.z += 0.42;
    return h * (v.xy / v.z);
}


// Converts color to luminance (grayscale)
float Luminance( vec3 c )
{
    return dot( c, vec3(0.22, 0.707, 0.071) );
}


#endif

#line 5

#line 12
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */

            
            // #pragma glsl_es2
            // #pragma multi_compile_local _ ADJUST_TO_LINEARSPACE

            uniform vec4 _MainTex_ST;

            
            
            

#ifdef VERTEX
#define gl_Vertex _glesVertex
attribute vec4 _glesVertex;
#define gl_Normal _glesNormal
attribute vec3 _glesNormal;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
attribute vec4 _glesMultiTexCoord0;
#define gl_TexCoord _glesTexCoord
varying highp vec4 _glesTexCoord[1];


// Computes world space light direction
vec3 WorldSpaceLightDir( vec4 v )
{
    vec3 worldPos = (unity_ObjectToWorld * v).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return _WorldSpaceLightPos0.xyz - worldPos * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return _WorldSpaceLightPos0.xyz - worldPos;
        #else
        return _WorldSpaceLightPos0.xyz;
        #endif
    #endif
}

// Computes object space light direction
vec3 ObjSpaceLightDir( vec4 v )
{
    vec3 objSpaceLightPos = (unity_WorldToObject * _WorldSpaceLightPos0).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return objSpaceLightPos.xyz - v.xyz * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return objSpaceLightPos.xyz - v.xyz;
        #else
        return objSpaceLightPos.xyz;
        #endif
    #endif
}

// Computes world space view direction
vec3 WorldSpaceViewDir( vec4 v )
{
    return _WorldSpaceCameraPos.xyz - (unity_ObjectToWorld * v).xyz;
}

// Computes object space view direction
vec3 ObjSpaceViewDir( vec4 v )
{
    vec3 objSpaceCameraPos = (unity_WorldToObject * vec4(_WorldSpaceCameraPos.xyz, 1.0)).xyz;
    return objSpaceCameraPos - v.xyz;
}

// Declares 3x3 matrix 'rotation', filled with tangent space basis
// Do not use multiline define here, nVidia OpenGL drivers are buggy in parsing that.
#define TANGENT_SPACE_ROTATION vec3 binormal = cross( gl_Normal.xyz, Tangent.xyz ) * Tangent.w; mat3 rotation = mat3( Tangent.x, binormal.x, gl_Normal.x, Tangent.y, binormal.y, gl_Normal.y, Tangent.z, binormal.z, gl_Normal.z );


// Transforms float2 UV by scale/bias property (new method)
// GLSL ES does not support ## concat operator so we also provide macro that expects xxx_ST
#define TRANSFORM_TEX_ST(tex,namest) (tex.xy * namest.xy + namest.zw)
#ifndef GL_ES
    #define TRANSFORM_TEX(tex,name) TRANSFORM_TEX_ST(tex, name##_ST)
#endif

// Deprecated. Used to transform 4D UV by a fixed function texture matrix. Now just returns the passed UV.
#define TRANSFORM_UV(idx) (gl_TexCoord[0].xy)



            varying vec2 textureCoord;
            void main()
            {
                gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                textureCoord = TRANSFORM_TEX_ST(gl_MultiTexCoord0, _MainTex_ST);
            }

            
#endif
#ifdef FRAGMENT
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
precision highp int;


            vec4 AdjustForColorSpace(vec4 color)
            {
            #if defined(UNITY_COLORSPACE_GAMMA) || !defined(ADJUST_TO_LINEARSPACE)
                return color;
            #else
                // Approximate version from http://chilliant.blogspot.com.au/2012/08/srgb-approximations-for-hlsl.html?m=1
                vec3 sRGB = color.rgb;
                return vec4(sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878), color.a);
            #endif
            }

            varying vec2 textureCoord;
            uniform samplerExternalOES _MainTex;
            void main()
            {
                gl_FragColor = AdjustForColorSpace(texture2D(_MainTex, textureCoord));
            }

            
#endif"
}
SubProgram "gles3 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"#version 100
#extension GL_OES_EGL_image_external : require
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define ADJUST_TO_LINEARSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 54

#line 12
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 4

    #line 1
#ifndef UNITY_CG_INCLUDED
#define UNITY_CG_INCLUDED

// -------------------------------------------------------------------
// Common functions

float saturate(float x)
{
    return max(0.0, min(1.0, x));
}


// -------------------------------------------------------------------
//  builtin values exposed from Unity

// Time values from Unity
uniform vec4 _Time;
uniform vec4 _SinTime;
uniform vec4 _CosTime;

// x = 1 or -1 (-1 if projection is flipped)
// y = near plane
// z = far plane
// w = 1/far plane
uniform vec4 _ProjectionParams;

// x = width
// y = height
// z = 1 + 1.0/width
// w = 1 + 1.0/height
uniform vec4 _ScreenParams;

uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform vec4 _LightPositionRange; // xyz = pos, w = 1/range

// -------------------------------------------------------------------
//  helper functions and macros used in many standard shaders

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE
#define USING_DIRECTIONAL_LIGHT
#endif

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE || defined POINT || defined SPOT || defined POINT_NOATT || defined POINT_COOKIE
#define USING_LIGHT_MULTI_COMPILE
#endif


// VERTEX



// Calculates UV offset for parallax bump mapping
vec2 ParallaxOffset( float h, float height, vec3 viewDir )
{
    h = h * height - height/2.0;
    vec3 v = normalize(viewDir);
    v.z += 0.42;
    return h * (v.xy / v.z);
}


// Converts color to luminance (grayscale)
float Luminance( vec3 c )
{
    return dot( c, vec3(0.22, 0.707, 0.071) );
}


#endif

#line 5

#line 12
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */

            
            // #pragma glsl_es2
            // #pragma multi_compile_local _ ADJUST_TO_LINEARSPACE

            uniform vec4 _MainTex_ST;

            
            
            

#ifdef VERTEX
#define gl_Vertex _glesVertex
attribute vec4 _glesVertex;
#define gl_Normal _glesNormal
attribute vec3 _glesNormal;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
attribute vec4 _glesMultiTexCoord0;
#define gl_TexCoord _glesTexCoord
varying highp vec4 _glesTexCoord[1];


// Computes world space light direction
vec3 WorldSpaceLightDir( vec4 v )
{
    vec3 worldPos = (unity_ObjectToWorld * v).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return _WorldSpaceLightPos0.xyz - worldPos * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return _WorldSpaceLightPos0.xyz - worldPos;
        #else
        return _WorldSpaceLightPos0.xyz;
        #endif
    #endif
}

// Computes object space light direction
vec3 ObjSpaceLightDir( vec4 v )
{
    vec3 objSpaceLightPos = (unity_WorldToObject * _WorldSpaceLightPos0).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return objSpaceLightPos.xyz - v.xyz * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return objSpaceLightPos.xyz - v.xyz;
        #else
        return objSpaceLightPos.xyz;
        #endif
    #endif
}

// Computes world space view direction
vec3 WorldSpaceViewDir( vec4 v )
{
    return _WorldSpaceCameraPos.xyz - (unity_ObjectToWorld * v).xyz;
}

// Computes object space view direction
vec3 ObjSpaceViewDir( vec4 v )
{
    vec3 objSpaceCameraPos = (unity_WorldToObject * vec4(_WorldSpaceCameraPos.xyz, 1.0)).xyz;
    return objSpaceCameraPos - v.xyz;
}

// Declares 3x3 matrix 'rotation', filled with tangent space basis
// Do not use multiline define here, nVidia OpenGL drivers are buggy in parsing that.
#define TANGENT_SPACE_ROTATION vec3 binormal = cross( gl_Normal.xyz, Tangent.xyz ) * Tangent.w; mat3 rotation = mat3( Tangent.x, binormal.x, gl_Normal.x, Tangent.y, binormal.y, gl_Normal.y, Tangent.z, binormal.z, gl_Normal.z );


// Transforms float2 UV by scale/bias property (new method)
// GLSL ES does not support ## concat operator so we also provide macro that expects xxx_ST
#define TRANSFORM_TEX_ST(tex,namest) (tex.xy * namest.xy + namest.zw)
#ifndef GL_ES
    #define TRANSFORM_TEX(tex,name) TRANSFORM_TEX_ST(tex, name##_ST)
#endif

// Deprecated. Used to transform 4D UV by a fixed function texture matrix. Now just returns the passed UV.
#define TRANSFORM_UV(idx) (gl_TexCoord[0].xy)



            varying vec2 textureCoord;
            void main()
            {
                gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                textureCoord = TRANSFORM_TEX_ST(gl_MultiTexCoord0, _MainTex_ST);
            }

            
#endif
#ifdef FRAGMENT
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
precision highp int;


            vec4 AdjustForColorSpace(vec4 color)
            {
            #if defined(UNITY_COLORSPACE_GAMMA) || !defined(ADJUST_TO_LINEARSPACE)
                return color;
            #else
                // Approximate version from http://chilliant.blogspot.com.au/2012/08/srgb-approximations-for-hlsl.html?m=1
                vec3 sRGB = color.rgb;
                return vec4(sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878), color.a);
            #endif
            }

            varying vec2 textureCoord;
            uniform samplerExternalOES _MainTex;
            void main()
            {
                gl_FragColor = AdjustForColorSpace(texture2D(_MainTex, textureCoord));
            }

            
#endif"
}
SubProgram "gles3 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"#version 100
#extension GL_OES_EGL_image_external : require
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define ADJUST_TO_LINEARSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 54

#line 12
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 4

    #line 1
#ifndef UNITY_CG_INCLUDED
#define UNITY_CG_INCLUDED

// -------------------------------------------------------------------
// Common functions

float saturate(float x)
{
    return max(0.0, min(1.0, x));
}


// -------------------------------------------------------------------
//  builtin values exposed from Unity

// Time values from Unity
uniform vec4 _Time;
uniform vec4 _SinTime;
uniform vec4 _CosTime;

// x = 1 or -1 (-1 if projection is flipped)
// y = near plane
// z = far plane
// w = 1/far plane
uniform vec4 _ProjectionParams;

// x = width
// y = height
// z = 1 + 1.0/width
// w = 1 + 1.0/height
uniform vec4 _ScreenParams;

uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform vec4 _LightPositionRange; // xyz = pos, w = 1/range

// -------------------------------------------------------------------
//  helper functions and macros used in many standard shaders

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE
#define USING_DIRECTIONAL_LIGHT
#endif

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE || defined POINT || defined SPOT || defined POINT_NOATT || defined POINT_COOKIE
#define USING_LIGHT_MULTI_COMPILE
#endif


// VERTEX



// Calculates UV offset for parallax bump mapping
vec2 ParallaxOffset( float h, float height, vec3 viewDir )
{
    h = h * height - height/2.0;
    vec3 v = normalize(viewDir);
    v.z += 0.42;
    return h * (v.xy / v.z);
}


// Converts color to luminance (grayscale)
float Luminance( vec3 c )
{
    return dot( c, vec3(0.22, 0.707, 0.071) );
}


#endif

#line 5

#line 12
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */

            
            // #pragma glsl_es2
            // #pragma multi_compile_local _ ADJUST_TO_LINEARSPACE

            uniform vec4 _MainTex_ST;

            
            
            

#ifdef VERTEX
#define gl_Vertex _glesVertex
attribute vec4 _glesVertex;
#define gl_Normal _glesNormal
attribute vec3 _glesNormal;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
attribute vec4 _glesMultiTexCoord0;
#define gl_TexCoord _glesTexCoord
varying highp vec4 _glesTexCoord[1];


// Computes world space light direction
vec3 WorldSpaceLightDir( vec4 v )
{
    vec3 worldPos = (unity_ObjectToWorld * v).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return _WorldSpaceLightPos0.xyz - worldPos * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return _WorldSpaceLightPos0.xyz - worldPos;
        #else
        return _WorldSpaceLightPos0.xyz;
        #endif
    #endif
}

// Computes object space light direction
vec3 ObjSpaceLightDir( vec4 v )
{
    vec3 objSpaceLightPos = (unity_WorldToObject * _WorldSpaceLightPos0).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return objSpaceLightPos.xyz - v.xyz * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return objSpaceLightPos.xyz - v.xyz;
        #else
        return objSpaceLightPos.xyz;
        #endif
    #endif
}

// Computes world space view direction
vec3 WorldSpaceViewDir( vec4 v )
{
    return _WorldSpaceCameraPos.xyz - (unity_ObjectToWorld * v).xyz;
}

// Computes object space view direction
vec3 ObjSpaceViewDir( vec4 v )
{
    vec3 objSpaceCameraPos = (unity_WorldToObject * vec4(_WorldSpaceCameraPos.xyz, 1.0)).xyz;
    return objSpaceCameraPos - v.xyz;
}

// Declares 3x3 matrix 'rotation', filled with tangent space basis
// Do not use multiline define here, nVidia OpenGL drivers are buggy in parsing that.
#define TANGENT_SPACE_ROTATION vec3 binormal = cross( gl_Normal.xyz, Tangent.xyz ) * Tangent.w; mat3 rotation = mat3( Tangent.x, binormal.x, gl_Normal.x, Tangent.y, binormal.y, gl_Normal.y, Tangent.z, binormal.z, gl_Normal.z );


// Transforms float2 UV by scale/bias property (new method)
// GLSL ES does not support ## concat operator so we also provide macro that expects xxx_ST
#define TRANSFORM_TEX_ST(tex,namest) (tex.xy * namest.xy + namest.zw)
#ifndef GL_ES
    #define TRANSFORM_TEX(tex,name) TRANSFORM_TEX_ST(tex, name##_ST)
#endif

// Deprecated. Used to transform 4D UV by a fixed function texture matrix. Now just returns the passed UV.
#define TRANSFORM_UV(idx) (gl_TexCoord[0].xy)



            varying vec2 textureCoord;
            void main()
            {
                gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                textureCoord = TRANSFORM_TEX_ST(gl_MultiTexCoord0, _MainTex_ST);
            }

            
#endif
#ifdef FRAGMENT
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
precision highp int;


            vec4 AdjustForColorSpace(vec4 color)
            {
            #if defined(UNITY_COLORSPACE_GAMMA) || !defined(ADJUST_TO_LINEARSPACE)
                return color;
            #else
                // Approximate version from http://chilliant.blogspot.com.au/2012/08/srgb-approximations-for-hlsl.html?m=1
                vec3 sRGB = color.rgb;
                return vec4(sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878), color.a);
            #endif
            }

            varying vec2 textureCoord;
            uniform samplerExternalOES _MainTex;
            void main()
            {
                gl_FragColor = AdjustForColorSpace(texture2D(_MainTex, textureCoord));
            }

            
#endif"
}
}
}
 Pass {
  Name "RGBASplitExternal_To_RGBA"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 74759
Program "vp" {
SubProgram "gles3 " {
"#version 100
#extension GL_OES_EGL_image_external : require
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 54

#line 61
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 4

    #line 1
#ifndef UNITY_CG_INCLUDED
#define UNITY_CG_INCLUDED

// -------------------------------------------------------------------
// Common functions

float saturate(float x)
{
    return max(0.0, min(1.0, x));
}


// -------------------------------------------------------------------
//  builtin values exposed from Unity

// Time values from Unity
uniform vec4 _Time;
uniform vec4 _SinTime;
uniform vec4 _CosTime;

// x = 1 or -1 (-1 if projection is flipped)
// y = near plane
// z = far plane
// w = 1/far plane
uniform vec4 _ProjectionParams;

// x = width
// y = height
// z = 1 + 1.0/width
// w = 1 + 1.0/height
uniform vec4 _ScreenParams;

uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform vec4 _LightPositionRange; // xyz = pos, w = 1/range

// -------------------------------------------------------------------
//  helper functions and macros used in many standard shaders

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE
#define USING_DIRECTIONAL_LIGHT
#endif

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE || defined POINT || defined SPOT || defined POINT_NOATT || defined POINT_COOKIE
#define USING_LIGHT_MULTI_COMPILE
#endif


// VERTEX



// Calculates UV offset for parallax bump mapping
vec2 ParallaxOffset( float h, float height, vec3 viewDir )
{
    h = h * height - height/2.0;
    vec3 v = normalize(viewDir);
    v.z += 0.42;
    return h * (v.xy / v.z);
}


// Converts color to luminance (grayscale)
float Luminance( vec3 c )
{
    return dot( c, vec3(0.22, 0.707, 0.071) );
}


#endif

#line 5

#line 61
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */

            
            // #pragma glsl_es2
            // #pragma multi_compile_local _ ADJUST_TO_LINEARSPACE

            uniform vec4 _MainTex_ST;

            
            
            

#ifdef VERTEX
#define gl_Vertex _glesVertex
attribute vec4 _glesVertex;
#define gl_Normal _glesNormal
attribute vec3 _glesNormal;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
attribute vec4 _glesMultiTexCoord0;
#define gl_TexCoord _glesTexCoord
varying highp vec4 _glesTexCoord[1];


// Computes world space light direction
vec3 WorldSpaceLightDir( vec4 v )
{
    vec3 worldPos = (unity_ObjectToWorld * v).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return _WorldSpaceLightPos0.xyz - worldPos * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return _WorldSpaceLightPos0.xyz - worldPos;
        #else
        return _WorldSpaceLightPos0.xyz;
        #endif
    #endif
}

// Computes object space light direction
vec3 ObjSpaceLightDir( vec4 v )
{
    vec3 objSpaceLightPos = (unity_WorldToObject * _WorldSpaceLightPos0).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return objSpaceLightPos.xyz - v.xyz * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return objSpaceLightPos.xyz - v.xyz;
        #else
        return objSpaceLightPos.xyz;
        #endif
    #endif
}

// Computes world space view direction
vec3 WorldSpaceViewDir( vec4 v )
{
    return _WorldSpaceCameraPos.xyz - (unity_ObjectToWorld * v).xyz;
}

// Computes object space view direction
vec3 ObjSpaceViewDir( vec4 v )
{
    vec3 objSpaceCameraPos = (unity_WorldToObject * vec4(_WorldSpaceCameraPos.xyz, 1.0)).xyz;
    return objSpaceCameraPos - v.xyz;
}

// Declares 3x3 matrix 'rotation', filled with tangent space basis
// Do not use multiline define here, nVidia OpenGL drivers are buggy in parsing that.
#define TANGENT_SPACE_ROTATION vec3 binormal = cross( gl_Normal.xyz, Tangent.xyz ) * Tangent.w; mat3 rotation = mat3( Tangent.x, binormal.x, gl_Normal.x, Tangent.y, binormal.y, gl_Normal.y, Tangent.z, binormal.z, gl_Normal.z );


// Transforms float2 UV by scale/bias property (new method)
// GLSL ES does not support ## concat operator so we also provide macro that expects xxx_ST
#define TRANSFORM_TEX_ST(tex,namest) (tex.xy * namest.xy + namest.zw)
#ifndef GL_ES
    #define TRANSFORM_TEX(tex,name) TRANSFORM_TEX_ST(tex, name##_ST)
#endif

// Deprecated. Used to transform 4D UV by a fixed function texture matrix. Now just returns the passed UV.
#define TRANSFORM_UV(idx) (gl_TexCoord[0].xy)



            varying vec3 textureCoordSplit;
            void main()
            {
                gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                textureCoordSplit.xz = vec2(0.5 * gl_MultiTexCoord0.x * _MainTex_ST.x, gl_MultiTexCoord0.y * _MainTex_ST.y) + _MainTex_ST.zw;
                textureCoordSplit.y = textureCoordSplit.x + 0.5 * _MainTex_ST.x;
            }

            
#endif
#ifdef FRAGMENT
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
precision highp int;


            vec4 AdjustForColorSpace(vec4 color)
            {
            #if defined(UNITY_COLORSPACE_GAMMA) || !defined(ADJUST_TO_LINEARSPACE)
                return color;
            #else
                // Approximate version from http://chilliant.blogspot.com.au/2012/08/srgb-approximations-for-hlsl.html?m=1
                vec3 sRGB = color.rgb;
                return vec4(sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878), color.a);
            #endif
            }

            varying vec3 textureCoordSplit;
            uniform samplerExternalOES _MainTex;
            void main()
            {
                gl_FragColor.rgb = AdjustForColorSpace(texture2D(_MainTex, textureCoordSplit.xz)).rgb;
                gl_FragColor.a   = texture2D(_MainTex, textureCoordSplit.yz).g;
            }

            
#endif"
}
SubProgram "gles3 " {
"#version 100
#extension GL_OES_EGL_image_external : require
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 53

#line 61
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 4

    #line 1
#ifndef UNITY_CG_INCLUDED
#define UNITY_CG_INCLUDED

// -------------------------------------------------------------------
// Common functions

float saturate(float x)
{
    return max(0.0, min(1.0, x));
}


// -------------------------------------------------------------------
//  builtin values exposed from Unity

// Time values from Unity
uniform vec4 _Time;
uniform vec4 _SinTime;
uniform vec4 _CosTime;

// x = 1 or -1 (-1 if projection is flipped)
// y = near plane
// z = far plane
// w = 1/far plane
uniform vec4 _ProjectionParams;

// x = width
// y = height
// z = 1 + 1.0/width
// w = 1 + 1.0/height
uniform vec4 _ScreenParams;

uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform vec4 _LightPositionRange; // xyz = pos, w = 1/range

// -------------------------------------------------------------------
//  helper functions and macros used in many standard shaders

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE
#define USING_DIRECTIONAL_LIGHT
#endif

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE || defined POINT || defined SPOT || defined POINT_NOATT || defined POINT_COOKIE
#define USING_LIGHT_MULTI_COMPILE
#endif


// VERTEX



// Calculates UV offset for parallax bump mapping
vec2 ParallaxOffset( float h, float height, vec3 viewDir )
{
    h = h * height - height/2.0;
    vec3 v = normalize(viewDir);
    v.z += 0.42;
    return h * (v.xy / v.z);
}


// Converts color to luminance (grayscale)
float Luminance( vec3 c )
{
    return dot( c, vec3(0.22, 0.707, 0.071) );
}


#endif

#line 5

#line 61
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */

            
            // #pragma glsl_es2
            // #pragma multi_compile_local _ ADJUST_TO_LINEARSPACE

            uniform vec4 _MainTex_ST;

            
            
            

#ifdef VERTEX
#define gl_Vertex _glesVertex
attribute vec4 _glesVertex;
#define gl_Normal _glesNormal
attribute vec3 _glesNormal;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
attribute vec4 _glesMultiTexCoord0;
#define gl_TexCoord _glesTexCoord
varying highp vec4 _glesTexCoord[1];


// Computes world space light direction
vec3 WorldSpaceLightDir( vec4 v )
{
    vec3 worldPos = (unity_ObjectToWorld * v).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return _WorldSpaceLightPos0.xyz - worldPos * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return _WorldSpaceLightPos0.xyz - worldPos;
        #else
        return _WorldSpaceLightPos0.xyz;
        #endif
    #endif
}

// Computes object space light direction
vec3 ObjSpaceLightDir( vec4 v )
{
    vec3 objSpaceLightPos = (unity_WorldToObject * _WorldSpaceLightPos0).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return objSpaceLightPos.xyz - v.xyz * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return objSpaceLightPos.xyz - v.xyz;
        #else
        return objSpaceLightPos.xyz;
        #endif
    #endif
}

// Computes world space view direction
vec3 WorldSpaceViewDir( vec4 v )
{
    return _WorldSpaceCameraPos.xyz - (unity_ObjectToWorld * v).xyz;
}

// Computes object space view direction
vec3 ObjSpaceViewDir( vec4 v )
{
    vec3 objSpaceCameraPos = (unity_WorldToObject * vec4(_WorldSpaceCameraPos.xyz, 1.0)).xyz;
    return objSpaceCameraPos - v.xyz;
}

// Declares 3x3 matrix 'rotation', filled with tangent space basis
// Do not use multiline define here, nVidia OpenGL drivers are buggy in parsing that.
#define TANGENT_SPACE_ROTATION vec3 binormal = cross( gl_Normal.xyz, Tangent.xyz ) * Tangent.w; mat3 rotation = mat3( Tangent.x, binormal.x, gl_Normal.x, Tangent.y, binormal.y, gl_Normal.y, Tangent.z, binormal.z, gl_Normal.z );


// Transforms float2 UV by scale/bias property (new method)
// GLSL ES does not support ## concat operator so we also provide macro that expects xxx_ST
#define TRANSFORM_TEX_ST(tex,namest) (tex.xy * namest.xy + namest.zw)
#ifndef GL_ES
    #define TRANSFORM_TEX(tex,name) TRANSFORM_TEX_ST(tex, name##_ST)
#endif

// Deprecated. Used to transform 4D UV by a fixed function texture matrix. Now just returns the passed UV.
#define TRANSFORM_UV(idx) (gl_TexCoord[0].xy)



            varying vec3 textureCoordSplit;
            void main()
            {
                gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                textureCoordSplit.xz = vec2(0.5 * gl_MultiTexCoord0.x * _MainTex_ST.x, gl_MultiTexCoord0.y * _MainTex_ST.y) + _MainTex_ST.zw;
                textureCoordSplit.y = textureCoordSplit.x + 0.5 * _MainTex_ST.x;
            }

            
#endif
#ifdef FRAGMENT
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
precision highp int;


            vec4 AdjustForColorSpace(vec4 color)
            {
            #if defined(UNITY_COLORSPACE_GAMMA) || !defined(ADJUST_TO_LINEARSPACE)
                return color;
            #else
                // Approximate version from http://chilliant.blogspot.com.au/2012/08/srgb-approximations-for-hlsl.html?m=1
                vec3 sRGB = color.rgb;
                return vec4(sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878), color.a);
            #endif
            }

            varying vec3 textureCoordSplit;
            uniform samplerExternalOES _MainTex;
            void main()
            {
                gl_FragColor.rgb = AdjustForColorSpace(texture2D(_MainTex, textureCoordSplit.xz)).rgb;
                gl_FragColor.a   = texture2D(_MainTex, textureCoordSplit.yz).g;
            }

            
#endif"
}
SubProgram "gles3 " {
"#version 100
#extension GL_OES_EGL_image_external : require
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 53

#line 61
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 4

    #line 1
#ifndef UNITY_CG_INCLUDED
#define UNITY_CG_INCLUDED

// -------------------------------------------------------------------
// Common functions

float saturate(float x)
{
    return max(0.0, min(1.0, x));
}


// -------------------------------------------------------------------
//  builtin values exposed from Unity

// Time values from Unity
uniform vec4 _Time;
uniform vec4 _SinTime;
uniform vec4 _CosTime;

// x = 1 or -1 (-1 if projection is flipped)
// y = near plane
// z = far plane
// w = 1/far plane
uniform vec4 _ProjectionParams;

// x = width
// y = height
// z = 1 + 1.0/width
// w = 1 + 1.0/height
uniform vec4 _ScreenParams;

uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform vec4 _LightPositionRange; // xyz = pos, w = 1/range

// -------------------------------------------------------------------
//  helper functions and macros used in many standard shaders

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE
#define USING_DIRECTIONAL_LIGHT
#endif

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE || defined POINT || defined SPOT || defined POINT_NOATT || defined POINT_COOKIE
#define USING_LIGHT_MULTI_COMPILE
#endif


// VERTEX



// Calculates UV offset for parallax bump mapping
vec2 ParallaxOffset( float h, float height, vec3 viewDir )
{
    h = h * height - height/2.0;
    vec3 v = normalize(viewDir);
    v.z += 0.42;
    return h * (v.xy / v.z);
}


// Converts color to luminance (grayscale)
float Luminance( vec3 c )
{
    return dot( c, vec3(0.22, 0.707, 0.071) );
}


#endif

#line 5

#line 61
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */

            
            // #pragma glsl_es2
            // #pragma multi_compile_local _ ADJUST_TO_LINEARSPACE

            uniform vec4 _MainTex_ST;

            
            
            

#ifdef VERTEX
#define gl_Vertex _glesVertex
attribute vec4 _glesVertex;
#define gl_Normal _glesNormal
attribute vec3 _glesNormal;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
attribute vec4 _glesMultiTexCoord0;
#define gl_TexCoord _glesTexCoord
varying highp vec4 _glesTexCoord[1];


// Computes world space light direction
vec3 WorldSpaceLightDir( vec4 v )
{
    vec3 worldPos = (unity_ObjectToWorld * v).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return _WorldSpaceLightPos0.xyz - worldPos * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return _WorldSpaceLightPos0.xyz - worldPos;
        #else
        return _WorldSpaceLightPos0.xyz;
        #endif
    #endif
}

// Computes object space light direction
vec3 ObjSpaceLightDir( vec4 v )
{
    vec3 objSpaceLightPos = (unity_WorldToObject * _WorldSpaceLightPos0).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return objSpaceLightPos.xyz - v.xyz * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return objSpaceLightPos.xyz - v.xyz;
        #else
        return objSpaceLightPos.xyz;
        #endif
    #endif
}

// Computes world space view direction
vec3 WorldSpaceViewDir( vec4 v )
{
    return _WorldSpaceCameraPos.xyz - (unity_ObjectToWorld * v).xyz;
}

// Computes object space view direction
vec3 ObjSpaceViewDir( vec4 v )
{
    vec3 objSpaceCameraPos = (unity_WorldToObject * vec4(_WorldSpaceCameraPos.xyz, 1.0)).xyz;
    return objSpaceCameraPos - v.xyz;
}

// Declares 3x3 matrix 'rotation', filled with tangent space basis
// Do not use multiline define here, nVidia OpenGL drivers are buggy in parsing that.
#define TANGENT_SPACE_ROTATION vec3 binormal = cross( gl_Normal.xyz, Tangent.xyz ) * Tangent.w; mat3 rotation = mat3( Tangent.x, binormal.x, gl_Normal.x, Tangent.y, binormal.y, gl_Normal.y, Tangent.z, binormal.z, gl_Normal.z );


// Transforms float2 UV by scale/bias property (new method)
// GLSL ES does not support ## concat operator so we also provide macro that expects xxx_ST
#define TRANSFORM_TEX_ST(tex,namest) (tex.xy * namest.xy + namest.zw)
#ifndef GL_ES
    #define TRANSFORM_TEX(tex,name) TRANSFORM_TEX_ST(tex, name##_ST)
#endif

// Deprecated. Used to transform 4D UV by a fixed function texture matrix. Now just returns the passed UV.
#define TRANSFORM_UV(idx) (gl_TexCoord[0].xy)



            varying vec3 textureCoordSplit;
            void main()
            {
                gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                textureCoordSplit.xz = vec2(0.5 * gl_MultiTexCoord0.x * _MainTex_ST.x, gl_MultiTexCoord0.y * _MainTex_ST.y) + _MainTex_ST.zw;
                textureCoordSplit.y = textureCoordSplit.x + 0.5 * _MainTex_ST.x;
            }

            
#endif
#ifdef FRAGMENT
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
precision highp int;


            vec4 AdjustForColorSpace(vec4 color)
            {
            #if defined(UNITY_COLORSPACE_GAMMA) || !defined(ADJUST_TO_LINEARSPACE)
                return color;
            #else
                // Approximate version from http://chilliant.blogspot.com.au/2012/08/srgb-approximations-for-hlsl.html?m=1
                vec3 sRGB = color.rgb;
                return vec4(sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878), color.a);
            #endif
            }

            varying vec3 textureCoordSplit;
            uniform samplerExternalOES _MainTex;
            void main()
            {
                gl_FragColor.rgb = AdjustForColorSpace(texture2D(_MainTex, textureCoordSplit.xz)).rgb;
                gl_FragColor.a   = texture2D(_MainTex, textureCoordSplit.yz).g;
            }

            
#endif"
}
SubProgram "gles3 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"#version 100
#extension GL_OES_EGL_image_external : require
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define ADJUST_TO_LINEARSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 61
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 4

    #line 1
#ifndef UNITY_CG_INCLUDED
#define UNITY_CG_INCLUDED

// -------------------------------------------------------------------
// Common functions

float saturate(float x)
{
    return max(0.0, min(1.0, x));
}


// -------------------------------------------------------------------
//  builtin values exposed from Unity

// Time values from Unity
uniform vec4 _Time;
uniform vec4 _SinTime;
uniform vec4 _CosTime;

// x = 1 or -1 (-1 if projection is flipped)
// y = near plane
// z = far plane
// w = 1/far plane
uniform vec4 _ProjectionParams;

// x = width
// y = height
// z = 1 + 1.0/width
// w = 1 + 1.0/height
uniform vec4 _ScreenParams;

uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform vec4 _LightPositionRange; // xyz = pos, w = 1/range

// -------------------------------------------------------------------
//  helper functions and macros used in many standard shaders

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE
#define USING_DIRECTIONAL_LIGHT
#endif

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE || defined POINT || defined SPOT || defined POINT_NOATT || defined POINT_COOKIE
#define USING_LIGHT_MULTI_COMPILE
#endif


// VERTEX



// Calculates UV offset for parallax bump mapping
vec2 ParallaxOffset( float h, float height, vec3 viewDir )
{
    h = h * height - height/2.0;
    vec3 v = normalize(viewDir);
    v.z += 0.42;
    return h * (v.xy / v.z);
}


// Converts color to luminance (grayscale)
float Luminance( vec3 c )
{
    return dot( c, vec3(0.22, 0.707, 0.071) );
}


#endif

#line 5

#line 61
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */

            
            // #pragma glsl_es2
            // #pragma multi_compile_local _ ADJUST_TO_LINEARSPACE

            uniform vec4 _MainTex_ST;

            
            
            

#ifdef VERTEX
#define gl_Vertex _glesVertex
attribute vec4 _glesVertex;
#define gl_Normal _glesNormal
attribute vec3 _glesNormal;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
attribute vec4 _glesMultiTexCoord0;
#define gl_TexCoord _glesTexCoord
varying highp vec4 _glesTexCoord[1];


// Computes world space light direction
vec3 WorldSpaceLightDir( vec4 v )
{
    vec3 worldPos = (unity_ObjectToWorld * v).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return _WorldSpaceLightPos0.xyz - worldPos * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return _WorldSpaceLightPos0.xyz - worldPos;
        #else
        return _WorldSpaceLightPos0.xyz;
        #endif
    #endif
}

// Computes object space light direction
vec3 ObjSpaceLightDir( vec4 v )
{
    vec3 objSpaceLightPos = (unity_WorldToObject * _WorldSpaceLightPos0).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return objSpaceLightPos.xyz - v.xyz * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return objSpaceLightPos.xyz - v.xyz;
        #else
        return objSpaceLightPos.xyz;
        #endif
    #endif
}

// Computes world space view direction
vec3 WorldSpaceViewDir( vec4 v )
{
    return _WorldSpaceCameraPos.xyz - (unity_ObjectToWorld * v).xyz;
}

// Computes object space view direction
vec3 ObjSpaceViewDir( vec4 v )
{
    vec3 objSpaceCameraPos = (unity_WorldToObject * vec4(_WorldSpaceCameraPos.xyz, 1.0)).xyz;
    return objSpaceCameraPos - v.xyz;
}

// Declares 3x3 matrix 'rotation', filled with tangent space basis
// Do not use multiline define here, nVidia OpenGL drivers are buggy in parsing that.
#define TANGENT_SPACE_ROTATION vec3 binormal = cross( gl_Normal.xyz, Tangent.xyz ) * Tangent.w; mat3 rotation = mat3( Tangent.x, binormal.x, gl_Normal.x, Tangent.y, binormal.y, gl_Normal.y, Tangent.z, binormal.z, gl_Normal.z );


// Transforms float2 UV by scale/bias property (new method)
// GLSL ES does not support ## concat operator so we also provide macro that expects xxx_ST
#define TRANSFORM_TEX_ST(tex,namest) (tex.xy * namest.xy + namest.zw)
#ifndef GL_ES
    #define TRANSFORM_TEX(tex,name) TRANSFORM_TEX_ST(tex, name##_ST)
#endif

// Deprecated. Used to transform 4D UV by a fixed function texture matrix. Now just returns the passed UV.
#define TRANSFORM_UV(idx) (gl_TexCoord[0].xy)



            varying vec3 textureCoordSplit;
            void main()
            {
                gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                textureCoordSplit.xz = vec2(0.5 * gl_MultiTexCoord0.x * _MainTex_ST.x, gl_MultiTexCoord0.y * _MainTex_ST.y) + _MainTex_ST.zw;
                textureCoordSplit.y = textureCoordSplit.x + 0.5 * _MainTex_ST.x;
            }

            
#endif
#ifdef FRAGMENT
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
precision highp int;


            vec4 AdjustForColorSpace(vec4 color)
            {
            #if defined(UNITY_COLORSPACE_GAMMA) || !defined(ADJUST_TO_LINEARSPACE)
                return color;
            #else
                // Approximate version from http://chilliant.blogspot.com.au/2012/08/srgb-approximations-for-hlsl.html?m=1
                vec3 sRGB = color.rgb;
                return vec4(sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878), color.a);
            #endif
            }

            varying vec3 textureCoordSplit;
            uniform samplerExternalOES _MainTex;
            void main()
            {
                gl_FragColor.rgb = AdjustForColorSpace(texture2D(_MainTex, textureCoordSplit.xz)).rgb;
                gl_FragColor.a   = texture2D(_MainTex, textureCoordSplit.yz).g;
            }

            
#endif"
}
SubProgram "gles3 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"#version 100
#extension GL_OES_EGL_image_external : require
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define ADJUST_TO_LINEARSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 54

#line 61
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 4

    #line 1
#ifndef UNITY_CG_INCLUDED
#define UNITY_CG_INCLUDED

// -------------------------------------------------------------------
// Common functions

float saturate(float x)
{
    return max(0.0, min(1.0, x));
}


// -------------------------------------------------------------------
//  builtin values exposed from Unity

// Time values from Unity
uniform vec4 _Time;
uniform vec4 _SinTime;
uniform vec4 _CosTime;

// x = 1 or -1 (-1 if projection is flipped)
// y = near plane
// z = far plane
// w = 1/far plane
uniform vec4 _ProjectionParams;

// x = width
// y = height
// z = 1 + 1.0/width
// w = 1 + 1.0/height
uniform vec4 _ScreenParams;

uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform vec4 _LightPositionRange; // xyz = pos, w = 1/range

// -------------------------------------------------------------------
//  helper functions and macros used in many standard shaders

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE
#define USING_DIRECTIONAL_LIGHT
#endif

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE || defined POINT || defined SPOT || defined POINT_NOATT || defined POINT_COOKIE
#define USING_LIGHT_MULTI_COMPILE
#endif


// VERTEX



// Calculates UV offset for parallax bump mapping
vec2 ParallaxOffset( float h, float height, vec3 viewDir )
{
    h = h * height - height/2.0;
    vec3 v = normalize(viewDir);
    v.z += 0.42;
    return h * (v.xy / v.z);
}


// Converts color to luminance (grayscale)
float Luminance( vec3 c )
{
    return dot( c, vec3(0.22, 0.707, 0.071) );
}


#endif

#line 5

#line 61
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */

            
            // #pragma glsl_es2
            // #pragma multi_compile_local _ ADJUST_TO_LINEARSPACE

            uniform vec4 _MainTex_ST;

            
            
            

#ifdef VERTEX
#define gl_Vertex _glesVertex
attribute vec4 _glesVertex;
#define gl_Normal _glesNormal
attribute vec3 _glesNormal;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
attribute vec4 _glesMultiTexCoord0;
#define gl_TexCoord _glesTexCoord
varying highp vec4 _glesTexCoord[1];


// Computes world space light direction
vec3 WorldSpaceLightDir( vec4 v )
{
    vec3 worldPos = (unity_ObjectToWorld * v).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return _WorldSpaceLightPos0.xyz - worldPos * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return _WorldSpaceLightPos0.xyz - worldPos;
        #else
        return _WorldSpaceLightPos0.xyz;
        #endif
    #endif
}

// Computes object space light direction
vec3 ObjSpaceLightDir( vec4 v )
{
    vec3 objSpaceLightPos = (unity_WorldToObject * _WorldSpaceLightPos0).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return objSpaceLightPos.xyz - v.xyz * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return objSpaceLightPos.xyz - v.xyz;
        #else
        return objSpaceLightPos.xyz;
        #endif
    #endif
}

// Computes world space view direction
vec3 WorldSpaceViewDir( vec4 v )
{
    return _WorldSpaceCameraPos.xyz - (unity_ObjectToWorld * v).xyz;
}

// Computes object space view direction
vec3 ObjSpaceViewDir( vec4 v )
{
    vec3 objSpaceCameraPos = (unity_WorldToObject * vec4(_WorldSpaceCameraPos.xyz, 1.0)).xyz;
    return objSpaceCameraPos - v.xyz;
}

// Declares 3x3 matrix 'rotation', filled with tangent space basis
// Do not use multiline define here, nVidia OpenGL drivers are buggy in parsing that.
#define TANGENT_SPACE_ROTATION vec3 binormal = cross( gl_Normal.xyz, Tangent.xyz ) * Tangent.w; mat3 rotation = mat3( Tangent.x, binormal.x, gl_Normal.x, Tangent.y, binormal.y, gl_Normal.y, Tangent.z, binormal.z, gl_Normal.z );


// Transforms float2 UV by scale/bias property (new method)
// GLSL ES does not support ## concat operator so we also provide macro that expects xxx_ST
#define TRANSFORM_TEX_ST(tex,namest) (tex.xy * namest.xy + namest.zw)
#ifndef GL_ES
    #define TRANSFORM_TEX(tex,name) TRANSFORM_TEX_ST(tex, name##_ST)
#endif

// Deprecated. Used to transform 4D UV by a fixed function texture matrix. Now just returns the passed UV.
#define TRANSFORM_UV(idx) (gl_TexCoord[0].xy)



            varying vec3 textureCoordSplit;
            void main()
            {
                gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                textureCoordSplit.xz = vec2(0.5 * gl_MultiTexCoord0.x * _MainTex_ST.x, gl_MultiTexCoord0.y * _MainTex_ST.y) + _MainTex_ST.zw;
                textureCoordSplit.y = textureCoordSplit.x + 0.5 * _MainTex_ST.x;
            }

            
#endif
#ifdef FRAGMENT
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
precision highp int;


            vec4 AdjustForColorSpace(vec4 color)
            {
            #if defined(UNITY_COLORSPACE_GAMMA) || !defined(ADJUST_TO_LINEARSPACE)
                return color;
            #else
                // Approximate version from http://chilliant.blogspot.com.au/2012/08/srgb-approximations-for-hlsl.html?m=1
                vec3 sRGB = color.rgb;
                return vec4(sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878), color.a);
            #endif
            }

            varying vec3 textureCoordSplit;
            uniform samplerExternalOES _MainTex;
            void main()
            {
                gl_FragColor.rgb = AdjustForColorSpace(texture2D(_MainTex, textureCoordSplit.xz)).rgb;
                gl_FragColor.a   = texture2D(_MainTex, textureCoordSplit.yz).g;
            }

            
#endif"
}
SubProgram "gles3 " {
Local Keywords { "ADJUST_TO_LINEARSPACE" }
"#version 100
#extension GL_OES_EGL_image_external : require
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define ADJUST_TO_LINEARSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 54

#line 61
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 4

    #line 1
#ifndef UNITY_CG_INCLUDED
#define UNITY_CG_INCLUDED

// -------------------------------------------------------------------
// Common functions

float saturate(float x)
{
    return max(0.0, min(1.0, x));
}


// -------------------------------------------------------------------
//  builtin values exposed from Unity

// Time values from Unity
uniform vec4 _Time;
uniform vec4 _SinTime;
uniform vec4 _CosTime;

// x = 1 or -1 (-1 if projection is flipped)
// y = near plane
// z = far plane
// w = 1/far plane
uniform vec4 _ProjectionParams;

// x = width
// y = height
// z = 1 + 1.0/width
// w = 1 + 1.0/height
uniform vec4 _ScreenParams;

uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform vec4 _LightPositionRange; // xyz = pos, w = 1/range

// -------------------------------------------------------------------
//  helper functions and macros used in many standard shaders

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE
#define USING_DIRECTIONAL_LIGHT
#endif

#if defined DIRECTIONAL || defined DIRECTIONAL_COOKIE || defined POINT || defined SPOT || defined POINT_NOATT || defined POINT_COOKIE
#define USING_LIGHT_MULTI_COMPILE
#endif


// VERTEX



// Calculates UV offset for parallax bump mapping
vec2 ParallaxOffset( float h, float height, vec3 viewDir )
{
    h = h * height - height/2.0;
    vec3 v = normalize(viewDir);
    v.z += 0.42;
    return h * (v.xy / v.z);
}


// Converts color to luminance (grayscale)
float Luminance( vec3 c )
{
    return dot( c, vec3(0.22, 0.707, 0.071) );
}


#endif

#line 5

#line 61
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */

            
            // #pragma glsl_es2
            // #pragma multi_compile_local _ ADJUST_TO_LINEARSPACE

            uniform vec4 _MainTex_ST;

            
            
            

#ifdef VERTEX
#define gl_Vertex _glesVertex
attribute vec4 _glesVertex;
#define gl_Normal _glesNormal
attribute vec3 _glesNormal;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
attribute vec4 _glesMultiTexCoord0;
#define gl_TexCoord _glesTexCoord
varying highp vec4 _glesTexCoord[1];


// Computes world space light direction
vec3 WorldSpaceLightDir( vec4 v )
{
    vec3 worldPos = (unity_ObjectToWorld * v).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return _WorldSpaceLightPos0.xyz - worldPos * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return _WorldSpaceLightPos0.xyz - worldPos;
        #else
        return _WorldSpaceLightPos0.xyz;
        #endif
    #endif
}

// Computes object space light direction
vec3 ObjSpaceLightDir( vec4 v )
{
    vec3 objSpaceLightPos = (unity_WorldToObject * _WorldSpaceLightPos0).xyz;
    #ifndef USING_LIGHT_MULTI_COMPILE
        return objSpaceLightPos.xyz - v.xyz * _WorldSpaceLightPos0.w;
    #else
        #ifndef USING_DIRECTIONAL_LIGHT
        return objSpaceLightPos.xyz - v.xyz;
        #else
        return objSpaceLightPos.xyz;
        #endif
    #endif
}

// Computes world space view direction
vec3 WorldSpaceViewDir( vec4 v )
{
    return _WorldSpaceCameraPos.xyz - (unity_ObjectToWorld * v).xyz;
}

// Computes object space view direction
vec3 ObjSpaceViewDir( vec4 v )
{
    vec3 objSpaceCameraPos = (unity_WorldToObject * vec4(_WorldSpaceCameraPos.xyz, 1.0)).xyz;
    return objSpaceCameraPos - v.xyz;
}

// Declares 3x3 matrix 'rotation', filled with tangent space basis
// Do not use multiline define here, nVidia OpenGL drivers are buggy in parsing that.
#define TANGENT_SPACE_ROTATION vec3 binormal = cross( gl_Normal.xyz, Tangent.xyz ) * Tangent.w; mat3 rotation = mat3( Tangent.x, binormal.x, gl_Normal.x, Tangent.y, binormal.y, gl_Normal.y, Tangent.z, binormal.z, gl_Normal.z );


// Transforms float2 UV by scale/bias property (new method)
// GLSL ES does not support ## concat operator so we also provide macro that expects xxx_ST
#define TRANSFORM_TEX_ST(tex,namest) (tex.xy * namest.xy + namest.zw)
#ifndef GL_ES
    #define TRANSFORM_TEX(tex,name) TRANSFORM_TEX_ST(tex, name##_ST)
#endif

// Deprecated. Used to transform 4D UV by a fixed function texture matrix. Now just returns the passed UV.
#define TRANSFORM_UV(idx) (gl_TexCoord[0].xy)



            varying vec3 textureCoordSplit;
            void main()
            {
                gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                textureCoordSplit.xz = vec2(0.5 * gl_MultiTexCoord0.x * _MainTex_ST.x, gl_MultiTexCoord0.y * _MainTex_ST.y) + _MainTex_ST.zw;
                textureCoordSplit.y = textureCoordSplit.x + 0.5 * _MainTex_ST.x;
            }

            
#endif
#ifdef FRAGMENT
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
precision highp int;


            vec4 AdjustForColorSpace(vec4 color)
            {
            #if defined(UNITY_COLORSPACE_GAMMA) || !defined(ADJUST_TO_LINEARSPACE)
                return color;
            #else
                // Approximate version from http://chilliant.blogspot.com.au/2012/08/srgb-approximations-for-hlsl.html?m=1
                vec3 sRGB = color.rgb;
                return vec4(sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878), color.a);
            #endif
            }

            varying vec3 textureCoordSplit;
            uniform samplerExternalOES _MainTex;
            void main()
            {
                gl_FragColor.rgb = AdjustForColorSpace(texture2D(_MainTex, textureCoordSplit.xz)).rgb;
                gl_FragColor.a   = texture2D(_MainTex, textureCoordSplit.yz).g;
            }

            
#endif"
}
}
}
}
}