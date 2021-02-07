function terrain_media(object)

    object.onCreate = function(args)

      ' SPRITES

      ' loadBitmap
      m.game.loadBitmap("terrain", "pkg:/media/terrain/sprites/terrain.png")

  
      ' getBitmap
      terrain_bitmap = m.game.getBitmap("terrain")

  
      ' roRegion
      m.terrain_region = CreateObject("roRegion", terrain_bitmap, 0, 0, terrain_bitmap.GetWidth(), terrain_bitmap.GetHeight())

    end function
      
  end function