extends Node2D

const gameHeight = 12
const gameWidth = 21

@onready var snake = $Snake
@onready var apple = $Apple
@onready var scoreText = $Score
@onready var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	snake.gameWidth = gameWidth
	snake.gameHeight = gameHeight
	apple.gameWidth = gameWidth
	apple.gameHeight = gameHeight
	apple.step = snake.step
	scoreText.text = "Score: 0"
	newApplePosition()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if snake.head.cellPosX == apple.cellPosX and snake.head.cellPosY == apple.cellPosY:
		score += 1
		snake.newBody()
		snake.bodyLength = score
		scoreText.text = "Score: %d" % score
		newApplePosition()

func newApplePosition():
	apple.cellPosX = randi() % gameWidth
	apple.cellPosY = randi() % gameHeight
