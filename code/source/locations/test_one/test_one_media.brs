function test_one_media(object)

    object.onCreate = function(args)

      ' SPRITES

      ' loadBitmap
      m.game.loadBitmap("obj", "pkg:/source/locations/test_one/media/sprites/obj.png")

  
      ' getBitmap
      obj_bitmap = m.game.getBitmap("obj")

  
      ' roRegion
      m.obj_region = CreateObject("roRegion", obj_bitmap, 0, 0, obj_bitmap.GetWidth(), obj_bitmap.GetHeight())

    end function
      
  end function