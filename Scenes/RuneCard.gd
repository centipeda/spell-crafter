extends Button

signal rune_entered(name)
signal rune_clicked(name)

export(GlobalSpellbook.RUNE) var rune

func _on_rune_mouse_entered():
    emit_signal("rune_entered", self.rune)

func _on_RuneCard_pressed():
    emit_signal("rune_clicked", self.rune)
