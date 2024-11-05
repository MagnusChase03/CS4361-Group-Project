extends CharacterBody3D

@export var movement_speed: float = 6.0
var direction: Vector3

func _ready():
	direction = Vector3(1, 0, 0)

func _physics_process(delta):
	if Input.is_action_just_pressed("up"):
		direction = Vector3(0, 0, -1)
	elif Input.is_action_just_pressed("down"):
		direction = Vector3(0, 0, 1)
	elif Input.is_action_just_pressed("right"):
		direction = Vector3(1, 0, 0)
	elif Input.is_action_just_pressed("left"):
		direction = Vector3(-1, 0, 0)
	
	velocity = direction * movement_speed
	move_and_slide()


func _on_area_3d_body_entered(body: Node3D):
	print(body)
	if body.is_in_group("Enemy"):
		queue_free()
	if body.is_in_group("Point"):
		body.queue_free()
