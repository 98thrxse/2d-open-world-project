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
    m.npcHPDamage()
    m.controlUpdate()

  end function

  object.onButton = function(code as integer)

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
      m.vehEnter()

    ' released
    else if code = 102 ' up
      if m.game.getFocusGroup() = "veh"
        m.vehAnimIdleUp()
      end if

    else if code = 103 ' down
      if m.game.getFocusGroup() = "veh"
        m.vehAnimIdleDown()       
      end if

    else if code = 104 ' left
      if m.game.getFocusGroup() = "veh"
        m.vehAnimIdleLeft()        
      end if

    else if code = 105 ' right
      if m.game.getFocusGroup() = "veh"
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

  object.npcHPDamage = function()
    if m.game.getFocusGroup() = "veh" and m.game.char.getNPCCol() <> invalid
      if m.game.npc.getHP(m.game.char.getNPCCol().split("_").peek().toInt()) > 0 then m.game.npc.setHP(m.game.char.getNPCCol().split("_").peek().toInt(), 0)
    end if
  end function

  object.vehEnter = function()
    if m.game.getFocusGroup() = "char" and m.game.char.getVehCol() <> invalid
      m.game.setFocusGroup("veh")
      m.game.setFocusTarget("")

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
      m.game.setFocusTarget("")

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
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) > 0.0
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) * m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), - m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.vehTurnDown = function()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) < 0.0
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) * m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), - m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.vehTurnLeft = function()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) > 0.0
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) * m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), - m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.vehTurnRight = function()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) < 0.0
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) * m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), - m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.vehAnimIdleUp = function()
		m.animTimer = invalid
		m.animPlay(m.game.char.getVeh().split("_").peek().toInt(), ["car1_back"])
	end function

	object.vehAnimIdleDown = function()
		m.animTimer = invalid
		m.animPlay(m.game.char.getVeh().split("_").peek().toInt(), ["car1_front"])
	end function

	object.vehAnimIdleLeft = function()
		m.animTimer = invalid
		m.animPlay(m.game.char.getVeh().split("_").peek().toInt(), ["car1_side"])
	end function

	object.vehAnimIdleRight = function()
    m.animTimer = invalid
		m.animPlay(m.game.char.getVeh().split("_").peek().toInt(), ["car1_side"])
	end function

  object.vehWalkUp = function()
    if m.game.char.getColUp() = false
      m.game.map.setOffsetY(m.game.map.getOffsetY() + m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setEntityY(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityY(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setColY(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.vehWalkDown = function()
    if m.game.char.getColDown() = false
      m.game.map.setOffsetY(m.game.map.getOffsetY() - m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setEntityY(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setColY(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.vehWalkLeft = function()
    if m.game.char.getColLeft() = false
      m.game.map.setOffsetX(m.game.map.getOffsetX() + m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setColX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.vehWalkRight = function()
    if m.game.char.getColRight() = false
      m.game.map.setOffsetX(m.game.map.getOffsetX() - m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setColX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.vehAnimWalkUp = function()
		m.animPlay(m.game.char.getVeh().split("_").peek().toInt(), ["car1_back"])
	end function

	object.vehAnimWalkDown = function()
		m.animPlay(m.game.char.getVeh().split("_").peek().toInt(), ["car1_front"])
	end function

	object.vehAnimWalkSide = function()
		m.animPlay(m.game.char.getVeh().split("_").peek().toInt(), ["car1_side"])
	end function

  object.controlUpdate = function()

    for i = 0 to m.game.veh.config.Count() - 1
      if m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()) <> invalid
        
        ' update veh data
        m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).index = m.game.veh.getIndex(i)
        m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).scale_x = m.game.veh.getScaleX(i)
        m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).scale_y = m.game.veh.getScaleY(i)
        m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).offset_x = m.game.veh.getEntityX(i)
        m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).offset_y = m.game.veh.getEntityY(i)
        m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).alpha = m.game.veh.getAlpha(i)

      end if

      if m.view_wnd.getCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr()) <> invalid
        m.view_wnd.getCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr()).offset_x = m.game.veh.getColX(i)
        m.view_wnd.getCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr()).offset_y = m.game.veh.getColY(i)
      end if
      
    end for

  end function
      
end function