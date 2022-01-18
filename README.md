# godot-bumpy-sphere
Demo of unwanted bumpy spherical physics in Godot Engine 3.4

This demo has one sphere and two cylinders moving side by side on a flat service. The cylinder that is sitting flat on the surface seems to have been stabilized by the 'Smooth Trimesh Collision' option, but anything that rotates (sphere, cylider on its side) hits the collision mesh boundaries and bounces. Rotation seems to be important for the bounces to happen. If friction is set to 0, then all the shapes perform exactly the same.

## Notes
* No collision surfaces are rotated or resized, only very slightly transformed.
* RigidBody -> CollisionShape -> MeshInstance node hierarchy with as few manual changes as possible.

# Setup
#### Project -> Project Settings ->
* 'Physics Engine': Bullet
* 'Smooth Trimesh Collision': On
* 'Physics Fps': 60
#### Debug ->
* Visible Collision Shapes

# Toggles
## Godot Engine Toggles
* Physics Engine:
  * 'Physics Engine' Godot Physics - All objects bump on collision lines. Not tested with other Object Physics Toggles besides defaults.
  * 'Smooth Trimesh Collision' Off - All objects bump on collision lines. Not tested with other Object Physics Toggles besides defaults.
  * 'Smooth Trimesh Collision' On - Flat cylinder does not bump up or wobble using other defaults.
  * 'Physics Fps' 120, 240, 480 - No real effect on bumpiness.
## Object Physics Toggles (ObjectPhysics.gd)
* Forward Force:
  * How much additional `self.add_central_force(Vector3.FORWARD * FORWARD_FORCE)` force is applied at every `_physics_proces(delta)`.
  * Default - 20 for demo purposes
  * The higher the speed the more likely bounces are and for even the previous stable cylinders to wobble. The cylinder wobble could be due to other factors...
* Friction:
  * Object friction applied using a `physics_material_override`.
  * Godot Default - 1.0
  * Demo Default - 0.25 for demo purposes
  * High friction (i.e. 1.0) sometimes causes the cylinder to wobble and move slower (not ideal for demo purposes) and causes more bounciness for all objects.
  * Low friction (i.e. 0.15) causes objects to rotate slowly and not bounce as much.
  * Zero friction (i.e. 0.0) causes all object to move without bouncing using other defaults.
* Shape Margin:
  * Dunno much about this...
  * Godot Default - 0.04
  * Demo Default - 0.1
  * Between 0.1 and 0.2 seem to be very safe for the cylinder and stop wobbling for the most part.
  * Lower than 0.01 causes the upright cylinder to collide with the collision lines when using other defaults. Removes usefulness of the 'Smooth Trimesh Collision'.
  * Higher than 0.4 causes the upright cylinder to tumble head over tail.
