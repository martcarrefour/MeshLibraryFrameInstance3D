@tool
extends MeshInstance3D
class_name MeshLibraryFrameInstance3D

## MeshLibraryFrameInstance3D is a custom class designed to manage and display individual mesh frames from a 
## MeshLibrary resource. 
##
## This component allows you to dynamically select and render a specific mesh from the 
## library by specifying an index, making it ideal for applications that need to cycle through or display 
## different 3D models from a collection.
##
## The MeshLibraryFrameInstance3D component simplifies the process of managing multiple meshes within a 
## MeshLibrary, providing an easy interface to select and display any mesh by its index.


## The MeshLibrary resource that contains the collection of mesh frames.
## Setting this property will initialize the first mesh in the library.
@export var mesh_library: MeshLibrary:
	set = _set_mesh_library, get = _get_mesh_library


## The index of the currently displayed mesh frame within the MeshLibrary.
## Changing this property will update the mesh instance to display the corresponding mesh.
@export var current_frame: int:
	set = _set_current_frame, get = _get_current_frame

## The total number of mesh frames available in the current MeshLibrary.
## This is automatically updated when a new MeshLibrary is set.
var mesh_size: int = 0

# Method Descriptions

## Sets the MeshLibrary resource and initializes the first mesh frame.
## 
## If the provided MeshLibrary is null, the mesh count is reset to 0, and the displayed mesh is cleared.
## Otherwise, it retrieves the list of meshes from the MeshLibrary and sets the first item as the current mesh.
##
## @param frames The MeshLibrary resource to be set.
func _set_mesh_library(frames: MeshLibrary) -> void:
	mesh_library = frames
	current_frame = 0
	if frames == null:
		mesh_size = 0
		self.mesh = null
	else:
		mesh_size = frames.get_item_list().size()
		self.mesh = frames.get_item_mesh(0)

## Returns the current MeshLibrary resource.
##
## @return The MeshLibrary resource currently in use.
func _get_mesh_library() -> MeshLibrary:
	return mesh_library

## Sets the current frame index and updates the displayed mesh accordingly.
##
## This function checks if the provided index is within the valid range (i.e., between 0 and mesh_count - 1).
## If the index is valid, it updates the current frame and sets the corresponding mesh from the MeshLibrary.
##
## @param frame The index of the mesh frame to display.
func _set_current_frame(frame: int) -> void:
	if frame >= 0 and frame < mesh_size:
		current_frame = frame
		self.mesh = mesh_library.get_item_mesh(frame)

## Returns the current frame index.
##
## @return The index of the currently displayed mesh frame.
func _get_current_frame() -> int:
	return current_frame
