extends Control

var score: int = 0
signal quit

func update_score(points):
	score += points
	$Score.text = "Score: %s"  % score

func _on_comet_man_collected_point():
	update_score(1)

func _on_comet_man_eat_planet():
	update_score(100)


func _on_comet_man_game_over() -> void:
	$GameOver.show()


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_button_up() -> void:
	quit.emit()
