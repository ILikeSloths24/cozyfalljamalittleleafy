extends Node2D

var leaves_collected: int = 0
var total_leaves: int = 0

@onready var leaf_counter = $CanvasLayer/CounterBox/LeafCounter

func _ready():
	total_leaves = get_tree().get_nodes_in_group("leaves").size()
	update_counter()

func collect_leaf():
	leaves_collected += 1
	update_counter()

func update_counter():
	leaf_counter.text = "Leaves: " + str(leaves_collected) + " / " + str(total_leaves)
