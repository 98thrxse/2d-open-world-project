function npc_media(object)

    object.onCreate = function(args)
  
      ' SPRITES
  
      ' loadBitmap
      m.game.loadBitmap("stand_front", "pkg:/media/npc/sprites/stand_front.png")
      m.game.loadBitmap("stand_back", "pkg:/media/npc/sprites/stand_back.png")
      m.game.loadBitmap("stand_side", "pkg:/media/npc/sprites/stand_side.png")
  
      m.game.loadBitmap("walk_front1", "pkg:/media/npc/sprites/walk_front1.png")
      m.game.loadBitmap("walk_front2", "pkg:/media/npc/sprites/walk_front2.png")
      m.game.loadBitmap("walk_back1", "pkg:/media/npc/sprites/walk_back1.png")
      m.game.loadBitmap("walk_back2", "pkg:/media/npc/sprites/walk_back2.png")
      m.game.loadBitmap("walk_side1", "pkg:/media/npc/sprites/walk_side1.png")
      m.game.loadBitmap("walk_side2", "pkg:/media/npc/sprites/walk_side2.png")

      m.game.loadBitmap("hp_zero", "pkg:/media/npc/sprites/hp_zero.png")
      m.game.loadBitmap("sp_zero", "pkg:/media/npc/sprites/sp_zero.png")

      m.game.loadBitmap("attack_side", "pkg:/media/npc/sprites/attack_side.png")

      m.game.loadBitmap("attack_fist1", "pkg:/media/npc/sprites/attack_fist1.png")
      m.game.loadBitmap("attack_fist2", "pkg:/media/npc/sprites/attack_fist2.png")
      m.game.loadBitmap("attack_fist3", "pkg:/media/npc/sprites/attack_fist3.png")
      m.game.loadBitmap("attack_fist4", "pkg:/media/npc/sprites/attack_fist4.png")
      m.game.loadBitmap("attack_fist5", "pkg:/media/npc/sprites/attack_fist5.png")
      m.game.loadBitmap("attack_fist6", "pkg:/media/npc/sprites/attack_fist6.png")
  
      m.game.loadBitmap("attack_leg1", "pkg:/media/npc/sprites/attack_leg1.png")
      m.game.loadBitmap("attack_leg2", "pkg:/media/npc/sprites/attack_leg2.png")
      m.game.loadBitmap("attack_leg3", "pkg:/media/npc/sprites/attack_leg3.png")
  
  
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

      hp_zero_bitmap = m.game.getBitmap("hp_zero")
      sp_zero_bitmap = m.game.getBitmap("sp_zero")

      attack_side_bitmap = m.game.getBitmap("attack_side")

      attack_fist1_bitmap = m.game.getBitmap("attack_fist1")
      attack_fist2_bitmap = m.game.getBitmap("attack_fist2")
      attack_fist3_bitmap = m.game.getBitmap("attack_fist3")
      attack_fist4_bitmap = m.game.getBitmap("attack_fist4")
      attack_fist5_bitmap = m.game.getBitmap("attack_fist5")
      attack_fist6_bitmap = m.game.getBitmap("attack_fist6")
  
      attack_leg1_bitmap = m.game.getBitmap("attack_leg1")
      attack_leg2_bitmap = m.game.getBitmap("attack_leg2")
      attack_leg3_bitmap = m.game.getBitmap("attack_leg3")

  
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

      m.hp_zero_region = CreateObject("roRegion", hp_zero_bitmap, 0, 0, hp_zero_bitmap.GetWidth(), hp_zero_bitmap.GetHeight())
      m.sp_zero_region = CreateObject("roRegion", sp_zero_bitmap, 0, 0, sp_zero_bitmap.GetWidth(), sp_zero_bitmap.GetHeight())
  
      m.attack_side_region = CreateObject("roRegion", attack_side_bitmap, 0, 0, attack_side_bitmap.GetWidth(), attack_side_bitmap.GetHeight())

      m.attack_fist1_region = CreateObject("roRegion", attack_fist1_bitmap, 0, 0, attack_fist1_bitmap.GetWidth(), attack_fist1_bitmap.GetHeight())
      m.attack_fist2_region = CreateObject("roRegion", attack_fist2_bitmap, 0, 0, attack_fist2_bitmap.GetWidth(), attack_fist2_bitmap.GetHeight())
      m.attack_fist3_region = CreateObject("roRegion", attack_fist3_bitmap, 0, 0, attack_fist3_bitmap.GetWidth(), attack_fist3_bitmap.GetHeight())
      m.attack_fist4_region = CreateObject("roRegion", attack_fist4_bitmap, 0, 0, attack_fist4_bitmap.GetWidth(), attack_fist4_bitmap.GetHeight())
      m.attack_fist5_region = CreateObject("roRegion", attack_fist5_bitmap, 0, 0, attack_fist5_bitmap.GetWidth(), attack_fist5_bitmap.GetHeight())
      m.attack_fist6_region = CreateObject("roRegion", attack_fist6_bitmap, 0, 0, attack_fist6_bitmap.GetWidth(), attack_fist6_bitmap.GetHeight())
  
      m.attack_leg1_region = CreateObject("roRegion", attack_leg1_bitmap, 0, 0, attack_leg1_bitmap.GetWidth(), attack_leg1_bitmap.GetHeight())
      m.attack_leg2_region = CreateObject("roRegion", attack_leg2_bitmap, 0, 0, attack_leg2_bitmap.GetWidth(), attack_leg2_bitmap.GetHeight())
      m.attack_leg3_region = CreateObject("roRegion", attack_leg3_bitmap, 0, 0, attack_leg3_bitmap.GetWidth(), attack_leg3_bitmap.GetHeight())
  
    end function
        
end function