extends CharacterBody3D

@export var movement_speed: float = 2.0
@export var movement_target_position: Node3D

@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D

func _ready():
	navigation_agent.path_desired_distance = 0.5
	navigation_agent.target_desired_distance = 0.5
	actor_setup.call_deferred()

func actor_setup():
	await get_tree().physics_frame
	update_movement_target()

func update_movement_target():
	if not movement_target_position == null:
		navigation_agent.set_target_position(movement_target_position.global_position)

func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return
		
	update_movement_target()

	var current_agent_position: Vector3 = global_position
	var next_path_position: Vector3 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	move_and_slide()
