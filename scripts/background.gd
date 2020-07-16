extends ParallaxBackground

const movespeed = 200
var backgrounds = []

func _ready():
	backgrounds.append(get_node("Background1"))
	backgrounds.append(get_node("Background2"))
	
func _process(delta):
	for i in backgrounds.size():
		var temp = backgrounds[i].get_position()
		temp.y += get_node("/root/Obstacle").speed * delta
		backgrounds[i].set_position(temp)
	
