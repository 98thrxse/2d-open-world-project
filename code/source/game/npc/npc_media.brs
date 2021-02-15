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

      m.game.loadBitmap("beaten", "pkg:/media/npc/sprites/beaten.png")
  
  
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
  
    end function
        
end function