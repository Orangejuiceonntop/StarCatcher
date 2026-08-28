extends Node2D

@onready var themed_timer: Node2D = $ThemedTimer
@onready var count: RichTextLabel = $Count

var timer_end = false
var stars_caught = 0


func _ready() -> void:
	await themed_timer.Timer(15.0)
	timer_end = true


func _process(_delta: float) -> void:
	if stars_caught == 8:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -= 1
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
	


func spawn_star():
	randomize()
	var star = preload("res://Scenes/falling_star.tscn")
	var falling_star = star.instantiate()
	
	falling_star.star_caught.connect(_on_star_caught)
		
	add_child(falling_star)
	falling_star.position.y = -50
	falling_star.position.x = randf_range(50, 1024)
	
func spawn_meteor():
	randomize()
	var meteor = preload("res://Scenes/falling_meteor.tscn")
	var falling_meteor = meteor.instantiate()
	
	falling_meteor.meteor_hit.connect(_on_meteor_hit)
	
	add_child(falling_meteor)
	falling_meteor.position.y = -50
	falling_meteor.position.x = randf_range(50, 1024)



func _on_star_timer_timeout() -> void:
	spawn_star()


func _on_meteor_timer_timeout() -> void:
	spawn_meteor()


func _on_star_caught() -> void:
	stars_caught += 1
	count.text = str(stars_caught) + "/8"


func _on_meteor_hit() -> void:
	Global.lives -= 1
	Global.minigames_done -= 1
	get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
