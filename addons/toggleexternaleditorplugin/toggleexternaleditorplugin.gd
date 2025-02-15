@tool
extends EditorPlugin


func _enter_tree() -> void:
	var command_palette = EditorInterface.get_command_palette()
	command_palette.add_command(
		"Toggle External Editor", "toggle_external_editor/toggle", toggle_external_editor
	)


func _exit_tree() -> void:
	var command_palette = EditorInterface.get_command_palette()
	command_palette.remove_command("toggle_external_editor/toggle")


func toggle_external_editor():
	var settings = EditorInterface.get_editor_settings()
	var prop = "text_editor/external/use_external_editor"
	var current_value = settings.get_setting(prop)
	var new_value = not current_value
	settings.set_setting(prop, new_value)
	if new_value:
		print("External Editor enabled")
	else:
		print("External Editor disabled")
