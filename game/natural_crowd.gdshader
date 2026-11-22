shader_type spatial;
render_mode diffuse_lambert, specular_disabled;

uniform vec4 c_shirt : source_color = vec4(0.1,0.3,0.4,1.0);
uniform vec4 c_pants : source_color = vec4(0.18,0.22,0.28,1.0);
uniform vec4 c_skin : source_color = vec4(0.68,0.46,0.32,1.0);
uniform vec4 c_hair : source_color = vec4(0.17,0.11,0.08,1.0);
uniform vec4 c_shoes : source_color = vec4(0.15,0.18,0.2,1.0);
uniform vec4 c_eye : source_color = vec4(0.06,0.04,0.03,1.0);

void fragment() {
	float id = floor(COLOR.r*15.0+0.5);
	vec3 colour = vec3(0.19,0.30,0.34);
	if (id < 0.5) colour = c_shirt.rgb;
	else if (id < 1.5) colour = c_pants.rgb;
	else if (id < 2.5) colour = c_skin.rgb;
	else if (id < 3.5) colour = c_hair.rgb;
	else if (id < 4.5) colour = c_shoes.rgb;
	else if (id < 5.5) colour = c_eye.rgb;
	else if (id < 6.5) colour = vec3(0.70,0.65,0.55);
	else if (id > 7.5 && id < 8.5) {
		colour = vec3(0.045,0.65,0.80);
		EMISSION = vec3(0.02,0.65,0.90)*1.4;
	}
	else if (id > 8.5) colour = c_skin.rgb*vec3(0.8,0.5,0.5);
	ALBEDO = colour;
	ROUGHNESS = 0.85;
}
