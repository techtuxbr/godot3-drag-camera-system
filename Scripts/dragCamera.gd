extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


var mousePosition

# This variable will store a boolean value, if true, user can drag the camera, if's false, user can't drag the camera
var dragScreen = false
# This Variable will store true when the Left Mouse button is pressed
var pressed = false
export var dragSpeed = 1280
var screenCenter = Vector2(0,0)

func _ready():
	set_process_input(true)
	print(get_viewport().get_visible_rect().size)
	screenCenter.x = get_viewport().get_visible_rect().size.x/2
	screenCenter.y = get_viewport().get_visible_rect().size.y/2
	pass

func _process(delta):
	# You need to create a action called click
	if(Input.is_action_pressed("click") && dragScreen && pressed):
		var vector = (get_viewport().get_mouse_position() - screenCenter).normalized()
		move_and_slide(vector * dragSpeed)


func _input(event):
		if event is InputEventMouseButton:
			pressed = event.pressed
			dragScreen = false
		if event is InputEventMouseMotion:
			if pressed:
				dragScreen = true
				mousePosition = event.position