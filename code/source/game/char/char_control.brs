function char_control(object)

  object.onCreate = function(args)

    m.loadXY()

  end function


  object.saveXY = function()

    m.game.char.setEntityPosX(m.game.screen.GetWidth() / 2 - m.game.xy.get2DOffsetX())
    m.game.char.setEntityPosY(m.game.screen.GetHeight() / 2 - m.game.xy.get2DOffsetY())

  end function


  object.loadXY = function()

    ' position
    m.game.xy.set2DOffsetX(m.game.screen.GetWidth() / 2 - m.game.char.getEntityPosX())
    m.game.xy.set2DOffsetY(m.game.screen.GetHeight() / 2 - m.game.char.getEntityPosY())

  end function


  object.onUpdate = function(dt as float)

    m.saveXY()

  end function


  object.onButton = function(code as integer)

		' pressed
    if code = 2 ' up
      if m.game.getFocusGroup() = "char"
        if m.game.char.getScaleX() <> 1.0
          m.game.char.setEntityOffsetX(m.game.char.getEntityOffsetX() - m.game.char.getEntityW())
          
        end if
      m.game.char.setScaleX(1.0)

      end if

    else if code = 3 ' down
      if m.game.getFocusGroup() = "char"

        if m.game.char.getScaleX() <> 1.0
          m.game.char.setEntityOffsetX(m.game.char.getEntityOffsetX() - m.game.char.getEntityW())

        end if
        m.game.char.setScaleX(1.0)
      
      end if

    else if code = 4 ' left
      if m.game.getFocusGroup() = "char"
        if m.game.char.getScaleX() <> -1.0
          m.game.char.setEntityOffsetX(m.game.char.getEntityOffsetX() + m.game.char.getEntityW())
          m.game.char.setScaleX(-1.0)

        end if

      end if

		else if code = 5 ' right
      if m.game.getFocusGroup() = "char"
        if m.game.char.getScaleX() <> 1.0
          m.game.char.setEntityOffsetX(m.game.char.getEntityOffsetX() - m.game.char.getEntityW())
          m.game.char.setScaleX(1.0)

        end if

      end if

    ' held
    else if code = 1002 ' up
      if m.game.getFocusGroup() = "char"
        if m.game.char.getColUp() = false
          m.game.xy.set2DOffsetY(m.game.xy.get2DOffsetY() + m.game.char.getUpSpeed())

        end if

      end if
                      
    else if code = 1003 ' down
      if m.game.getFocusGroup() = "char"
        if m.game.char.getColDown() = false
          m.game.xy.set2DOffsetY(m.game.xy.get2DOffsetY() - m.game.char.getDownSpeed())

        end if
      
      end if
        
    else if code = 1004 ' left
      if m.game.getFocusGroup() = "char"
        if m.game.char.getColLeft() = false
          m.game.xy.set2DOffsetX(m.game.xy.get2DOffsetX() + m.game.char.getLeftSpeed())

        end if

      end if
            
    else if code = 1005 ' right
      if m.game.getFocusGroup() = "char"
        if m.game.char.getColRight() = false
          m.game.xy.set2DOffsetX(m.game.xy.get2DOffsetX() - m.game.char.getRightSpeed())

        end if

      end if
      
		end if

	end function
    
end function