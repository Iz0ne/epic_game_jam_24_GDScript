extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Imitation.position.x = -$Player.position.x
	$Imitation.position.y = $Player.position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D.position.x = 0
	$Camera2D.position.y = $Player.position.y
