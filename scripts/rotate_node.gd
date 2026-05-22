class_name RotateNode

extends Node

func _push_in_node(received_node: Array[Node3D]):
	var euler : Vector3 = Vector3(randf(), randf(), randf())
	for n in received_node:
		n.rotate(euler, randf()*360)
