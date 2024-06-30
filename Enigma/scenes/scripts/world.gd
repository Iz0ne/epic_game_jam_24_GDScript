extends Node
@onready var level = $Level

#var doCharacterDroppedCustomData : String = "doCharacterDropped"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Imitation.position.x = -$Player.position.x
	$Imitation.position.y = $Player.position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D.position.x = 0
	$Camera2D.position.y = $Player.position.y
	
	var playerPosition : Vector2i = level.local_to_map($Player.position)
	var imitationPosition : Vector2i = level.local_to_map($Imitation.position)
	
	var playerTileData : TileData = level.get_cell_tile_data(0,playerPosition)
	var imitationTileData : TileData = level.get_cell_tile_data(0,imitationPosition)
	
	print(playerTileData.get_custom_data("doCharacterDropped"))
	if playerTileData.get_custom_data("doCharacterDropped"):
		print("Player Dropped : GameOver")
		get_tree().reload_current_scene()
	if playerTileData.get_custom_data("reachedChest"):
		get_tree().change_scene_to_file("res://scenes/winner.tscn")
	
	if imitationTileData.get_custom_data("doCharacterDropped"):
		print("Imitation Dropped : GameOver")
		get_tree().reload_current_scene()
	
	#if playerTileData:
		#var doPlayerDropped = playerTileData.get_custom_data(doCharacterDroppedCustomData)
		#if doPlayerDropped:
			#print("Player Dropped : GameOver")
			#get_tree().reload_current_scene()
#
	#if imitationTileData:
		#var doImitationDropped = imitationTileData.get_custom_data(doCharacterDroppedCustomData)
		#if doImitationDropped:
			#print("Imitation Dropped : GameOver")
			#get_tree().reload_current_scene()
		
