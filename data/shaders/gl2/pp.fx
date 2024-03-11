#define DISABLE_TRANSFORM_EXCEPT_ORIENTATION
#define DISABLE_FOG
#define DISABLE_LIGHTING

technique Default
{
	pass P0
	{
		VertexShader = vertexShaders/diff-tex.vs;
		PixelShader = pixelShaders/pp.ps;
		
		#ifdef ENABLE_TWOSIDED
			EnableCulling = FALSE;
		#endif
		
		#ifdef DISABLE_DEPTH_TEST
			EnableDepthTest = FALSE;
		#endif
		
		#ifdef ENABLE_ADDITIVE
			EnableDepthMask = FALSE;
			EnableBlending = TRUE;
			BlendFuncSrc = ONE;
			BlendFuncDst = ONE;
		#endif
		
		#ifdef ENABLE_MULTIPLICATIVE
			EnableDepthMask = FALSE;
			EnableBlending = TRUE;
			BlendFuncSrc = DST_COLOR;
			BlendFuncDst = ZERO;
		#endif
		
		#ifdef ENABLE_ALPHA_BLENDING
			EnableDepthMask = FALSE;
			EnableBlending = TRUE;
			BlendFuncSrc = SRC_ALPHA;
			BlendFuncDst = ONE_MINUS_SRC_ALPHA;
		#endif
		
		#ifdef ENABLE_PREMULT_ALPHA_BLENDING
			EnableDepthMask = FALSE;
			EnableBlending = TRUE;
			BlendFuncSrc = ONE;
			BlendFuncDst = ONE_MINUS_SRC_ALPHA;
		#endif
	}
}

#ifdef ENABLE_REFLECTED

technique Reflected
{
	pass P0
	{
		VertexShader = vertexShaders/diff-tex.vs;
		PixelShader = pixelShaders/pp.ps;
		
		#ifdef ENABLE_TWOSIDED
			EnableCulling = FALSE;
		#endif
		
		#ifdef DISABLE_DEPTH_TEST
			EnableDepthTest = FALSE;
		#endif
		
		#ifdef ENABLE_ADDITIVE
			EnableDepthMask = FALSE;
			EnableBlending = TRUE;
			BlendFuncSrc = ONE;
			BlendFuncDst = ONE;
		#endif
		
		#ifdef ENABLE_MULTIPLICATIVE
			EnableDepthMask = FALSE;
			EnableBlending = TRUE;
			BlendFuncSrc = DST_COLOR;
			BlendFuncDst = ZERO;
		#endif
		
		#ifdef ENABLE_ALPHA_BLENDING
			EnableDepthMask = FALSE;
			EnableBlending = TRUE;
			BlendFuncSrc = SRC_ALPHA;
			BlendFuncDst = ONE_MINUS_SRC_ALPHA;
		#endif
		
		#ifdef ENABLE_PREMULT_ALPHA_BLENDING
			EnableDepthMask = FALSE;
			EnableBlending = TRUE;
			BlendFuncSrc = ONE;
			BlendFuncDst = ONE_MINUS_SRC_ALPHA;
		#endif
	}
}

#endif
