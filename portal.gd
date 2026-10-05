extends Area2D

var alguem_ganhou = false


func _on_body_entered(body: Node2D) -> void:
	if alguem_ganhou:
		return
	alguem_ganhou = true

	print(body.nome + " ganhou!")

	await get_tree().create_timer(2.0).timeout

	if body.name == "player1":
		get_tree().change_scene_to_file("res://vitoria_p1.tscn")
	else:
		get_tree().change_scene_to_file("res://vitoria_p2.tscn")
