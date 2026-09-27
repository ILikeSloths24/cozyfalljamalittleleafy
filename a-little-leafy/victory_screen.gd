extends Control

@onready var time_label = $TimeLabel

func _ready():
	GameData.timer_running = false

	var total_seconds = int(GameData.game_time)
	var minutes = total_seconds / 60
	var seconds = total_seconds % 60

	time_label.text = "%02d:%02d" % [minutes, seconds]
	time_label.text = "%02d:%02d" % [minutes, seconds]


func _on_restart_button_pressed():
	GameData.leaves_collected = 0
	GameData.game_time = 0.0
	GameData.timer_running = true

	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
