extends Camera3D

var offset: Vector3
@onready var target = $"../../Car/MeshInstance3D"

func _ready() -> void:
	offset = Vector3(0, 15, -30)
	fov = 45

func _physics_process(delta):
	var target_pos = target.global_transform.origin + target.global_transform.basis * offset
	global_transform.origin = global_transform.origin.lerp(target_pos, 0.1)
	look_at(target.global_transform.origin + Vector3(0, 0, 1)) # 1m上（頭付近）を見るextends Camera3D
