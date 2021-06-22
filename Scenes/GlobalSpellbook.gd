extends Node

enum SPELL_STATE {
    NONE,
    GATHER,
    HOLD,
    HOLD_LAUNCH,
    LAUNCH,
    RELEASE
   }

enum RUNE {
    NULL,
    GATHER,
    DISPERSE,
    TRANSMUTE_FLAME,
    TRANSMUTE_WATER,
    TRANSMUTE_EARTH,
    TRANSMUTE_WIND,
    LAUNCH
     }

enum ELEMENT {
    PURE,
    FLAME,
    EARTH,
    WATER,
    WIND
   }

enum SHAPE {
    NONE,
    SPHERE,
    LANCE,
    WALL
   }

const RUNE_NAME = {
    RUNE.NULL : "Nothingness",
    RUNE.GATHER : "Gathering",
    RUNE.DISPERSE : "Dispersal",
    RUNE.TRANSMUTE_FLAME : "Flame Transmutation",
    RUNE.TRANSMUTE_WATER : "Water Transmutation",
    RUNE.TRANSMUTE_EARTH : "Earth Transmutation",
    RUNE.TRANSMUTE_WIND : "Wind Transmutation",
    RUNE.LAUNCH : "Launching"
   }

const RUNE_IMG = {
    RUNE.NULL : "runes/TestRune2.png",
    RUNE.GATHER : "runes/runes_Gathering.png",
    RUNE.DISPERSE : "runes/runes_Dispersal.png",
    RUNE.TRANSMUTE_FLAME : "runes/runes_FlameTransmutation.png",
    RUNE.TRANSMUTE_WATER : "runes/runes_Transmutation.png",
    RUNE.TRANSMUTE_EARTH : "runes/runes_Transmutation.png",
    RUNE.TRANSMUTE_WIND : "runes/runes_Transmutation.png",
    RUNE.LAUNCH : "runes/runes_Launching.png",
   }

const ELEM_ANIM = {
    ELEMENT.FLAME : "elem_fire",
    ELEMENT.WATER : "elem_water",
    ELEMENT.PURE : "elem_null",
    ELEMENT.WIND : "elem_wind",
    ELEMENT.EARTH : "elem_earth"
}

const SHAPE_ANIM = {
    SHAPE.NONE : "shape_cloud",
    SHAPE.SPHERE : "shape_sphere",
    SHAPE.WALL : "shape_wall"
   }

var spell_runes = [RUNE.GATHER, RUNE.LAUNCH]
