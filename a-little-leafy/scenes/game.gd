extends Node2D

var total_leaves: int = 10

@onready var leaf_counter = $CanvasLayer/CounterBox/LeafCounter

func _ready():
	update_counter()

func collect_leaf():
	GameData.leaves_collected += 1
	update_counter()

func update_counter():
	leaf_counter.text = "Leaves: " + str(GameData.leaves_collected) + " / " + str(total_leaves)
