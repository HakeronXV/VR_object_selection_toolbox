class_name RotateNode

extends Node

func _push_in_node(received_node: Array[Node3D]):
	var euler : Vector3 = Vector3(randf(), randf(), randf())
	for n in received_node:
		n.rotate(euler.normalized(), randf()*360)
		var childrens = get_node_and_all_childrens_not_recusively(n)
		for child in childrens:
			if child is MeshInstance3D:
				print(child)
				var material: StandardMaterial3D = child.get_surface_override_material(0)
				material.albedo_color = Color(randf(),randf(),randf())

static func get_node_and_all_childrens_not_recusively(node:Node) -> Array[Node]:
	var nodes:Array[Node] = []
	nodes.append(node)
	for child in node.get_children():
		nodes.append(child)
	return nodes
