function char_entity(object)

  object.funcName = "char_entity"

  object.onCreate = function(args)
    
    m.entityGen()

  end function

  object.entityLoad = function()

    m.char_regions = []

    for i = 0 to m.game.char.config.entity.reg.Count() - 1

      if m.game.getBitmap(m.funcName + "_" + m.game.char.getReg(i).toStr()) = invalid
        ' loadBitmap
        m.game.loadBitmap(m.funcName + "_" + m.game.char.getReg(i).toStr(), "pkg:/media/char/sprites/" + m.game.char.getReg(i).toStr() + ".png")
      
      end if

      ' getBitmap
      char_bitmap = m.game.getBitmap(m.funcName + "_" + m.game.char.getReg(i).toStr())
  
      ' roRegion
      char_region = CreateObject("roRegion", char_bitmap, 0, 0, char_bitmap.GetWidth(), char_bitmap.GetHeight())

      m.char_regions.push(char_region)

    end for

  end function

  
  object.entityGen = function()

    m.entityLoad()

    ' addAnimatedImage
    m.addAnimatedImage(m.game.char.getEntityName(), m.char_regions, { index: m.game.char.getIndex()
      offset_x: m.game.char.getEntityOffsetX(),
      offset_y: m.game.char.getEntityOffsetY(),
      alpha: m.game.char.getAlpha()
      scale_x: m.game.char.getScaleX()
      scale_y: m.game.char.getScaleY()
    })

  end function
    
end function