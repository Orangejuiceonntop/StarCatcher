extends Node2D

@onready var themed_timer: Node2D = $ThemedTimer

var star_clicked = 0
var timer_end = false


func _ready() -> void:
	await themed_timer.Timer(20.0)
	timer_end = true
	

func _process(_delta: float) -> void:
	if star_clicked == 5:
		if Global.minigames_done > 2:
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -= 1
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")


func _on_black_hole_pressed() -> void:
	Global.lives -= 1
	Global.minigames_done -= 1
	get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")


func _on_star_pressed() -> void:
	$"Star/AnimationPlayer".play("click")
	star_clicked += 1
	
