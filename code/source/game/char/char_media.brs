function char_media(object)

  object.onCreate = function(args)

    ' SPRITES

    ' loadBitmap
    m.game.loadBitmap("stand_front", "pkg:/media/char/sprites/stand_front.png")
    m.game.loadBitmap("stand_back", "pkg:/media/char/sprites/stand_back.png")
    m.game.loadBitmap("stand_side", "pkg:/media/char/sprites/stand_side.png")

    m.game.loadBitmap("walk_front1", "pkg:/media/char/sprites/walk_front1.png")
    m.game.loadBitmap("walk_front2", "pkg:/media/char/sprites/walk_front2.png")
    m.game.loadBitmap("walk_back1", "pkg:/media/char/sprites/walk_back1.png")
    m.game.loadBitmap("walk_back2", "pkg:/media/char/sprites/walk_back2.png")
    m.game.loadBitmap("walk_side1", "pkg:/media/char/sprites/walk_side1.png")
    m.game.loadBitmap("walk_side2", "pkg:/media/char/sprites/walk_side2.png")

    m.game.loadBitmap("beaten", "pkg:/media/char/sprites/beaten.png")

    m.game.loadBitmap("attack_side", "pkg:/media/char/sprites/attack_side.png")

    m.game.loadBitmap("fist_attack1", "pkg:/media/char/sprites/fist_attack1.png")
    m.game.loadBitmap("fist_attack2", "pkg:/media/char/sprites/fist_attack2.png")
    m.game.loadBitmap("fist_attack3", "pkg:/media/char/sprites/fist_attack3.png")
    m.game.loadBitmap("fist_attack4", "pkg:/media/char/sprites/fist_attack4.png")
    m.game.loadBitmap("fist_attack5", "pkg:/media/char/sprites/fist_attack5.png")
    m.game.loadBitmap("fist_attack6", "pkg:/media/char/sprites/fist_attack6.png")

    m.game.loadBitmap("leg_attack1", "pkg:/media/char/sprites/leg_attack1.png")
    m.game.loadBitmap("leg_attack2", "pkg:/media/char/sprites/leg_attack2.png")
    m.game.loadBitmap("leg_attack3", "pkg:/media/char/sprites/leg_attack3.png")


    ' getBitmap
    stand_front_bitmap = m.game.getBitmap("stand_front")
    stand_back_bitmap = m.game.getBitmap("stand_back")
    stand_side_bitmap = m.game.getBitmap("stand_side")

    walk_front1_bitmap = m.game.getBitmap("walk_front1")
    walk_front2_bitmap = m.game.getBitmap("walk_front2")
    walk_back1_bitmap = m.game.getBitmap("walk_back1")
    walk_back2_bitmap = m.game.getBitmap("walk_back2")
    walk_side1_bitmap = m.game.getBitmap("walk_side1")
    walk_side2_bitmap = m.game.getBitmap("walk_side2")
    
    beaten_bitmap = m.game.getBitmap("beaten")

    attack_side_bitmap = m.game.getBitmap("attack_side")

    fist_attack1_bitmap = m.game.getBitmap("fist_attack1")
    fist_attack2_bitmap = m.game.getBitmap("fist_attack2")
    fist_attack3_bitmap = m.game.getBitmap("fist_attack3")
    fist_attack4_bitmap = m.game.getBitmap("fist_attack4")
    fist_attack5_bitmap = m.game.getBitmap("fist_attack5")
    fist_attack6_bitmap = m.game.getBitmap("fist_attack6")

    leg_attack1_bitmap = m.game.getBitmap("leg_attack1")
    leg_attack2_bitmap = m.game.getBitmap("leg_attack2")
    leg_attack3_bitmap = m.game.getBitmap("leg_attack3")


    ' roRegion
    m.stand_front_region = CreateObject("roRegion", stand_front_bitmap, 0, 0, stand_front_bitmap.GetWidth(), stand_front_bitmap.GetHeight())
    m.stand_back_region = CreateObject("roRegion", stand_back_bitmap, 0, 0, stand_back_bitmap.GetWidth(), stand_back_bitmap.GetHeight())
    m.stand_side_region = CreateObject("roRegion", stand_side_bitmap, 0, 0, stand_side_bitmap.GetWidth(), stand_side_bitmap.GetHeight())
    
    m.walk_front1_region = CreateObject("roRegion", walk_front1_bitmap, 0, 0, walk_front1_bitmap.GetWidth(), walk_front1_bitmap.GetHeight())
    m.walk_front2_region = CreateObject("roRegion", walk_front2_bitmap, 0, 0, walk_front2_bitmap.GetWidth(), walk_front2_bitmap.GetHeight())
    m.walk_back1_region = CreateObject("roRegion", walk_back1_bitmap, 0, 0, walk_back1_bitmap.GetWidth(), walk_back1_bitmap.GetHeight())
    m.walk_back2_region = CreateObject("roRegion", walk_back2_bitmap, 0, 0, walk_back2_bitmap.GetWidth(), walk_back2_bitmap.GetHeight())
    m.walk_side1_region = CreateObject("roRegion", walk_side1_bitmap, 0, 0, walk_side1_bitmap.GetWidth(), walk_side1_bitmap.GetHeight())
    m.walk_side2_region = CreateObject("roRegion", walk_side2_bitmap, 0, 0, walk_side2_bitmap.GetWidth(), walk_side2_bitmap.GetHeight())

    m.beaten_region = CreateObject("roRegion", beaten_bitmap, 0, 0, beaten_bitmap.GetWidth(), beaten_bitmap.GetHeight())

    m.attack_side_region = CreateObject("roRegion", attack_side_bitmap, 0, 0, attack_side_bitmap.GetWidth(), attack_side_bitmap.GetHeight())

    m.fist_attack1_region = CreateObject("roRegion", fist_attack1_bitmap, 0, 0, fist_attack1_bitmap.GetWidth(), fist_attack1_bitmap.GetHeight())
    m.fist_attack2_region = CreateObject("roRegion", fist_attack2_bitmap, 0, 0, fist_attack2_bitmap.GetWidth(), fist_attack2_bitmap.GetHeight())
    m.fist_attack3_region = CreateObject("roRegion", fist_attack3_bitmap, 0, 0, fist_attack3_bitmap.GetWidth(), fist_attack3_bitmap.GetHeight())
    m.fist_attack4_region = CreateObject("roRegion", fist_attack4_bitmap, 0, 0, fist_attack4_bitmap.GetWidth(), fist_attack4_bitmap.GetHeight())
    m.fist_attack5_region = CreateObject("roRegion", fist_attack5_bitmap, 0, 0, fist_attack5_bitmap.GetWidth(), fist_attack5_bitmap.GetHeight())
    m.fist_attack6_region = CreateObject("roRegion", fist_attack6_bitmap, 0, 0, fist_attack6_bitmap.GetWidth(), fist_attack6_bitmap.GetHeight())

    m.leg_attack1_region = CreateObject("roRegion", leg_attack1_bitmap, 0, 0, leg_attack1_bitmap.GetWidth(), leg_attack1_bitmap.GetHeight())
    m.leg_attack2_region = CreateObject("roRegion", leg_attack2_bitmap, 0, 0, leg_attack2_bitmap.GetWidth(), leg_attack2_bitmap.GetHeight())
    m.leg_attack3_region = CreateObject("roRegion", leg_attack3_bitmap, 0, 0, leg_attack3_bitmap.GetWidth(), leg_attack3_bitmap.GetHeight())

  end function
      
  end function