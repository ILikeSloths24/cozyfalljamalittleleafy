extends Node

var leaves_collected: int = 0
var game_time: float = 0.0
var timer_running: bool = false
var timer_started: bool = false


func _process(delta):
	if timer_running:
		game_time += delta
