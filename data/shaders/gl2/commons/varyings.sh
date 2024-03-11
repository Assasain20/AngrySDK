#ifdef NEEDS_VTEXCOORD0
varying	vec2 	V_TexCoord0;
#endif

#ifdef NEEDS_VTEXCOORD1
varying	vec2	V_TexCoord1;
#endif

#ifdef NEEDS_VBLURTEXCOORD
varying	vec2	V_BlurTexCoord[5];
#endif

#ifdef NEEDS_VFOGLEVEL	
varying	float	V_FogLevel;
#endif

#ifdef NEEDS_VTOLIGHT
varying	vec3	V_ToLight;
#endif

#ifdef NEEDS_VNORMAL
varying	vec3	V_Normal;
#endif

#ifdef NEEDS_VTOCAMERA
varying	vec3	V_ToCamera;
#endif

#ifdef NEEDS_VPOSITION
varying	vec3	V_Position;
#endif

#ifdef NEEDS_NORMDEVCOORDS
varying vec3 V_Screenpos;
#endif

#ifdef NEEDS_VTANGENTTM
varying	mat3	V_TangentTM;
#endif

#ifdef NEEDS_VVERTEXCOLOR
varying	vec4	V_VertexColor;
#endif