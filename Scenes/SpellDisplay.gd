extends GridContainer

export(PackedScene) var rune_image

func _ready():
    for rune in GlobalSpellbook.spell_runes:
        _add_rune(rune)

func _on_rune_clicked(rune):
    _add_rune(rune)

func _add_rune(rune):
    var rune_node = rune_image.instance()
    rune_node.load_image(rune)
    add_child(rune_node)
    GlobalSpellbook.spell_runes.append(rune)
