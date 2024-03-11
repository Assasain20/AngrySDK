uniform sampler2D BASEMAP;
uniform sampler2D BASEMAP1;
uniform sampler2D NORMALMAP;
uniform sampler2D SIMAP;
uniform sampler2D REFLMAP;
uniform sampler2D REFRACMAP;
uniform sampler2D DEPTHMAP;
uniform sampler2D SHININESSMAP;
uniform sampler2D GLOSSINESSMAP;

uniform mat4 BONEWORLDTM[10];
uniform mat4 WORLDTM;
uniform mat4 VIEWTM;
uniform mat4 VIEWTMINV;
uniform mat4 VIEWPROJTM;
uniform mat4 TOTALTM;
uniform mat4 PROJTM;

uniform vec4 CAMERAP;
uniform vec4 LIGHTP0;
uniform vec4 LIGHTC0;
uniform vec4 FOG_RANGE;
uniform vec4 TEXEL_OFFSET;
uniform vec4 FOG_COLOR;
uniform vec4 AMBIENTC;
uniform vec4 DIFFUSEC;
uniform vec4 SPECULARC;
uniform vec4 TEX0_OFFSET;

uniform float SHININESS;
uniform float GLOSSINESS;
uniform float ALPHA_FACTOR;

uniform float TIME;

