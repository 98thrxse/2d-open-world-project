sub veh_control(object)

  object.onCreate = sub(args as object)

    ' getInstanceByName
    m.view_wnd = m.game.getInstanceByName("veh_view")

  end sub

  object.updatePos = sub()

    ' entity position
    m.view_wnd.x = m.game.map.getOffsetX()
    m.view_wnd.y = m.game.map.getOffsetY()

  end sub

  object.savePos = sub()

    m.game.char.setEntityX(m.game.screen.GetWidth() / 2 - m.game.map.getOffsetX())
    m.game.char.setEntityY(m.game.screen.GetHeight() / 2 - m.game.map.getOffsetY())

  end sub

  object.onUpdate = sub(dt as float)

    m.updatePos()
    m.updateView()

  end sub

  object.onButton = sub(code as integer)

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
        m.driveUp()
        m.driveUpAnim()
        m.savePos()
      end if
                      
    else if code = 1003 ' down
      if m.game.getFocusGroup() = "veh"
        m.driveDown()  
        m.driveDownAnim()
        m.savePos()    
      end if
        
    else if code = 1004 ' left
      if m.game.getFocusGroup() = "veh"
        m.driveLeft()
        m.driveSideAnim()
        m.savePos()
      end if
            
    else if code = 1005 ' right
      if m.game.getFocusGroup() = "veh"
        m.driveRight()
        m.driveSideAnim()
        m.savePos()
      end if
      
    end if

  end sub

	object.playAnim = sub(i as integer, arr as object)

		if m.timer = invalid
			m.timer = CreateObject("roTimeSpan")
			m.timer.Mark()
		end if

		arrAnim = []

		for each anim in arr
			for j = 0 to m.game.veh.config[i].reg.Count() - 1
				if m.game.veh.getRegElement(i, j) = anim then arrAnim.push(j)
			end for
		end for
		
		if m.timer.TotalMilliseconds() + 1 >= arrAnim.Count() * m.game.veh.getAnimTime(i) then m.timer.Mark()
		m.game.veh.setIndex(i, arrAnim[int(m.timer.TotalMilliseconds() / m.game.veh.getAnimTime(i))])

	end sub

	object.getAnim = function(i as integer, arr as object)
    anims = []
    for each find in arr
      for each anim in m.game.veh.getReg(i)
        if stringUtils().includes(anim, find)
          anims.push(anim)
        end if
      end for
    end for

    return anims
  end function

  object.turnUp = sub()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) > 0.0 and not stringUtils().includes(m.game.veh.getRegElement(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getIndex(m.game.char.getVeh().split("_").peek().toInt())), "_idle_front")
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) * m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), - m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end sub

  object.turnDown = sub()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) < 0.0 and not stringUtils().includes(m.game.veh.getRegElement(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getIndex(m.game.char.getVeh().split("_").peek().toInt())), "_idle_back")
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) * m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), - m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end sub

  object.turnLeft = sub()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) > 0.0 and not stringUtils().includes(m.game.veh.getRegElement(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getIndex(m.game.char.getVeh().split("_").peek().toInt())), "_idle_side")
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) * m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), - m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end sub

  object.turnRight = sub()
    if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) < 0.0 and not stringUtils().includes(m.game.veh.getRegElement(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getIndex(m.game.char.getVeh().split("_").peek().toInt())), "_idle_side")
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityW(m.game.char.getVeh().split("_").peek().toInt()) * m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setScaleX(m.game.char.getVeh().split("_").peek().toInt(), - m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end sub

  object.idleUpAnim = sub()
		m.animTimer = invalid
    if not stringUtils().includes(m.game.veh.getRegElement(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getIndex(m.game.char.getVeh().split("_").peek().toInt())), "_idle_front")
		  m.playAnim(m.game.char.getVeh().split("_").peek().toInt(), m.getAnim(m.game.char.getVeh().split("_").peek().toInt(), ["_idle_back"]))
    end if
	end sub

	object.idleDownAnim = sub()
		m.animTimer = invalid
    if not stringUtils().includes(m.game.veh.getRegElement(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getIndex(m.game.char.getVeh().split("_").peek().toInt())), "_idle_back")
		  m.playAnim(m.game.char.getVeh().split("_").peek().toInt(), m.getAnim(m.game.char.getVeh().split("_").peek().toInt(), ["_idle_front"]))
    end if
	end sub

	object.idleLeftAnim = sub()
		m.animTimer = invalid
		m.playAnim(m.game.char.getVeh().split("_").peek().toInt(), m.getAnim(m.game.char.getVeh().split("_").peek().toInt(), ["_idle_side"]))
	end sub

	object.idleRightAnim = sub()
    m.animTimer = invalid
		m.playAnim(m.game.char.getVeh().split("_").peek().toInt(), m.getAnim(m.game.char.getVeh().split("_").peek().toInt(), ["_idle_side"]))
	end sub

  object.idleUp = sub()
    m.game.veh.setNPCCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setMarkerCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setVehCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setColDown(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColLeft(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColRight(m.game.char.getVeh().split("_").peek().toInt(), false)
  end sub

  object.idleDown = sub()
    m.game.veh.setNPCCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setMarkerCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setVehCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setColUp(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColLeft(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColRight(m.game.char.getVeh().split("_").peek().toInt(), false)
  end sub

  object.idleLeft = sub()
    m.game.veh.setNPCCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setMarkerCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setVehCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setColUp(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColDown(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColRight(m.game.char.getVeh().split("_").peek().toInt(), false)
  end sub

  object.idleRight = sub()
    m.game.veh.setNPCCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setMarkerCol(m.game.char.getVeh().split("_").peek().toInt(), invalid)
    m.game.veh.setColUp(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColDown(m.game.char.getVeh().split("_").peek().toInt(), false)
    m.game.veh.setColLeft(m.game.char.getVeh().split("_").peek().toInt(), false)
  end sub

  object.driveUp = sub()
    if m.game.veh.getColUp(m.game.char.getVeh().split("_").peek().toInt()) = false
      m.game.map.setOffsetY(m.game.map.getOffsetY() + m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setEntityY(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityY(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setColY(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end sub

  object.driveDown = sub()
    if m.game.veh.getColDown(m.game.char.getVeh().split("_").peek().toInt()) = false
      m.game.map.setOffsetY(m.game.map.getOffsetY() - m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setEntityY(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setColY(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end sub

  object.driveLeft = sub()
    if m.game.veh.getColLeft(m.game.char.getVeh().split("_").peek().toInt()) = false
      m.game.map.setOffsetX(m.game.map.getOffsetX() + m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setColX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end sub

  object.driveRight = sub()
    if m.game.veh.getColRight(m.game.char.getVeh().split("_").peek().toInt()) = false
      m.game.map.setOffsetX(m.game.map.getOffsetX() - m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setEntityX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()))
      m.game.veh.setColX(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()))
    end if
  end sub

  object.driveUpAnim = sub()
    if not stringUtils().includes(m.game.veh.getRegElement(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getIndex(m.game.char.getVeh().split("_").peek().toInt())), "_idle_front")
		  m.playAnim(m.game.char.getVeh().split("_").peek().toInt(), m.getAnim(m.game.char.getVeh().split("_").peek().toInt(), ["_idle_back"]))
    end if
	end sub

	object.driveDownAnim = sub()
    if not stringUtils().includes(m.game.veh.getRegElement(m.game.char.getVeh().split("_").peek().toInt(), m.game.veh.getIndex(m.game.char.getVeh().split("_").peek().toInt())), "_idle_back")
		  m.playAnim(m.game.char.getVeh().split("_").peek().toInt(), m.getAnim(m.game.char.getVeh().split("_").peek().toInt(), ["_idle_front"]))
    end if
	end sub

	object.driveSideAnim = sub()
		m.playAnim(m.game.char.getVeh().split("_").peek().toInt(), m.getAnim(m.game.char.getVeh().split("_").peek().toInt(), ["_idle_side"]))
	end sub

  object.updateView = sub()

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

  end sub
      
end sub