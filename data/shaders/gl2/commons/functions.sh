/**
 * 5 sample gaussian blur.
 *
 * @param tex Texture to sample.
 * @param texcoord Coordinates to center texel.
 * @param offset Texel size.
 * @return blurred result.
 */
vec3 gaussianBlur1D(in sampler2D tex, in vec2 texcoord, in vec2 offset)
{
	vec3 color = texture2D(tex, texcoord - offset - offset).rgb * 0.0588235;
	color		   += texture2D(tex, texcoord - offset		   ).rgb * 0.2352941;
	color		   += texture2D(tex, texcoord				   ).rgb * 0.4117647;
	color		   += texture2D(tex, texcoord + offset		   ).rgb * 0.2352941;
	color		   += texture2D(tex, texcoord + offset + offset).rgb * 0.0588235;
	return color;
}

vec3 gaussianBlur2D3x3(in sampler2D tex, in vec2 texcoord, in vec2 offset)
{
	float offX = offset.x;
	float offY = offset.y;

	vec3 color = texture2D(tex, texcoord + vec2(-offX, offY) ).rgb * 0.066666666666666666666666666666667;
	color		   += texture2D(tex, texcoord + vec2(0.0, offY) ).rgb * 0.13333333333333333333333333333333;
	color		   += texture2D(tex, texcoord + vec2(offX, offY) ).rgb *  0.066666666666666666666666666666667;
	color		   += texture2D(tex, texcoord + vec2(-offX, 0.0) ).rgb * 0.13333333333333333333333333333333;
	color		   += texture2D(tex, texcoord ).rgb * 0.2;
	color		   += texture2D(tex, texcoord + vec2(offX, 0.0) ).rgb * 0.13333333333333333333333333333333;
	color		   += texture2D(tex, texcoord + vec2(-offX, -offY)).rgb *  0.066666666666666666666666666666667;
	color		   += texture2D(tex, texcoord + vec2(0.0, -offY) ).rgb * 0.13333333333333333333333333333333;
	color		   += texture2D(tex, texcoord + vec2(+offX, -offY) ).rgb *  0.066666666666666666666666666666667;
	return color;
} 

vec3 transform( in mat4 tm, in vec3 v )
{
	return v * mat3(tm) + vec3(tm[3]);
}

vec3 rotate( in mat3 tm, in vec3 v )
{
	return v * tm;
}

// Packing a [0-1] float value into a 4D vector where each component will be a 8-bits integer
vec4 packFloatToVec4i(in float value)
{
	const vec4 bitSh = vec4(256.0 * 256.0 * 256.0, 256.0 * 256.0, 256.0, 1.0);
	const vec4 bitMsk = vec4(0.0, 1.0 / 256.0, 1.0 / 256.0, 1.0 / 256.0);
	vec4 res = fract(value * bitSh);
	res -= res.xxyz * bitMsk;
	return res;
}

// Unpacking a [0-1] float value from a 4D vector where each component was a 8-bits integer
float unpackFloatFromVec4i(in vec4 value)
{
	const vec4 bitSh = vec4(1.0 / (256.0 * 256.0 * 256.0), 1.0 / (256.0 * 256.0), 1.0 / 256.0, 1.0);
	return(dot(value, bitSh));
}
