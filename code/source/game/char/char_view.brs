function char_view(object)

  object.funcName = "char_view"

  object.onCreate = function(args)

  end function

  object.onUpdate = function(dt as float)

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

    if m.getImage(m.game.char.getEntityName().toStr()) = invalid

      'load
      m.entityLoad()

      ' addAnimatedImage
      m.addAnimatedImage(m.game.char.getEntityName(), m.char_regions, { index: m.game.char.getIndex()
        offset_x: m.game.char.getOffsetX(),
        offset_y: m.game.char.getOffsetY(),
        alpha: m.game.char.getAlpha()
        scale_x: m.game.char.getScaleX()
        scale_y: m.game.char.getScaleY()
      })

    end if

  end function

  object.colGen = function()

    ' addColliderRectangle
    if m.colliders[m.game.char.getColUpName()] = invalid
      m.addColliderRectangle(m.game.char.getColUpName(), m.game.char.getOffsetX() + (m.game.char.getUpSpeed() + 1), m.game.char.getOffsetY(), m.game.char.getSizeW() * abs(m.game.char.getScaleX()) - (m.game.char.getUpSpeed() + 1) * 2, m.game.char.getUpSpeed() + 1)
    end if

    if m.colliders[m.game.char.getColDownName()] = invalid
      m.addColliderRectangle(m.game.char.getColDownName(), m.game.char.getOffsetX() + (m.game.char.getDownSpeed() + 1), m.game.char.getOffsetY() + m.game.char.getSizeH() * abs(m.game.char.getScaleY()) - (m.game.char.getDownSpeed() + 1), m.game.char.getSizeW() * abs(m.game.char.getScaleX()) - (m.game.char.getDownSpeed() + 1) * 2, m.game.char.getDownSpeed() + 1)
    end if

    if m.colliders[m.game.char.getColLeftName()] = invalid
      m.addColliderRectangle(m.game.char.getColLeftName(), m.game.char.getOffsetX(), m.game.char.getOffsetY() + (m.game.char.getLeftSpeed() + 1), m.game.char.getLeftSpeed() + 1, m.game.char.getSizeH() * abs(m.game.char.getScaleY()) - (m.game.char.getLeftSpeed() + 1) * 2)
    end if

    if m.colliders[m.game.char.getColRightName()] = invalid
      m.addColliderRectangle(m.game.char.getColRightName(), m.game.char.getOffsetX() + m.game.char.getSizeW() * abs(m.game.char.getScaleX()) - (m.game.char.getRightSpeed() + 1), m.game.char.getOffsetY() + (m.game.char.getRightSpeed() + 1), m.game.char.getRightSpeed() + 1, m.game.char.getSizeH() * abs(m.game.char.getScaleY()) - (m.game.char.getRightSpeed() + 1) * 2)
    end if

  end function

  object.onDrawEnd = function(canvas)
      
    ' test
    canvas.DrawRect(m.getCollider(m.game.char.getColUpName().toStr()).offset_x, m.getCollider(m.game.char.getColUpName().toStr()).offset_y, m.getCollider(m.game.char.getColUpName().toStr()).width, m.getCollider(m.game.char.getColUpName().toStr()).height, &hFFFFFFFF)
    canvas.DrawRect(m.getCollider(m.game.char.getColDownName().toStr()).offset_x, m.getCollider(m.game.char.getColDownName().toStr()).offset_y, m.getCollider(m.game.char.getColDownName().toStr()).width, m.getCollider(m.game.char.getColDownName().toStr()).height, &hFFFFFFFF)
    canvas.DrawRect(m.getCollider(m.game.char.getColLeftName().toStr()).offset_x, m.getCollider(m.game.char.getColLeftName().toStr()).offset_y, m.getCollider(m.game.char.getColLeftName().toStr()).width, m.getCollider(m.game.char.getColLeftName().toStr()).height, &hFFFFFFFF)
    canvas.DrawRect(m.getCollider(m.game.char.getColRightName().toStr()).offset_x, m.getCollider(m.game.char.getColRightName().toStr()).offset_y, m.getCollider(m.game.char.getColRightName().toStr()).width, m.getCollider(m.game.char.getColRightName().toStr()).height, &hFFFFFFFF)

  end function
    
end function