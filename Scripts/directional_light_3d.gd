extends DirectionalLight3D

@onready var directional_light_3d = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

var r = 0
var g = 0
var b = 255
var a = 100
var framecount = 0
var redFlag = false # true if reached 255
var blueFlag = false #true if reached 255
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	framecount = framecount + 1
	#if framecount == 1:
		#framecount = 0
		#if not redFlag:
			#if r == 255:
				#redFlag = true
			#else:
				#r = r + 0.1
		#elif not blueFlag:
			#if b == 255:
				#blueFlag = true
				#redFlag = false
			#else:
				#r = r - 0.1
				#b = b + 0.1
	print(str(r) + " " + str(g) + " " + str(b))
	
	
	var ba = Color(r,g,b,a)
	directional_light_3d.set_color(ba)
