@tool
extends MeshInstance3D

@export var mesh_library: MeshLibrary:
	set = set_mesh_library
@export var current_frame: int:
	set = set_current_frame

var mesh_count: int = 0


func set_mesh_library(frames):
	mesh_library = frames
	current_frame = 0
	if frames == null:
		mesh_count = 0
		self.mesh = null
	else:
		mesh_count = frames.get_item_list().size()
		self.mesh = frames.get_item_mesh(0)


func set_current_frame(frame):
	if frame >= 0 and frame < mesh_count:
		current_frame = frame
		self.mesh = mesh_library.get_item_mesh(frame)
