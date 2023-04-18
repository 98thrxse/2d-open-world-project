function veh_control(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.view_wnd = m.game.getInstanceByName("veh_view")

  end function

  object.updatePos = function()

    ' entity position
    m.view_wnd.x = m.game.map.getOffsetX()
    m.view_wnd.y = m.game.map.getOffsetY()

  end function

  object.savePos = function()

    m.game.char.setEntityX(m.game.screen.GetWidth() / 2 - m.game.map.getOffsetX())
    m.game.char.setEntityY(m.game.screen.GetHeight() / 2 - m.game.map.getOffsetY())

  end function

  object.onUpdate = function(dt as float)

    m.updatePos()
    m.updateView()

  end function

  object.onButton = function(code as integer)

    ' pressed
    if code = 2 ' up
      if m.game.getFocusGroup() = "veh"
        m.turnUp()
      end if

    else if code = 3 ' down
      if m.game.getFocusGroup() = "veh"
        m.turnDown()
      end if

    else if code = 4 ' left
      if m.game.getFocusGroup() = "veh"
        m.turnLeft()
      end if

    else if code = 5 ' right
      if m.game.getFocusGroup() = "veh"
        m.turnRight()
      end if

    else if code = 13 ' play
      m.focusChange()

    ' released
    else if code = 102 ' up
      if m.game.getFocusGroup() = "veh"
        m.idleUp()
        m.idleUpAnim()
      end if

    else if code = 103 ' down
      if m.game.getFocusGroup() = "veh"
        m.idleDown()
        m.idleDownAnim()       
      end if

    else if code = 104 ' left
      if m.game.getFocusGroup() = "veh"
        m.idleLeft()
        m.idleLeftAnim()        
      end if

    else if code = 105 ' right
      if m.game.getFocusGroup() = "veh"
        m.idleRight()
        m.idleRightAnim()       
      end if

    ' held
    else if code = 1002 ' up
      if m.game.getFocusGroup() = "veh"
        m.walkUp()
        m.walkUpAnim()
        m.savePos()
      end if
                      
    else if code = 1003 ' down
      if m.game.getFocusGroup() = "veh"
        m.walkDown()  
        m.walkDownAnim()
        m.savePos()    
      end if
        
    else if code = 1004 ' left
      if m.game.getFocusGroup() = "veh"
        m.walkLeft()
        m.walkSideAnim()
        m.savePos()
      end if
            
    else if code = 1005 ' right
      if m.game.getFocusGroup() = "veh"
        m.walkRight()
        m.walkSideAnim()
        m.savePos()
      end if
      
    end if

  end function

  object.focusChange = function()
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

	object.playAnim = function(i, arr)

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

  object.turnUp = function()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) > 0.0
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) * m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), - m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.turnDown = function()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) < 0.0
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) * m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), - m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.turnLeft = function()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) > 0.0
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) * m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), - m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.turnRight = function()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) < 0.0
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) * m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), - m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.idleUpAnim = function()
		m.animTimer = invalid
		m.playAnim(m.game.char.getVeh().split("_").peek().toInt(), ["car1_back"])
	end function

	object.idleDownAnim = function()
		m.animTimer = invalid
		m.playAnim(m.game.char.getVeh().split("_").peek().toInt(), ["car1_front"])
	end function

	object.idleLeftAnim = function()
		m.animTimer = invalid
		m.playAnim(m.game.char.getVeh().split("_").peek().toInt(), ["car1_side"])
	end function

	object.idleRightAnim = function()
    m.animTimer = invalid
		m.playAnim(m.game.char.getVeh().split("_").peek().toInt(), ["car1_side"])
	end function

  object.idleUp = function()
    m.game.veh.setNPCCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setMarkerCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setVehCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setColDown(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColLeft(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColRight(m.game.char.getVeh().split("_").peek().toInt(), false)
  end function

  object.idleDown = function()
    m.game.veh.setNPCCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setMarkerCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setVehCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setColUp(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColLeft(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColRight(m.game.char.getVeh().split("_").peek().toInt(), false)
  end function

  object.idleLeft = function()
    m.game.veh.setNPCCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setMarkerCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setVehCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setColUp(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColDown(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColRight(m.game.char.getVeh().split("_").peek().toInt(), false)
  end function

  object.idleRight = function()
    m.game.veh.setNPCCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setMarkerCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setColUp(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColDown(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColLeft(m.game.char.getVeh().split("_").peek().toInt(), false)
  end function

  object.walkUp = function()
    if m.game.veh.getColUp(m.game.char.getVeh().split("_").peek().toInt()) = false
      m.game.map.setOffsetY(m.game.map.getOffsetY() + m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setEntityY(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityY(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setColY(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.walkDown = function()
    if m.game.veh.getColDown(m.game.char.getVeh().split("_").peek().toInt()) = false
      m.game.map.setOffsetY(m.game.map.getOffsetY() - m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setEntityY(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setColY(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.walkLeft = function()
    if m.game.veh.getColLeft(m.game.char.getVeh().split("_").peek().toInt()) = false
      m.game.map.setOffsetX(m.game.map.getOffsetX() + m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setColX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.walkRight = function()
    if m.game.veh.getColRight(m.game.char.getVeh().split("_").peek().toInt()) = false
      m.game.map.setOffsetX(m.game.map.getOffsetX() - m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setColX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end function

  object.walkUpAnim = function()
		m.playAnim(m.game.char.getVeh().split("_").peek().toInt(), ["car1_back"])
	end function

	object.walkDownAnim = function()
		m.playAnim(m.game.char.getVeh().split("_").peek().toInt(), ["car1_front"])
	end function

	object.walkSideAnim = function()
		m.playAnim(m.game.char.getVeh().split("_").peek().toInt(), ["car1_side"])
	end function

  object.updateView = function()

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

    if m.game.getFocusGroup() = "veh"

      if m.view_wnd.getCollider(m.game.veh.getColUpName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()) <> invalid
        m.view_wnd.getCollider(m.game.veh.getColUpName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).offset_x = m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) + (m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1)
        m.view_wnd.getCollider(m.game.veh.getColUpName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).offset_y = m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt())
        m.view_wnd.getCollider(m.game.veh.getColUpName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).width = m.game.veh.getColW(m.game.char.getVeh().split("_").peek().toInt()) * abs(m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt())) - (m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) * 2
        m.view_wnd.getCollider(m.game.veh.getColUpName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).height = m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1

      end if

      if m.view_wnd.getCollider(m.game.veh.getColDownName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()) <> invalid
        m.view_wnd.getCollider(m.game.veh.getColDownName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).offset_x = m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) + (m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1)
        m.view_wnd.getCollider(m.game.veh.getColDownName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).offset_y = m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getColH(m.game.char.getVeh().split("_").peek().toInt()) * abs(m.game.veh.getScaleY(m.game.char.getVeh().split("_").peek().toInt())) - (m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1)
        m.view_wnd.getCollider(m.game.veh.getColDownName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).width = m.game.veh.getColW(m.game.char.getVeh().split("_").peek().toInt()) * abs(m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt())) - (m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) * 2
        m.view_wnd.getCollider(m.game.veh.getColDownName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).height = m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1

      end if

      if m.view_wnd.getCollider(m.game.veh.getColLeftName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()) <> invalid
        m.view_wnd.getCollider(m.game.veh.getColLeftName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).offset_x = m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt())
        m.view_wnd.getCollider(m.game.veh.getColLeftName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).offset_y = m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) + (m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1)
        m.view_wnd.getCollider(m.game.veh.getColLeftName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).width = m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1
        m.view_wnd.getCollider(m.game.veh.getColLeftName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).height = m.game.veh.getColH(m.game.char.getVeh().split("_").peek().toInt()) * abs(m.game.veh.getScaleY(m.game.char.getVeh().split("_").peek().toInt())) - (m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) * 2

      end if

      if m.view_wnd.getCollider(m.game.veh.getColRightName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()) <> invalid
        m.view_wnd.getCollider(m.game.veh.getColRightName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).offset_x = m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getColW(m.game.char.getVeh().split("_").peek().toInt()) * abs(m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt())) - (m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1)
        m.view_wnd.getCollider(m.game.veh.getColRightName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).offset_y = m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) + (m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1)
        m.view_wnd.getCollider(m.game.veh.getColRightName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).width = m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1
        m.view_wnd.getCollider(m.game.veh.getColRightName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()).height = m.game.veh.getColH(m.game.char.getVeh().split("_").peek().toInt()) * abs(m.game.veh.getScaleY(m.game.char.getVeh().split("_").peek().toInt())) - (m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) * 2

      end if
    end if

  end function
      
end function