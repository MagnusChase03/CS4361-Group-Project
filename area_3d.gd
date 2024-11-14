extends Area3D

# Called when a body enters the area
func _on_area_3d_body_entered(body: Node3D):
	if body is Node3D:
		# Attempt to get the target position from "LeftTeleportPosition"
		var teleport_marker = get_parent().get_node("TeleportPosition")
		if teleport_marker:
			# Set the global origin to the marker's position
			body.global_transform.origin = teleport_marker.global_transform.origin

# Ensure the 'body_entered' signal is connected
func _ready():
	connect("body_entered", Callable(self, "_on_area_3d_body_entered"))
