extends Control

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/house interior.tscn") # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()

func _on_help_button_pressed():
	$HelpScreen.visible = true


func _on_back_button_pressed():
	$HelpScreen.visible = false
