class_name GroupWhitelist

extends Node

signal filtered_nodes(node_based_on_name_on_group: Array[Node3D])

@export var received_node: Array[Node3D]
@export var result_node: Array[Node3D]
@export var allowed_group: String



func _push_in_nod(finded_node: Array[Node3D]):
	
	received_node = finded_node
	result_node.clear()
	for n in finded_node:
		if n.is_in_group(allowed_group):
			result_node.append(n)
	filtered_nodes.emit(result_node)
