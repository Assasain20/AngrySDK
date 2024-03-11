#version 120
#define DISABLE_TRANSFORM_EXCEPT_ORIENTATION
#define DISABLE_FOG
#define DISABLE_LIGHTING
#define NEEDS_VTEXCOORD0
#define NEEDS_NORMDEVCOORDS


technique Default
{
	pass P0
	{
		VertexShader = vertexShaders/diff-tex.vs;
		PixelShader = pixelShaders/pp-shockwave.ps;
		
		
		EnableDepthTest = FALSE;
		
		EnableDepthMask = FALSE;
		EnableBlending = TRUE;
		BlendFuncSrc = ONE;
		BlendFuncDst = ZERO;
	}
}