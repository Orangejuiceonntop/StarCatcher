extends Node2D

@onready var net_container: HBoxContainer = $NetContainer
@onready var net: TextureRect = $NetContainer/Net
@onready var net_2: TextureRect = $NetContainer/Net2
@onready var net_3: TextureRect = $NetContainer/Net3
@onready var net_4: TextureRect = $NetContainer/Net4
@onready var net_5: TextureRect = $NetContainer/Net5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time

func _ready() -> void:
	await Timer(5.0)
	
	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done +1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(Global.minigames_done) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")

func _process(delta: float) -> void:
	match Global.lives:
		4:
			net.hide()
		3:
			net.hide()
			net_2.hide()
		2:
			net.hide()
			net_2.hide()
			net_3.hide()
		1:
			net.hide()
			net_2.hide()
			net_3.hide()
			net_4.hide()
		0:
			net_container.hide()
			
	timer.text = str(time)
	level.text = "Level" + str(Global.minigames_done)

func Timer(start_time: float):
	time = start_time
	while time > 0.0:
		await wait(0.1)
		time -=0.1
	return
	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
