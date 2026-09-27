extends Node2D

@onready var timer_label = $CanvasLayer/TextureRect/TimerLabel

func _process(_delta):
	var total_seconds = int(GameData.game_time)
	var minutes = total_seconds / 60
	var seconds = total_seconds % 60

	timer_label.text = "%02d:%02d" % [minutes, seconds]
