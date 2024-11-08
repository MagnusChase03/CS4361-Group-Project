extends CharacterBody3D

signal game_over
signal collected_point
signal eat_planet

@export var movement_speed: float = 6.0
var direction: Vector3
var power_up: bool = false

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
	if body.is_in_group("Enemy") and not power_up:
		game_over.emit()
		queue_free()
	elif body.is_in_group("Enemy") and power_up:
		eat_planet.emit()
		body.die()
	elif body.is_in_group("PowerUp"):
		power_up = true
		body.queue_free()
		$PowerUpTimer.start()
	elif body.is_in_group("Point"):
		collected_point.emit()
		body.queue_free()

func _on_power_up_timer_timeout():
	power_up = false
