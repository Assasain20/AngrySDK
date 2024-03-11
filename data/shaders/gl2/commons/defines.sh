//////////////////////////////////////////////////////////////////////////////
// For varyings

#if defined(ENABLE_VERTEXCOLOR) || defined(ENABLE_VERTEXCOLOR_MODULATE)
	#define NEEDS_VVERTEXCOLOR
#endif

#if !defined(DISABLE_FOG)
	#define NEEDS_VFOGLEVEL
#endif

#if defined(ENABLE_PLANE_REFLECTION) || defined(ENABLE_PLANE_REFRACTION)
	#define NEEDS_VPOSITION
#endif

#if !defined(BLUR_1D) && (!defined(DISABLE_TEXTURE) || defined(ENABLE_NORMALMAP) || defined(ENABLE_WNORMALMAP))
	#define NEEDS_VTEXCOORD0
#endif

#if defined(ENABLE_LIGHTMAP) || defined(ENABLE_ALPHA_MASK) || defined(ENABLE_TEXCOORD1)
	#define NEEDS_VTEXCOORD1
#endif

#if defined(BLUR_1D)
	#define NEEDS_VBLURTEXCOORD
#endif

#if defined(ENABLE_NORMALMAP) || defined(ENABLE_WNORMALMAP)
	#define HAS_NORMALMAP
#endif

#if defined(ENABLE_PLANE_REFLECTION) || defined(ENABLE_PLANE_REFRACTION) || defined(ENABLE_SPHERE_REFL_MAP)
	#define HAS_OPTICS
#endif

#if !defined(DISABLE_LIGHTING)
	#if !(defined(DISABLE_DIFFUSE) && defined(DISABLE_SPECULAR))
		#define HAS_LIGHTING
	#endif
#endif

#if !defined(HAS_NORMALMAP) && ( defined(HAS_LIGHTING) || defined(HAS_OPTICS) )
	#define NEEDS_VNORMAL
#endif

#if defined(HAS_LIGHTING)
	#define NEEDS_VTOLIGHT
#endif

#if (!defined(DISABLE_LIGHTING) && !defined(DISABLE_SPECULAR)) || defined(ENABLE_SPHERE_REFL_MAP)
	#define NEEDS_VTOCAMERA
#endif

#if defined(ENABLE_NORMALMAP)
	#define NEEDS_VTANGENTTM
#endif

//////////////////////////////////////////////////////////////////////////////
// For vertex shaders


//////////////////////////////////////////////////////////////////////////////
// For pixel shaders

#if !defined(DISABLE_LIGHTING) || defined(ENABLE_PLANE_REFLECTION) || defined(ENABLE_PLANE_REFRACTION) || defined(ENABLE_SPHERE_REFL_MAP)
	#define USES_NORMAL
#endif
