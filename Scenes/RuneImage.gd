extends TextureRect

var rune

func load_image(rune):
    # get path to file
    var path = GlobalSpellbook.RUNE_IMG[rune]
    # create new image and load file
    var img = Image.new()
    img.load(path)
    # create texture from Image
    var itex = ImageTexture.new()
    itex.create_from_image(img)
    self.texture = itex
