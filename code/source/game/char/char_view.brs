function char_view(object)

  object.funcName = "char_view"

  object.onCreate = function(args)
    
    m.entityGen()
    m.colGen()

  end function

  object.entityLoad = function()

    m.char_regions = []

    for i = 0 to m.game.char.config.reg.Count() - 1

      if m.game.getBitmap(m.funcName + "_" + m.game.char.getRegElement(i).toStr()) = invalid
        ' loadBitmap
        m.game.loadBitmap(m.funcName + "_" + m.game.char.getRegElement(i).toStr(), "pkg:/media/char/sprites/" + m.game.char.getRegElement(i).toStr() + ".png")
      
      end if

      ' getBitmap
      char_bitmap = m.game.getBitmap(m.funcName + "_" + m.game.char.getRegElement(i).toStr())
  
      ' roRegion
      char_region = CreateObject("roRegion", char_bitmap, 0, 0, char_bitmap.GetWidth(), char_bitmap.GetHeight())

      m.char_regions.push(char_region)

    end for

  end function

  
  object.entityGen = function()

    m.entityLoad()

    ' addAnimatedImage
    m.addAnimatedImage(m.game.char.getEntityName(), m.char_regions, { index: m.game.char.getIndex()
      offset_x: m.game.char.getOffsetX(),
      offset_y: m.game.char.getOffsetY(),
      alpha: m.game.char.getAlpha()
      scale_x: m.game.char.getScaleX()
      scale_y: m.game.char.getScaleY()
    })

  end function

  object.colGen = function()

    ' addColliderRectangle
    m.addColliderRectangle(m.game.char.getColUpName(), m.game.char.getOffsetX() + 3, m.game.char.getOffsetY(), m.game.char.getSizeW() - 6, 1)
    m.addColliderRectangle(m.game.char.getColDownName(), m.game.char.getOffsetX() + 3, m.game.char.getOffsetY() + m.game.char.getSizeH(), m.game.char.getSizeW() - 6, 1)
    m.addColliderRectangle(m.game.char.getColLeftName(), m.game.char.getOffsetX(), m.game.char.getOffsetY() + 3, 1, m.game.char.getSizeH() - 6)
    m.addColliderRectangle(m.game.char.getColRightName(), m.game.char.getOffsetX() + m.game.char.getSizeW() - 1, m.game.char.getOffsetY() + 3, 1, m.game.char.getSizeH() - 6)
  
  end function
    
end function