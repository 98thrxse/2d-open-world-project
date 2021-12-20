function veh_control(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.view_wnd = m.game.getInstanceByName("veh_view")

  end function

  object.controlPos = function()

    ' entity position
    m.view_wnd.x = m.game.map.getOffsetX()
    m.view_wnd.y = m.game.map.getOffsetY()

  end function

  object.onUpdate = function(dt as float)

    m.controlPos()

    m.controlUpdate()

  end function

  object.onButton = function(code as integer)

    ' stas
    ' pressed
    if code = 2 ' up
      if m.game.getFocusGroup() = "veh"
        m.vehTurnUp()
      end if

    else if code = 3 ' down
      if m.game.getFocusGroup() = "veh"
        m.vehTurnDown()
      end if

    else if code = 4 ' left
      if m.game.getFocusGroup() = "veh"
        m.vehTurnLeft()
      end if

    else if code = 5 ' right
      if m.game.getFocusGroup() = "veh"
        m.vehTurnRight()
      end if

    else if code = 13 ' play
      m.focusChange()

    ' released
    else if code = 102 ' up
      if m.game.getFocusGroup() = "veh"
        m.vehIdleUp()      
        m.vehAnimIdleUp()
      end if

    else if code = 103 ' down
      if m.game.getFocusGroup() = "veh"
        m.vehIdleDown() 
        m.vehAnimIdleDown()       
      end if

    else if code = 104 ' left
      if m.game.getFocusGroup() = "veh"
        m.vehIdleLeft()
        m.vehAnimIdleLeft()        
      end if

    else if code = 105 ' right
      if m.game.getFocusGroup() = "veh"
        m.vehIdleRight() 
        m.vehAnimIdleRight()       
      end if

    ' held
    else if code = 1002 ' up
      if m.game.getFocusGroup() = "veh"
        m.vehWalkUp()
        m.vehAnimWalkUp()
      end if
                      
    else if code = 1003 ' down
      if m.game.getFocusGroup() = "veh"
        m.vehWalkDown()  
        m.vehAnimWalkDown()    
      end if
        
    else if code = 1004 ' left
      if m.game.getFocusGroup() = "veh"
        m.vehWalkLeft()
        m.vehAnimWalkSide()
      end if
            
    else if code = 1005 ' right
      if m.game.getFocusGroup() = "veh"
        m.vehWalkRight()
        m.vehAnimWalkSide()
      end if
      
    end if

  end function

  object.focusChange = function()
    if m.game.getFocusGroup() = "char" and m.game.char.getVehCol() <> invalid
      m.game.setFocusGroup("veh")
      m.game.setFocusTarget("")

      m.game.char.setVeh(m.game.char.getVehCol())

      m.game.map.setOffsetX(m.game.screen.GetWidth() / 2 - m.game.veh.getSizeW(m.game.char.getVeh().split("_").peek().toInt()) / 2 - m.game.veh.getOffsetX(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.map.setOffsetY(m.game.screen.GetHeight() / 2 - m.game.veh.getSizeH(m.game.char.getVeh().split("_").peek().toInt()) / 2 - m.game.veh.getOffsetY(m.game.char.getVeh().split("_").peek().toInt()))
    
    else if m.game.getFocusGroup() = "veh"
      m.game.setFocusGroup("char")
      m.game.setFocusTarget("")

      m.game.map.setOffsetX(m.game.screen.GetWidth() / 2 - m.game.veh.getOffsetX(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.map.setOffsetY(m.game.screen.GetHeight() / 2 - m.game.veh.getOffsetY(m.game.char.getVeh().split("_").peek().toInt()))
      
      m.game.char.setVeh(invalid)

    end if
  end function

	object.animPlay = function(i, arr)

		if m.timer = invalid
			m.timer = CreateObject("roTimeSpan")
			m.timer.Mark()
		end if

		arrAnim = []

		for each element in arr
			for j = 0 to m.game.veh.config[i].reg.Count() - 1
				if m.game.veh.getRegElement(i, j) = element then arrAnim.push(j)
			end for
		end for
		
		if m.timer.TotalMilliseconds() + 1 >= arrAnim.Count() * m.game.veh.getAnimTime(i) then m.timer.Mark()
		m.game.veh.setIndex(i, arrAnim[int(m.timer.TotalMilliseconds() / m.game.veh.getAnimTime(i))])

	end function

  object.vehTurnUp = function()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) <> 1.0
      m.game.veh.setOffsetX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getOffsetX(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getSizeW(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), 1.0)
    end if
  end function

  object.vehTurnDown = function()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) <> 1.0
      m.game.veh.setOffsetX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getOffsetX(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getSizeW(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), 1.0)
    end if
  end function

  object.vehTurnLeft = function()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) <> -1.0
      m.game.veh.setOffsetX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getOffsetX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getSizeW(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), -1.0)
    end if
  end function

  object.vehTurnRight = function()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) <> 1.0
      m.game.veh.setOffsetX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getOffsetX(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getSizeW(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), 1.0)
    end if
  end function

  object.vehIdleUp = function()
    ' m.game.veh.setNPCCol(invalid)
    ' m.game.veh.setMarkerCol(invalid)
    ' m.game.veh.setVehCol(invalid)
    ' m.game.veh.setColDown(false)
    ' m.game.veh.setColLeft(false)
    ' m.game.veh.setColRight(false)
  end function

  object.vehIdleDown = function()
    ' m.game.veh.setNPCCol(invalid)
    ' m.game.veh.setMarkerCol(invalid)
    ' m.game.veh.setVehCol(invalid)
    ' m.game.veh.setColUp(false)
    ' m.game.veh.setColLeft(false)
    ' m.game.veh.setColRight(false)
  end function

  object.vehIdleLeft = function()
    ' m.game.veh.setNPCCol(invalid)
    ' m.game.veh.setMarkerCol(invalid)
    ' m.game.veh.setVehCol(invalid)
    ' m.game.veh.setColUp(false)
    ' m.game.veh.setColDown(false)
    ' m.game.veh.setColRight(false)
  end function

  object.vehIdleRight = function()
    ' m.game.veh.setNPCCol(invalid)
    ' m.game.veh.setMarkerCol(invalid)
    ' m.game.veh.setVehCol(invalid)
    ' m.game.veh.setColUp(false)
    ' m.game.veh.setColDown(false)
    ' m.game.veh.setColLeft(false)
  end function

  object.vehAnimIdleUp = function()
		m.animTimer = invalid
		m.animPlay(m.game.char.getVeh().split("_").peek().toInt(), ["veh_car1_back"])
	end function

	object.vehAnimIdleDown = function()
		m.animTimer = invalid
		m.animPlay(m.game.char.getVeh().split("_").peek().toInt(), ["veh_car1_front"])
	end function

	object.vehAnimIdleLeft = function()
		m.animTimer = invalid
		m.animPlay(m.game.char.getVeh().split("_").peek().toInt(), ["veh_car1_side"])
	end function

	object.vehAnimIdleRight = function()
    m.animTimer = invalid
		m.animPlay(m.game.char.getVeh().split("_").peek().toInt(), ["veh_car1_side"])
	end function

  object.vehWalkUp = function()

    ' if m.game.veh.getColUp() = false
      m.game.map.setOffsetY(m.game.map.getOffsetY() + m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setOffsetY(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getOffsetY(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    ' end if

  end function

  object.vehWalkDown = function()
    ' if m.game.veh.getColDown() = false
      m.game.map.setOffsetY(m.game.map.getOffsetY() - m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setOffsetY(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getOffsetY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    ' end if
  end function

  object.vehWalkLeft = function()
    ' if m.game.veh.getColLeft() = false
      m.game.map.setOffsetX(m.game.map.getOffsetX() + m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setOffsetX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getOffsetX(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    ' end if
  end function

  object.vehWalkRight = function()
    ' if m.game.veh.getColRight() = false
      m.game.map.setOffsetX(m.game.map.getOffsetX() - m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setOffsetX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getOffsetX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    ' end if
  end function

  object.vehAnimWalkUp = function()
		m.animPlay(m.game.char.getVeh().split("_").peek().toInt(), ["veh_car1_back"])
	end function

	object.vehAnimWalkDown = function()
		m.animPlay(m.game.char.getVeh().split("_").peek().toInt(), ["veh_car1_front"])
	end function

	object.vehAnimWalkSide = function()
		m.animPlay(m.game.char.getVeh().split("_").peek().toInt(), ["veh_car1_side"])
	end function

  object.controlUpdate = function()

    for i = 0 to m.game.veh.config.Count() - 1
      if m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()) <> invalid
        
        ' update veh data
        m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).index = m.game.veh.getIndex(i)
        m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).scale_x = m.game.veh.getScaleX(i)
        m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).scale_y = m.game.veh.getScaleY(i)
        m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).offset_x = m.game.veh.getOffsetX(i)
        m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).offset_y = m.game.veh.getOffsetY(i)

      end if

      if m.view_wnd.getCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr()) <> invalid
        m.view_wnd.getCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr()).offset_x = m.game.veh.getOffsetX(i)
        m.view_wnd.getCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr()).offset_y = m.game.veh.getOffsetY(i)
      end if
    end for

  end function
      
end function