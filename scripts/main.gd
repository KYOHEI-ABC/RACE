extends Node

var player: Car
var key_pressed_count: int = 0

func _ready() -> void:
	Engine.max_fps = 60
	player = $Car
	
	$Track/MeshInstance3D.position.y = -1
	$Track/MeshInstance3D.rotation_degrees.y = 180

	
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_A):
		player.rotation_degrees += -1
	if Input.is_key_pressed(KEY_D):
		player.rotation_degrees += 1
	
	if Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_D):
		key_pressed_count += 1
	else:
		if key_pressed_count > 60:
			player.power += Vector2.UP.rotated(player.rotation)
		key_pressed_count = 0
