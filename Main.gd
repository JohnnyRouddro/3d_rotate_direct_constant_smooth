extends Spatial

func _input(event):
	
	if event is InputEventKey:
		if event.as_text() == "Up" || event.as_text() == "Down" || event.as_text() == "Left" || event.as_text() == "Right":
			if event.pressed:
				get_node("Control/" + event.as_text()).color = Color("#00eeaa")
			else:
				get_node("Control/" + event.as_text()).color = Color("#ffffff")
