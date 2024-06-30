extends Camera2D


var start_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	start_time = Time.get_ticks_msec()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time = Time.get_ticks_msec() - start_time
	var sec = roundi(time/1000)
	var ms = round(time/100)%10
	$HUD/MarginContainer/VBoxContainer/Label_Time.text = "Time: %02d:%d"%[sec, ms]
