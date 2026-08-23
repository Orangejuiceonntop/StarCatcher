extends Node2D

@onready var themed_timer: Node2D = $ThemedTimer

#write star variable here
var timer_end = false


func _ready() -> void:
	await themed_timer.Timer(15.0)
	timer_end = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func spawn_star():
	randomize()
	var star = preload("res://Scenes/falling_star.tscn")
	var falling_star = star.instantiate()
	
	add_child(falling_star)
	falling_star.position.y = -50
	falling_star.position.x = randf_range(0, 1024)


func _on_star_timer_timeout() -> void:
	spawn_star()
