extends Control

var score: int = 0

func update_score(points):
	score += points
	$Score.text = "Score: %s"  % score


func _on_comet_man_collected_point():
	update_score(1)
