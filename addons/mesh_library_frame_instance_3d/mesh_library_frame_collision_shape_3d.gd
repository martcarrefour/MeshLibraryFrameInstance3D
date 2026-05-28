@tool
extends CollisionShape3D
class_name MeshLibraryFrameCollisionShape3D

## MeshLibraryFrameCollisionObject3D is a custom class designed to instantiate collision shapes from a 
## MeshLibrary resource.

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

## Sets the MeshLibrary resource and initializes the first frame.
## 
## If the provided MeshLibrary is null, the mesh count is reset to 0, and the collision shape is cleared.
## Otherwise, it retrieves the list of collision shapes from the MeshLibrary and sets the first item as the current shape.
##
## @param frames The MeshLibrary resource to be set.
func _set_mesh_library(frames: MeshLibrary) -> void:
	mesh_library = frames
	current_frame = 0
	if frames == null:
		mesh_size = 0
		self.shape = null
	else:
		mesh_size = frames.get_item_count()
		var shapes: Array = frames.get_item_shapes(0)
		if shapes.size() == 0:
			return
		self.shape = shapes[0]

## Returns the current MeshLibrary resource.
##
## @return The MeshLibrary resource currently in use.
func _get_mesh_library() -> MeshLibrary:
	return mesh_library

## Sets the current frame index and updates the collision shape accordingly.
##
## This function checks if the provided index is within the valid range (i.e., between 0 and mesh_count - 1).
## If the index is valid, it updates the current frame and sets the corresponding shape from the MeshLibrary.
##
## @param frame The index of the frame to use.
func _set_current_frame(frame: int) -> void:
	if frame >= 0 and frame < mesh_size:
		current_frame = frame
		var shapes: Array = mesh_library.get_item_shapes(frame)
		if shapes.size() == 0:
			return
		self.shape = shapes[0]

## Returns the current frame index.
##
## @return The index of the currently active collision frame.
func _get_current_frame() -> int:
	return current_frame

func _validate_property(property: Dictionary):
	if property["name"] == "shape":
		property["usage"] = PROPERTY_USAGE_NONE
