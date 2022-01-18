extends RigidBody

onready var start_time = OS.get_unix_time()
var start_delay_sec = 2
# Forward Force (Default 20)  - 50.0 (with other defaults) causes cylinder to wobble. 
var FORWARD_FORCE = 20
# Friction      (Default 0.25) - 0.1 (with other defaults) is not bouncy and 1.0 is very bouncy.
var FRICTION = 0.25
# Shape Margin  (Default 0.1) - Lower than 0.01 or higher than .4 causes upright cylinder to fail.
# 0.1 to 0.2 seem to be very safe from a stability of the physics.
var SHAPE_MARGIN = 0.1


func _ready():
	self.mass = 1
	if not self.physics_material_override:
		self.physics_material_override = PhysicsMaterial.new()
	self.physics_material_override.friction = FRICTION
	(self.get_child(0) as CollisionShape).shape.margin = SHAPE_MARGIN

func _physics_process(_delta):
	if start_time + start_delay_sec < OS.get_unix_time():
		self.add_central_force(Vector3.FORWARD * FORWARD_FORCE)
