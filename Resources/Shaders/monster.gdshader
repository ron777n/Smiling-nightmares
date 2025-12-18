shader_type spatial;

varying float d;
varying vec2 uv;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	uv = (fract(2.0 * LIGHT_VERTEX.xyz) - 0.5).xy;
	d = abs(sin(length(uv)*8.0 + TIME)/8.0);

	d = 0.1 / d;

	ALBEDO = vec3(d, 0., 0.);
	ALPHA = abs(cos(TIME)) + 0.3;

}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
