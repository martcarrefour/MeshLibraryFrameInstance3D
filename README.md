[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/O4O210O29A)
# MeshLibraryFrameInstance3D

`MeshLibraryFrameInstance3D` is a custom Godot class extending `MeshInstance3D`, designed to manage and display individual mesh frames from a `MeshLibrary` resource. This component is ideal for applications that need to dynamically select and render specific meshes from a collection by specifying an index.

## Features

- Dynamically select and display a specific mesh from a `MeshLibrary`.
- Simplifies the process of managing multiple meshes within a `MeshLibrary`.
- Provides an easy interface for cycling through or displaying different 3D models.

## Installation

1. Download or clone the repository containing the `MeshLibraryFrameInstance3D` script.
2. Place the script in your Godot project under the appropriate directory (e.g., `scripts/`).

## Usage

### Properties

- **`mesh_library`** (`MeshLibrary`): The resource that contains the collection of mesh frames. Setting this property will initialize the first mesh in the library.
- **`current_frame`** (`int`): The index of the currently displayed mesh frame within the `MeshLibrary`. Changing this property will update the mesh instance to display the corresponding mesh.
- **`mesh_size`** (`int`): The total number of mesh frames available in the current `MeshLibrary`. This is automatically updated when a new `MeshLibrary` is set.

### Methods

- **`_set_mesh_library(frames: MeshLibrary) -> void`**  
  Sets the `MeshLibrary` resource and initializes the first mesh frame.  
  - If the provided `MeshLibrary` is null, the mesh count is reset to 0, and the displayed mesh is cleared.
  - Otherwise, it retrieves the list of meshes from the `MeshLibrary` and sets the first item as the current mesh.

- **`_get_mesh_library() -> MeshLibrary`**  
  Returns the current `MeshLibrary` resource.

- **`_set_current_frame(frame: int) -> void`**  
  Sets the current frame index and updates the displayed mesh accordingly.  
  - This function checks if the provided index is within the valid range (i.e., between 0 and `mesh_size - 1`). If the index is valid, it updates the current frame and sets the corresponding mesh from the `MeshLibrary`.

- **`_get_current_frame() -> int`**  
  Returns the index of the currently displayed mesh frame.

## Example

Here's a simple example of how you might use `MeshLibraryFrameInstance3D` in your Godot project:

```gdscript
@tool
extends MeshLibraryFrameInstance3D

func _ready():
	var my_mesh_library = preload("res://path_to_your_mesh_library.meshlib")
	mesh_library = my_mesh_library
	current_frame = 0  # Start with the first mesh in the library

	# Cycle through the meshes
	for i in range(mesh_size):
		set_current_frame(i)
		yield(get_tree().create_timer(1.0), "timeout")
