extends Node2D

var info = {}

func init(spell_runes):
    info = {
        "position": Vector2(),
        "heading": 0,
        "mana_cost": 0,
        "element": GlobalSpellbook.ELEMENT.PURE,
        "shape": GlobalSpellbook.SHAPE.NONE,
        "size": 0,
        "runes": spell_runes
    }

func cast():
    # base case
    var _current_rune = info.runes.front()
    if not _current_rune:
        return
    
    match _current_rune:
        GlobalSpellbook.RUNE.GATHER:
            # mana gathering animation?
            pass
        GlobalSpellbook.RUNE.DISPERSE:
            # mana dispersal animation
            pass
        GlobalSpellbook.RUNE.TRANSMUTE_FLAME:
            info.element = GlobalSpellbook.ELEMENT.FLAME
        GlobalSpellbook.RUNE.TRANSMUTE_EARTH:
            info.element = GlobalSpellbook.ELEMENT.EARTH
        GlobalSpellbook.RUNE.TRANSMUTE_WATER:
            info.element = GlobalSpellbook.ELEMENT.WATER
        GlobalSpellbook.RUNE.TRANSMUTE_WIND:
            info.element = GlobalSpellbook.ELEMENT.WIND
    
    cast()
