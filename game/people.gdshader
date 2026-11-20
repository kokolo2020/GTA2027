// Harbor City 0.35: one material for the animated people (Kenney CC0 body and skins).
// The skin texture is tinted by region of Kenney's layout: shirt (bottom-left), trousers
// (bottom-right), shoes (right-middle) and everything else (skin, face, hair).
shader_type spatial;
render_mode cull_back, specular_schlick_ggx;

uniform sampler2D skin_tex : source_color, filter_linear_mipmap;
uniform vec3 c_skin = vec3(1.0);
uniform vec3 c_shirt = vec3(1.0);
uniform vec3 c_pants = vec3(1.0);
uniform vec3 c_shoes = vec3(1.0);

void fragment() {
	vec3 t = texture(skin_tex, UV).rgb;
	vec3 tint = c_skin;
	if (UV.x < 0.6 && UV.y > 0.47) {
		tint = c_shirt;
	} else if (UV.x > 0.6 && UV.y > 0.72) {
		tint = c_pants;
	} else if (UV.x > 0.6 && UV.x < 0.82 && UV.y > 0.1 && UV.y < 0.47) {
		tint = c_shoes;
	}
	ALBEDO = t * tint;
	ROUGHNESS = 0.82;
}
