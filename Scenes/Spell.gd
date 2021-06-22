extends Node2D

export(int) var base_speed = 5

var state = GlobalSpellbook.SPELL_STATE.NONE
var speed

var _radius    = 5
var _extents   = Vector2(1,1)
var _mana_cost = 0
var _element   = GlobalSpellbook.ELEMENT.PURE
var _shape     = GlobalSpellbook.SHAPE.NONE
var _runes     = []
var _velocity  = Vector2()

var _element_states
var _shape_states
var _shape_anim = {}

var c = 0

const RADIUS_NODE_PATH = "MagicParticles:emission_sphere_radius"
const EXTENTS_NODE_PATH = "MagicParticles:emission_rect_extents"

func _ready():
    _element_states = $SpellManager.get("parameters/Element/playback")
    _shape_states = $SpellManager.get("parameters/Shape/playback")
    # think of a better way to get the shape animations on load...
    # we need to get the shape animations
    # so we can alter parameters like radius and extents
    _shape_anim[GlobalSpellbook.SHAPE.NONE] = $SpellAnimations.get_animation("shape_cloud")
    _shape_anim[GlobalSpellbook.SHAPE.SPHERE] = $SpellAnimations.get_animation("shape_sphere")
    _shape_anim[GlobalSpellbook.SHAPE.WALL] = $SpellAnimations.get_animation("shape_wall")
    
    # set scale to zero when we start up
    $MagicParticles.scale_amount = 0
    
    speed = base_speed
    

func test():
    set_runes(GlobalSpellbook.spell_runes)
    cast()
    
func fade_in():
    $SpellManager.set("parameters/Startup Override/active", true)

func fade_out():
    $SpellManager.set("parameters/Fadeout Override/active", true)

func set_extents(ext):
    # set particle extents
    var track_idx = _shape_anim[GlobalSpellbook.SHAPE.WALL].find_track(EXTENTS_NODE_PATH)
    _shape_anim[GlobalSpellbook.SHAPE.WALL].track_set_key_value(track_idx, 0, ext)
    # set collider extents
    $WallCollider/Rect.shape.extents = ext
    
func set_radius(rad):
    # set particle radius
    var cloud_track_idx = _shape_anim[GlobalSpellbook.SHAPE.NONE].find_track(RADIUS_NODE_PATH)
    _shape_anim[GlobalSpellbook.SHAPE.NONE].track_set_key_value(cloud_track_idx, 0, rad)
    var sphere_track_idx = _shape_anim[GlobalSpellbook.SHAPE.SPHERE].find_track(RADIUS_NODE_PATH)
    _shape_anim[GlobalSpellbook.SHAPE.SPHERE].track_set_key_value(sphere_track_idx, 0, rad)
    # set collider radius
    $SphereCollider/Circle.shape.radius = rad
    
    
func set_element(elem):
    _element_states.travel(GlobalSpellbook.ELEM_ANIM[elem])
    _element = elem
    pass

func set_shape(shape):
    _shape_states.travel(GlobalSpellbook.SHAPE_ANIM[shape])
    _shape = shape
    
func set_runes(spell_runes):
    _runes = spell_runes.duplicate()

func cast():
    # base case
    var _current_rune = _runes.pop_front()
    if not _current_rune:
        return
    
    match _current_rune:
        GlobalSpellbook.RUNE.GATHER:
            fade_in()
            state = GlobalSpellbook.SPELL_STATE.GATHER
        GlobalSpellbook.RUNE.DISPERSE:
            state = GlobalSpellbook.SPELL_STATE.HOLD
            print("holding")
            return
        GlobalSpellbook.RUNE.LAUNCH:
            state = GlobalSpellbook.SPELL_STATE.HOLD_LAUNCH
            print("waiting for launch")
            return
        GlobalSpellbook.RUNE.TRANSMUTE_FLAME:
            set_element(GlobalSpellbook.ELEMENT.FLAME)
        GlobalSpellbook.RUNE.TRANSMUTE_EARTH:
            set_element(GlobalSpellbook.ELEMENT.EARTH)
        GlobalSpellbook.RUNE.TRANSMUTE_WATER:
            set_element(GlobalSpellbook.ELEMENT.WATER)
        GlobalSpellbook.RUNE.TRANSMUTE_WIND:
            set_element(GlobalSpellbook.ELEMENT.WIND)
    
    cast()

func disperse():
    fade_out()
    $MagicParticles.connect("emit_cycle_finished", self, "queue_free")

func launch(vel):
    _velocity = vel
    state = GlobalSpellbook.SPELL_STATE.LAUNCH
