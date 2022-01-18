extends Camera

var Ball
var BallPosition

func _ready():
	set_as_toplevel(true)
	set_physics_process(true)

	Ball = get_parent()
	
func _physics_process(_delta):
	BallPosition = get_parent().get_global_transform().origin
	BallPosition.y += 15
	BallPosition.x += 15
	BallPosition.z += 15
	self.set_translation(BallPosition)
