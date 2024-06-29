extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time = Time.get_ticks_msec()
	var sec = roundi(time/1000)
	var ms = round(time/100)%10
	$HUD/MarginContainer/VBoxContainer/Label_Time.text = "Time: %02d:%d"%[sec, ms]
