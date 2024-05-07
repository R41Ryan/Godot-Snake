extends Node2D

@export var step: int = 50

@onready var moveTimer = $MovementTimer
@onready var head = $Head
@onready var body = $Body
@onready var direction: int = 0 # 0 = right,  1 = left, 2 = down, 3 = up
@onready var bodyScene = preload("res://snake/snakeBody.tscn")

var gameWidth = 0
var gameHeight = 0

var bodyLength = 0
var newBodyPos = Vector2i()

# Called when the node enters the scene tree for the first time.
func _ready():
	moveTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _input(event):
	if Input.is_action_just_pressed("ui_down"):
		direction = 2
	if Input.is_action_just_pressed("ui_up"):
		direction = 3
	if Input.is_action_just_pressed("ui_right"):
		direction = 0
	if Input.is_action_just_pressed("ui_left"):
		direction = 1


func newBody():
	var newBody = bodyScene.instantiate()
	if bodyLength == 0:
		newBody.prev = head
		head.next = newBody
	else:
		newBody.prev = body.get_child(bodyLength - 1)
		body.get_child(bodyLength - 1).next = newBody
	newBody.cellPosX = newBodyPos.x
	newBody.cellPosY = newBodyPos.y
	body.add_child(newBody)
	

func moveBody():
	var index = body.get_child_count() - 1
	if index <= 0:
		newBodyPos = Vector2i(head.cellPosX, head.cellPosY)
	else:
		newBodyPos = Vector2i(body.get_child(index).cellPosX, body.get_child(index).cellPosY)
	while index >= 0:
		var bodyPart = body.get_child(index)
		if index == 0:
			bodyPart.cellPosX = head.cellPosX
			bodyPart.cellPosY = head.cellPosY
		else:
			bodyPart.cellPosX = bodyPart.prev.cellPosX
			bodyPart.cellPosY = bodyPart.prev.cellPosY
		index -= 1

func _on_movement_timer_timeout():
	moveBody()
	match(direction):
		0:
			if head.cellPosX < gameWidth - 1:
				head.cellPosX += 1
		1:
			if head.cellPosX > 0:
				head.cellPosX -= 1
		2:
			if head.cellPosY < gameHeight - 1:
				head.cellPosY += 1
		3:
			if head.cellPosY > 0:
				head.cellPosY -= 1
