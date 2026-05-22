class_name ListenToArea3D
extends Node

signal down()
signal up()
signal has_a_node_changed(is_on:bool)
signal object_array_status(array : Array[Node3D])

@export var observe_area : Area3D
@export var object_in_zone: Array [Node3D]
@export var has_a_node: bool

func _refresh():
	#Reminder
	#signal down() True
	#signal up() False
	#signal has_a_node_changed(is_on: bool)
	#signal object_array_status(array : Array[Node3D])
	var previous_node = has_a_node
	has_a_node = object_in_zone.size() > 0
	var changed = has_a_node != previous_node
	if changed:
		has_a_node_changed.emit(has_a_node)
	if has_a_node:
		down.emit()
	else: 
		up.emit()
	object_array_status.emit(object_in_zone)
	
func _ready() -> void:
	observe_area.area_entered.connect(_entered_area)
	observe_area.area_exited.connect(_exited_area)
	observe_area.body_entered.connect(_entered_body)
	observe_area.body_exited.connect(_exited_body)
	_refresh()

func _entered_area(area: Area3D):
	if not area in object_in_zone:
		print(area)
		object_in_zone.append(area)
		_refresh()
func _exited_area(area: Area3D):
	print(area)
	object_in_zone.erase(area)
	_refresh()
func _entered_body(body : Node3D):
	if not body in object_in_zone:
		print(body)
		object_in_zone.append(body)
		_refresh()
func _exited_body(body : Node3D):
	print(body)
	object_in_zone.erase(body)
	_refresh()
