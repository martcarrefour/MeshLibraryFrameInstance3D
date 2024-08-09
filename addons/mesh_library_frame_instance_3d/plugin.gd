@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("MeshLibraryFrameInstance3D", "MeshInstance3D", preload("mesh_library_frame_instance_3d.gd"), preload("mesh_library_frame_instance_3d.svg"))


func _exit_tree() -> void:
	remove_custom_type("MeshLibraryFrameInstance3D")
