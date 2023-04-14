function char_control(object)

  object.onCreate = function(args)

    ' getInstanceByName
		m.view_wnd = m.game.getInstanceByName("char_view")

  end function


  object.savePos = function()

    m.game.char.setEntityX(m.game.screen.GetWidth() / 2 - m.game.map.getOffsetX())
    m.game.char.setEntityY(m.game.screen.GetHeight() / 2 - m.game.map.getOffsetY())

  end function


  object.onUpdate = function(dt as float)

    m.savePos()
    m.charSPRegen()
    m.controlUpdate()

  end function


  object.onButton = function(code as integer)

		' pressed
    if code = 2 ' up
      if m.game.getFocusGroup() = "char"
        m.charTurnUp()
      end if

    else if code = 3 ' down
      if m.game.getFocusGroup() = "char"
        m.charTurnDown()
      end if

    else if code = 4 ' left
      if m.game.getFocusGroup() = "char"
        m.charTurnLeft()
      end if

		else if code = 5 ' right
      if m.game.getFocusGroup() = "char"
        m.charTurnRight()
      end if

    ' released
    ' stas - move to veh
    else if code = 102 ' up
      if m.game.getFocusGroup() = "char" or m.game.getFocusGroup() = "veh"
        m.charIdleUp()
      end if
      if m.game.getFocusGroup() = "char"
        m.charAnimIdleUp()
      end if

    else if code = 103 ' down
      if m.game.getFocusGroup() = "char" or m.game.getFocusGroup() = "veh"
        m.charIdleDown()
      end if
      if m.game.getFocusGroup() = "char"
        m.charAnimIdleDown()       
      end if

    else if code = 104 ' left
      if m.game.getFocusGroup() = "char" or m.game.getFocusGroup() = "veh"
        m.charIdleLeft()
      end if
      if m.game.getFocusGroup() = "char"
        m.charAnimIdleLeft()        
      end if

    else if code = 105 ' right
      if m.game.getFocusGroup() = "char" or m.game.getFocusGroup() = "veh"
        m.charIdleRight()
      end if
      if m.game.getFocusGroup() = "char"
        m.charAnimIdleRight()       
      end if

    else if code = 106 ' select
			if m.game.getFocusGroup() = "char"
				m.charAnimAfterAttack()
			end if

      
    ' held
    else if code = 1002 ' up
      if m.game.getFocusGroup() = "char"
        m.charWalkUp()
        m.charAnimWalkUp()
      end if
                      
    else if code = 1003 ' down
      if m.game.getFocusGroup() = "char"
        m.charWalkDown()  
        m.charAnimWalkDown()    
      end if
        
    else if code = 1004 ' left
      if m.game.getFocusGroup() = "char"
        m.charWalkLeft()
        m.charAnimWalkSide()
      end if
            
    else if code = 1005 ' right
      if m.game.getFocusGroup() = "char"
        m.charWalkRight()
        m.charAnimWalkSide()
      end if

    else if code = 1006 ' select
      if m.game.getFocusGroup() = "char"
        m.charSPDamage()
				m.charAnimAttack()
      end if
      
		end if

	end function

	object.animPlay = function(arr)

		if m.animTimer = invalid
			m.animTimer = CreateObject("roTimeSpan")
			m.animTimer.Mark()
		end if

		arrAnim = []

		for each element in arr
			for i = 0 to m.game.char.config.reg.Count() - 1
				if m.game.char.getRegElement(i) = element then arrAnim.push(i)
			end for
		end for
		
		if m.animTimer.TotalMilliseconds() + 1 >= arrAnim.Count() * m.game.char.getAnimTime() then m.animTimer.Mark()
		m.game.char.setIndex(arrAnim[int(m.animTimer.TotalMilliseconds() / m.game.char.getAnimTime())])


	end function

  object.charAnimAttack = function()
		if m.game.char.getSP() >= m.game.char.getSPDamage()
			if stringUtils().include(m.game.char.getRegElement(m.game.char.getIndex()), "side")
				m.animPlay(["idle_side2", "attack_fist1_side", "attack_fist2_side", "attack_fist3_side", "attack_fist2_side", "attack_fist1_side", "idle_side2", "attack_fist4_side", "attack_fist5_side", "attack_fist6_side", "attack_fist5_side", "attack_fist4_side", "idle_side2", "attack_leg1_side", "attack_leg2_side", "attack_leg3_side", "attack_leg2_side", "attack_leg1_side", "idle_side2"])

			else if stringUtils().include(m.game.char.getRegElement(m.game.char.getIndex()), "front")
				m.animPlay(["idle_front1", "attack_fist1_front", "idle_front1", "attack_fist2_front", "idle_front1", "attack_leg1_front", "idle_front1"])

			else if stringUtils().include(m.game.char.getRegElement(m.game.char.getIndex()), "back")
				m.animPlay(["idle_back1", "attack_fist1_back", "idle_back1", "attack_fist2_back", "idle_back1", "attack_leg1_back", "idle_back1"])

			end if
		else
			m.animPlay(["sp_zero"])
		end if
	end function

	object.charAnimWalkUp = function()
		m.animPlay(["walk_back1", "idle_back1", "walk_back2"])
	end function

	object.charAnimWalkDown = function()
		m.animPlay(["walk_front1", "idle_front1", "walk_front2"])
	end function

	object.charAnimWalkSide = function()
		m.animPlay(["walk_side1", "idle_side1", "walk_side2"])
	end function

	object.charAnimAfterAttack = function()
		if m.game.char.getSP() >= m.game.char.getSPDamage()
			if stringUtils().include(m.game.char.getRegElement(m.game.char.getIndex()), "side")
				m.animPlay(["idle_side2"])
			else if stringUtils().include(m.game.char.getRegElement(m.game.char.getIndex()), "front")
				m.animPlay(["idle_front2"])

			else if stringUtils().include(m.game.char.getRegElement(m.game.char.getIndex()), "back")
				m.animPlay(["idle_back2"])
			end if
		else
			m.animPlay(["sp_zero"])
		end if
	end function

	object.charAnimIdleUp = function()
		m.animTimer = invalid
		m.animPlay(["idle_back1"])
	end function

	object.charAnimIdleDown = function()
		m.animTimer = invalid
		m.animPlay(["idle_front1"])
	end function

	object.charAnimIdleLeft = function()
		m.animTimer = invalid
		m.animPlay(["idle_side1"])
	end function

	object.charAnimIdleRight = function()
    m.animTimer = invalid
		m.animPlay(["idle_side1"])
	end function

  object.controlUpdate = function()

    if m.view_wnd.getImage(m.game.char.getEntityName()) <> invalid

      ' update char data
      m.view_wnd.getImage(m.game.char.getEntityName()).alpha = m.game.char.getAlpha()
      m.view_wnd.getImage(m.game.char.getEntityName()).index = m.game.char.getIndex()
      m.view_wnd.getImage(m.game.char.getEntityName()).scale_x = m.game.char.getScaleX()
      m.view_wnd.getImage(m.game.char.getEntityName()).scale_y = m.game.char.getScaleY()
      m.view_wnd.getImage(m.game.char.getEntityName()).offset_x = m.game.char.getOffsetX()
      m.view_wnd.getImage(m.game.char.getEntityName()).offset_y = m.game.char.getOffsetY()

    end if

    if m.game.getFocusGroup() = "char"
      if m.view_wnd.getCollider(m.game.char.getColUpName().toStr()) <> invalid
        if m.game.char.getScaleX() < 0.0
          m.view_wnd.getCollider(m.game.char.getColUpName().toStr()).offset_x = m.game.char.getOffsetX() - m.game.char.getSizeW() * abs(m.game.char.getScaleX()) + (m.game.char.getUpSpeed() + 1)
        else
          m.view_wnd.getCollider(m.game.char.getColUpName().toStr()).offset_x = m.game.char.getOffsetX() + (m.game.char.getUpSpeed() + 1)
        end if

        m.view_wnd.getCollider(m.game.char.getColUpName().toStr()).offset_y = m.game.char.getOffsetY()
        m.view_wnd.getCollider(m.game.char.getColUpName().toStr()).width = m.game.char.getSizeW() * abs(m.game.char.getScaleX()) - (m.game.char.getUpSpeed() + 1) * 2
        m.view_wnd.getCollider(m.game.char.getColUpName().toStr()).height = m.game.char.getUpSpeed() + 1

      end if

      if m.view_wnd.getCollider(m.game.char.getColDownName().toStr()) <> invalid
        if m.game.char.getScaleX() < 0.0
          m.view_wnd.getCollider(m.game.char.getColDownName().toStr()).offset_x = m.game.char.getOffsetX() - m.game.char.getSizeW() * abs(m.game.char.getScaleX()) + (m.game.char.getDownSpeed() + 1)
        else
          m.view_wnd.getCollider(m.game.char.getColDownName().toStr()).offset_x = m.game.char.getOffsetX() + (m.game.char.getDownSpeed() + 1)
        end if

        m.view_wnd.getCollider(m.game.char.getColDownName().toStr()).offset_y = m.game.char.getOffsetY() + m.game.char.getSizeH() * abs(m.game.char.getScaleY()) - (m.game.char.getDownSpeed() + 1)
        m.view_wnd.getCollider(m.game.char.getColDownName().toStr()).width = m.game.char.getSizeW() * abs(m.game.char.getScaleX()) - (m.game.char.getDownSpeed() + 1) * 2
        m.view_wnd.getCollider(m.game.char.getColDownName().toStr()).height = m.game.char.getDownSpeed() + 1

      end if

      if m.view_wnd.getCollider(m.game.char.getColLeftName().toStr()) <> invalid
        if m.game.char.getScaleX() < 0.0
          m.view_wnd.getCollider(m.game.char.getColLeftName().toStr()).offset_x = m.game.char.getOffsetX() - m.game.char.getSizeW() * abs(m.game.char.getScaleX())
        else
          m.view_wnd.getCollider(m.game.char.getColLeftName().toStr()).offset_x = m.game.char.getOffsetX()
        end if

        m.view_wnd.getCollider(m.game.char.getColLeftName().toStr()).offset_y = m.game.char.getOffsetY() + (m.game.char.getLeftSpeed() + 1)
        m.view_wnd.getCollider(m.game.char.getColLeftName().toStr()).width = m.game.char.getLeftSpeed() + 1
        m.view_wnd.getCollider(m.game.char.getColLeftName().toStr()).height = m.game.char.getSizeH() * abs(m.game.char.getScaleY()) - (m.game.char.getLeftSpeed() + 1) * 2

      end if

      if m.view_wnd.getCollider(m.game.char.getColRightName().toStr()) <> invalid
        if m.game.char.getScaleX() < 0.0
          m.view_wnd.getCollider(m.game.char.getColRightName().toStr()).offset_x = m.game.char.getOffsetX() - (m.game.char.getRightSpeed() + 1)
        else
          m.view_wnd.getCollider(m.game.char.getColRightName().toStr()).offset_x = m.game.char.getOffsetX() + m.game.char.getSizeW() * abs(m.game.char.getScaleX()) - (m.game.char.getRightSpeed() + 1)
        end if

        m.view_wnd.getCollider(m.game.char.getColRightName().toStr()).offset_y = m.game.char.getOffsetY() + (m.game.char.getRightSpeed() + 1)
        m.view_wnd.getCollider(m.game.char.getColRightName().toStr()).width = m.game.char.getRightSpeed() + 1
        m.view_wnd.getCollider(m.game.char.getColRightName().toStr()).height = m.game.char.getSizeH() * abs(m.game.char.getScaleY()) - (m.game.char.getRightSpeed() + 1) * 2

      end if

    ' stas - move to veh
    else if m.game.getFocusGroup() = "veh"
      
      if m.view_wnd.getCollider(m.game.char.getColUpName().toStr()) <> invalid
        m.view_wnd.getCollider(m.game.char.getColUpName().toStr()).offset_x = m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) + (m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) + m.game.map.getOffsetX()
        m.view_wnd.getCollider(m.game.char.getColUpName().toStr()).offset_y = m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.map.getOffsetY()
        m.view_wnd.getCollider(m.game.char.getColUpName().toStr()).width = m.game.veh.getColW(m.game.char.getVeh().split("_").peek().toInt()) * abs(m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt())) - (m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) * 2
        m.view_wnd.getCollider(m.game.char.getColUpName().toStr()).height = m.game.veh.getUpSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1

      end if

      if m.view_wnd.getCollider(m.game.char.getColDownName().toStr()) <> invalid
        m.view_wnd.getCollider(m.game.char.getColDownName().toStr()).offset_x = m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) + (m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) + m.game.map.getOffsetX()
        m.view_wnd.getCollider(m.game.char.getColDownName().toStr()).offset_y = m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getColH(m.game.char.getVeh().split("_").peek().toInt()) * abs(m.game.veh.getScaleY(m.game.char.getVeh().split("_").peek().toInt())) - (m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) + m.game.map.getOffsetY()
        m.view_wnd.getCollider(m.game.char.getColDownName().toStr()).width = m.game.veh.getColW(m.game.char.getVeh().split("_").peek().toInt()) * abs(m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt())) - (m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) * 2
        m.view_wnd.getCollider(m.game.char.getColDownName().toStr()).height = m.game.veh.getDownSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1

      end if

      if m.view_wnd.getCollider(m.game.char.getColLeftName().toStr()) <> invalid
        m.view_wnd.getCollider(m.game.char.getColLeftName().toStr()).offset_x = m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.map.getOffsetX()
        m.view_wnd.getCollider(m.game.char.getColLeftName().toStr()).offset_y = m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) + (m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) + m.game.map.getOffsetY()
        m.view_wnd.getCollider(m.game.char.getColLeftName().toStr()).width = m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1
        m.view_wnd.getCollider(m.game.char.getColLeftName().toStr()).height = m.game.veh.getColH(m.game.char.getVeh().split("_").peek().toInt()) * abs(m.game.veh.getScaleY(m.game.char.getVeh().split("_").peek().toInt())) - (m.game.veh.getLeftSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) * 2

      end if

      if m.view_wnd.getCollider(m.game.char.getColRightName().toStr()) <> invalid
        m.view_wnd.getCollider(m.game.char.getColRightName().toStr()).offset_x = m.game.veh.getColX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getColW(m.game.char.getVeh().split("_").peek().toInt()) * abs(m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt())) - (m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) + m.game.map.getOffsetX()
        m.view_wnd.getCollider(m.game.char.getColRightName().toStr()).offset_y = m.game.veh.getColY(m.game.char.getVeh().split("_").peek().toInt()) + (m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) + m.game.map.getOffsetY()
        m.view_wnd.getCollider(m.game.char.getColRightName().toStr()).width = m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1
        m.view_wnd.getCollider(m.game.char.getColRightName().toStr()).height = m.game.veh.getColH(m.game.char.getVeh().split("_").peek().toInt()) * abs(m.game.veh.getScaleY(m.game.char.getVeh().split("_").peek().toInt())) - (m.game.veh.getRightSpeed(m.game.char.getVeh().split("_").peek().toInt()) + 1) * 2

      end if
    end if
      
  end function

  object.charTurnUp = function()
    if m.game.char.getScaleX() > 0.0
      m.game.char.setOffsetX(m.game.char.getOffsetX() + m.game.char.getSizeW() * m.game.char.getScaleX())
      m.game.char.setScaleX(- m.game.char.getScaleX())
    end if
  end function

  object.charTurnDown = function()
    if m.game.char.getScaleX() < 0.0
      m.game.char.setOffsetX(m.game.char.getOffsetX() + m.game.char.getSizeW() * m.game.char.getScaleX())
      m.game.char.setScaleX(- m.game.char.getScaleX())
    end if
  end function

  object.charTurnLeft = function()
    if m.game.char.getScaleX() > 0.0
      m.game.char.setOffsetX(m.game.char.getOffsetX() + m.game.char.getSizeW() * m.game.char.getScaleX())
      m.game.char.setScaleX(- m.game.char.getScaleX())
    end if
  end function

  object.charTurnRight = function()
    if m.game.char.getScaleX() < 0.0
      m.game.char.setOffsetX(m.game.char.getOffsetX() + m.game.char.getSizeW() * m.game.char.getScaleX())
      m.game.char.setScaleX(- m.game.char.getScaleX())
    end if
  end function

  object.charIdleUp = function()
    m.game.char.setNPCCol(invalid)
    m.game.char.setMarkerCol(invalid)
    m.game.char.setVehCol(invalid)
    m.game.char.setColDown(false)
    m.game.char.setColLeft(false)
    m.game.char.setColRight(false)
  end function

  object.charIdleDown = function()
    m.game.char.setNPCCol(invalid)
    m.game.char.setMarkerCol(invalid)
    m.game.char.setVehCol(invalid)
    m.game.char.setColUp(false)
    m.game.char.setColLeft(false)
    m.game.char.setColRight(false)
  end function

  object.charIdleLeft = function()
    m.game.char.setNPCCol(invalid)
    m.game.char.setMarkerCol(invalid)
    m.game.char.setVehCol(invalid)
    m.game.char.setColUp(false)
    m.game.char.setColDown(false)
    m.game.char.setColRight(false)
  end function

  object.charIdleRight = function()
    m.game.char.setNPCCol(invalid)
    m.game.char.setMarkerCol(invalid)
    m.game.char.setVehCol(invalid)
    m.game.char.setColUp(false)
    m.game.char.setColDown(false)
    m.game.char.setColLeft(false)
  end function

  object.charWalkUp = function()
    if m.game.char.getColUp() = false
      m.game.map.setOffsetY(m.game.map.getOffsetY() + m.game.char.getUpSpeed())
    end if
  end function

  object.charWalkDown = function()
    if m.game.char.getColDown() = false
      m.game.map.setOffsetY(m.game.map.getOffsetY() - m.game.char.getDownSpeed())
    end if
  end function

  object.charWalkLeft = function()
    if m.game.char.getColLeft() = false
      m.game.map.setOffsetX(m.game.map.getOffsetX() + m.game.char.getLeftSpeed())
    end if
  end function

  object.charWalkRight = function()
    if m.game.char.getColRight() = false
      m.game.map.setOffsetX(m.game.map.getOffsetX() - m.game.char.getRightSpeed())
    end if
  end function

  object.charSPDamage = function()
    if m.game.char.getSP() >= m.game.char.getSPDamage() and m.game.char.getRegElement(m.game.char.getIndex()) <> "sp_zero"

      if m.sp_damage_timer = invalid
        m.game.char.setSP(m.game.char.getSP() - m.game.char.getSPDamage())
        m.sp_damage_timer = CreateObject("roTimeSpan")
        m.sp_damage_timer.Mark()
      end if

      if m.sp_damage_timer.TotalMilliseconds() + 1 >= m.game.char.getSPDamageTime()
        m.sp_damage_timer = invalid
      end if

    end if

  end function

  object.charSPRegen = function()

    if m.game.char.getSP() < 100
      if m.sp_regen_timer = invalid
        m.sp_regen_timer = CreateObject("roTimeSpan")
        m.sp_regen_timer.Mark()
      end if

      if m.sp_regen_timer.TotalMilliseconds() + 1 >= m.game.char.getSPRegenTime()
        m.game.char.setSP(m.game.char.getSP() + m.game.char.getSPRegen())
        m.sp_regen_timer = invalid
      end if
    end if

  end function
    
end function