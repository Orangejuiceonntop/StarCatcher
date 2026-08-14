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
