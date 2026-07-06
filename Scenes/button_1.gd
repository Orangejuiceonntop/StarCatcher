extends TextureButton

@onready var parent = $".."

func _on_button_1_pressed() -> void:
	hide()
	parent.buttons_pressed += 1


func _on_button_2_pressed() -> void:
	hide()
	parent.buttons_pressed += 1


func _on_button_3_pressed() -> void:
	hide()
	parent.buttons_pressed += 1


func _on_button_4_pressed() -> void:
	hide()
	parent.buttons_pressed += 1


func _on_button_5_pressed() -> void:
	hide()
	parent.buttons_pressed += 1
