class_name Car
extends CharacterBody2D

var power: Vector2 = Vector2.ZERO
var model: Node3D

func _ready() -> void:
	model = $MeshInstance3D
	
	var material = model.get_active_material(0).duplicate()
	var random_color = Color.from_hsv(randf(), 1, 1)
	material.albedo_color = random_color
	model.set_surface_override_material(0, material)


func _process(delta: float) -> void:
	position += Vector2.UP.rotated(rotation) * 0.5
	
	position += power
	power *= 0.97
	
	model.position.x = position.x
	model.position.z = position.y
	model.rotation.y = atan2(Vector2.UP.rotated(rotation).x, Vector2.UP.rotated(rotation).y)
