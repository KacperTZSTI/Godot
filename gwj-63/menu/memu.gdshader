shader_type canvas_item;

const float speed = 0.05;

void fragment() {
	vec2 new_uv = vec2(UV.x + TIME * speed, UV.y);
	COLOR = texture(TEXTURE, new_uv);
}
