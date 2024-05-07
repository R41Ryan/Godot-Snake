extends Node2D

var prev
var next
var step: int = 50
var cellPosX: int = 0
var cellPosY: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	visible = true
	global_position = Vector2(50 + step * cellPosX, 50 + step * cellPosY)
