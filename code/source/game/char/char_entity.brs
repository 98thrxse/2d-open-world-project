function char_entity(object)

  object.onCreate = function(args)
    
    m.createXY()
    m.entityGen()

  end function


  object.createXY = function()
    m.xy = m.addImage(m.game.char.getZeroName(), "", {
      offset_x: m.game.char.getZeroOffsetX(),
      offset_y: m.game.char.getZeroOffsetY()
    })
  end function

  
  object.entityGen = function()

    char_regions = []

    for j = 0 to m.game.char.config.entity.anim.reg.Count() - 1
      ' loadBitmap
      m.game.loadBitmap(m.game.char.config.entity.anim.reg[j].toStr(), "pkg:/media/char/sprites/" + m.game.char.config.entity.anim.reg[j].toStr() + ".png")

      ' getBitmap
      char_bitmap = m.game.getBitmap(m.game.char.config.entity.anim.reg[j].toStr())
  
      ' roRegion
      char_region = CreateObject("roRegion", char_bitmap, 0, 0, char_bitmap.GetWidth(), char_bitmap.GetHeight())

      char_regions.push(char_region)

    end for


    ' addAnimatedImage
    m.addAnimatedImage(m.game.char.getEntityName(), char_regions, { index: m.game.char.getIndex()
      offset_x: m.game.char.getEntityOffsetX(),
      offset_y: m.game.char.getEntityOffsetY(),
      alpha: m.game.char.getAlpha()
      scale_x: m.game.char.getScaleX()
      scale_y: m.game.char.getScaleY()
    })

  end function
    
end function