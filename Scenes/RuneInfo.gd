extends RichTextLabel

func _on_rune_changed(rune):
    text = "Rune of " + GlobalSpellbook.RUNE_NAME[rune]


func _on_rune_exit():
    text = ""
