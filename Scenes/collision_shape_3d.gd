extends CollisionShape3D


# Called when a body enters the area
func _on_area_3d_body_entered(body: Node3D):
	# Check if the body has a Transform, meaning it can be moved
	body.position = get_parent().get_node("LeftTeleportPosition").position
