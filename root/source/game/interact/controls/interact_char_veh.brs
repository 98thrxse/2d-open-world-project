sub interact_char_veh(object)

  object.onButton = sub(code as integer)

    ' pressed
    if code = 13 ' play
      m.focusChange()
    end if
  
  end sub

  object.focusChange = sub()
    if m.game.getFocusGroup() = "char" and m.game.char.getVehCol() <> invalid
      m.game.setFocusGroup("veh")
      m.game.setFocusTarget(0)

      m.game.char.setAlpha(0)

      m.game.char.setColUp(false)
      m.game.char.setColDown(false)
      m.game.char.setColLeft(false)
      m.game.char.setColRight(false)

      m.game.char.setVeh(m.game.char.getVehCol())

      if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) < 0.0
        m.game.map.setOffsetX(m.game.screen.GetWidth() / 2 + m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) / 2 * abs(m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt())) - m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()))
      else
        m.game.map.setOffsetX(m.game.screen.GetWidth() / 2 - m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) / 2 * abs(m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt())) - m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()))
      end if

      m.game.map.setOffsetY(m.game.screen.GetHeight() / 2 - m.game.veh.getEntityH(m.game.char.getVeh().split("_").peek().toInt()) / 2 * abs(m.game.veh.getScaleY(m.game.char.getVeh().split("_").peek().toInt())) - m.game.veh.getEntityY(m.game.char.getVeh().split("_").peek().toInt()))

    else if m.game.getFocusGroup() = "veh"
      m.game.setFocusGroup("char")
      m.game.setFocusTarget(0)

      m.game.char.setAlpha(255)

      m.game.char.setColUp(false)
      m.game.char.setColDown(false)
      m.game.char.setColLeft(false)
      m.game.char.setColRight(false)

      if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) < 0.0
        m.game.map.setOffsetX(m.game.screen.GetWidth() / 2 + m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) * abs(m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt())) - m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()))
      else
        m.game.map.setOffsetX(m.game.screen.GetWidth() / 2 - m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()))
      end if

      m.game.map.setOffsetY(m.game.screen.GetHeight() / 2 - m.game.veh.getEntityY(m.game.char.getVeh().split("_").peek().toInt()))
      
      m.game.char.setVeh(invalid)

    end if
  end sub

end sub