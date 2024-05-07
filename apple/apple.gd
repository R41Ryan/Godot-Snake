extends Node2D

var step: int = 50

var cellPosX: int = 0
var cellPosY: int = 0
var gameWidth = 0
var gameHeight = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = Vector2(50 + step * cellPosX, 50 + step * cellPosY)
