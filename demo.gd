extends Node3D
@onready var mesh_library_frame_instance_3d: MeshLibraryFrameInstance3D = $MeshLibraryFrameInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(mesh_library_frame_instance_3d.current_frame)
	print(mesh_library_frame_instance_3d.mesh_size)
	print(mesh_library_frame_instance_3d.mesh_library)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
