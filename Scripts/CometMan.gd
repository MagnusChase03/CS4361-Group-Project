extends CharacterBody3D

signal game_over
signal collected_point

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
	if body.is_in_group("Enemy"):
		game_over.emit()
		queue_free()
	if body.is_in_group("Point"):
		collected_point.emit()
		body.queue_free()
