function player_media(object)

  object.onCreate = function(args)

    ' SPRITES

    ' loadBitmap
    m.game.loadBitmap("stand_front", "pkg:/source/player/media/sprites/stand_front.png")
    m.game.loadBitmap("stand_back", "pkg:/source/player/media/sprites/stand_back.png")
    m.game.loadBitmap("stand_side", "pkg:/source/player/media/sprites/stand_side.png")
    m.game.loadBitmap("walk_side1", "pkg:/source/player/media/sprites/walk_side1.png")
    m.game.loadBitmap("walk_side2", "pkg:/source/player/media/sprites/walk_side2.png")

    ' getBitmap
    stand_front_bitmap = m.game.getBitmap("stand_front")
    stand_back_bitmap = m.game.getBitmap("stand_back")
    stand_side_bitmap = m.game.getBitmap("stand_side")
    walk_side1_bitmap = m.game.getBitmap("walk_side1")
    walk_side2_bitmap = m.game.getBitmap("walk_side2")

    ' roRegion
    m.stand_front_region = CreateObject("roRegion", stand_front_bitmap, 0, 0, stand_front_bitmap.GetWidth(), stand_front_bitmap.GetHeight())
    m.stand_back_region = CreateObject("roRegion", stand_back_bitmap, 0, 0, stand_back_bitmap.GetWidth(), stand_back_bitmap.GetHeight())
    m.stand_side_region = CreateObject("roRegion", stand_side_bitmap, 0, 0, stand_side_bitmap.GetWidth(), stand_side_bitmap.GetHeight())
    m.walk_side1_region = CreateObject("roRegion", walk_side1_bitmap, 0, 0, walk_side1_bitmap.GetWidth(), walk_side1_bitmap.GetHeight())
    m.walk_side2_region = CreateObject("roRegion", walk_side2_bitmap, 0, 0, walk_side2_bitmap.GetWidth(), walk_side2_bitmap.GetHeight())

  end function
      
  end function