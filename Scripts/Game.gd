extends Node3D

func _on_ui_quit() -> void:
	get_tree().change_scene_to_file("res://Scenes/TitleScreen.tscn")
