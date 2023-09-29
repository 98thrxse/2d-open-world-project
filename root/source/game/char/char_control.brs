sub char_control(object)

  object.onCreate = sub(args as object)
    ' getInstanceByName
		m.view_wnd = m.game.getInstanceByName("char_view")

  end sub

  object.savePos = sub()

    m.game.char.setEntityX(m.game.screen.GetWidth() / 2 - m.game.map.getOffsetX())
    m.game.char.setEntityY(m.game.screen.GetHeight() / 2 - m.game.map.getOffsetY())

  end sub


  object.onUpdate = sub(dt as float)

    m.regenSP()
    m.updateView()

  end sub


  object.onButton = sub(code as integer)

		' pressed
    if code = 2 ' up
      if m.game.getFocusGroup() = "char"
        m.turnUp()
      end if

    else if code = 3 ' down
      if m.game.getFocusGroup() = "char"
        m.turnDown()
      end if

    else if code = 4 ' left
      if m.game.getFocusGroup() = "char"
        m.turnLeft()
      end if

		else if code = 5 ' right
      if m.game.getFocusGroup() = "char"
        m.turnRight()
      end if

    ' released
    else if code = 102 ' up
      if m.game.getFocusGroup() = "char"
        m.idleUp()
        m.idleUpAnim()
      end if

    else if code = 103 ' down
      if m.game.getFocusGroup() = "char"
        m.idleDown()
        m.idleDownAnim() 
      end if

    else if code = 104 ' left
      if m.game.getFocusGroup() = "char"
        m.idleLeft()
        m.idleLeftAnim()
      end if

    else if code = 105 ' right
      if m.game.getFocusGroup() = "char"
        m.idleRight()
        m.idleRightAnim()
      end if

    else if code = 106 ' select
			if m.game.getFocusGroup() = "char"
				m.afterAttackAnim()
			end if

      
    ' held
    else if code = 1002 ' up
      if m.game.getFocusGroup() = "char"
        m.walkUp()
        m.walkUpAnim()
        m.savePos()
      end if
                      
    else if code = 1003 ' down
      if m.game.getFocusGroup() = "char"
        m.walkDown()  
        m.walkDownAnim()    
        m.savePos()
      end if
        
    else if code = 1004 ' left
      if m.game.getFocusGroup() = "char"
        m.walkLeft()
        m.walkSideAnim()
        m.savePos()
      end if
            
    else if code = 1005 ' right
      if m.game.getFocusGroup() = "char"
        m.walkRight()
        m.walkSideAnim()
        m.savePos()
      end if

    else if code = 1006 ' select
      if m.game.getFocusGroup() = "char"
        m.damageSP()
				m.attackAnim()
      end if
      
		end if

	end sub

	object.playAnim = sub(arr as object)

		if m.animTimer = invalid
			m.animTimer = CreateObject("roTimeSpan")
			m.animTimer.Mark()
		end if

		arrAnim = []

		for each anim in arr
			for i = 0 to m.game.char.config.reg.Count() - 1
        ' char_1 is temp hardcoded skin - stas
				if m.game.char.getRegElement(i) = "char1" + anim then arrAnim.push(i)
			end for
		end for
		
		if m.animTimer.TotalMilliseconds() + 1 >= arrAnim.Count() * m.game.char.getAnimTime() then m.animTimer.Mark()
		m.game.char.setIndex(arrAnim[int(m.animTimer.TotalMilliseconds() / m.game.char.getAnimTime())])


	end sub

  object.attackAnim = sub()
		if m.game.char.getSP() >= m.game.char.getSPDamage()
			if stringUtils().includes(m.game.char.getRegElement(m.game.char.getIndex()), "_side")
				m.playAnim(["_idle_side2", "_attack_fist1_side", "_attack_fist2_side", "_attack_fist3_side", "_attack_fist2_side", "_attack_fist1_side", "_idle_side2", "_attack_fist4_side", "_attack_fist5_side", "_attack_fist6_side", "_attack_fist5_side", "_attack_fist4_side", "_idle_side2", "_attack_leg1_side", "_attack_leg2_side", "_attack_leg3_side", "_attack_leg2_side", "_attack_leg1_side", "_idle_side2"])

			else if stringUtils().includes(m.game.char.getRegElement(m.game.char.getIndex()), "_front")
				m.playAnim(["_idle_front1", "_attack_fist1_front", "_idle_front1", "_attack_fist2_front", "_idle_front1", "_attack_leg1_front", "_idle_front1"])

			else if stringUtils().includes(m.game.char.getRegElement(m.game.char.getIndex()), "_back")
				m.playAnim(["_idle_back1", "_attack_fist1_back", "_idle_back1", "_attack_fist2_back", "_idle_back1", "_attack_leg1_back", "_idle_back1"])

			end if
		else
			m.playAnim(["_sp_zero"])
		end if
	end sub

	object.walkUpAnim = sub()
		m.playAnim(["_walk_back1", "_idle_back1", "_walk_back2"])
	end sub

	object.walkDownAnim = sub()
		m.playAnim(["_walk_front1", "_idle_front1", "_walk_front2"])
	end sub

	object.walkSideAnim = sub()
		m.playAnim(["_walk_side1", "_idle_side1", "_walk_side2"])
	end sub

	object.afterAttackAnim = sub()
		if m.game.char.getSP() >= m.game.char.getSPDamage()
			if stringUtils().includes(m.game.char.getRegElement(m.game.char.getIndex()), "_side")
				m.playAnim(["_idle_side2"])
			else if stringUtils().includes(m.game.char.getRegElement(m.game.char.getIndex()), "_front")
				m.playAnim(["_idle_front2"])

			else if stringUtils().includes(m.game.char.getRegElement(m.game.char.getIndex()), "_back")
				m.playAnim(["_idle_back2"])
			end if
		else
			m.playAnim(["_sp_zero"])
		end if
	end sub

	object.idleUpAnim = sub()
		m.animTimer = invalid
		m.playAnim(["_idle_back1"])
	end sub

	object.idleDownAnim = sub()
		m.animTimer = invalid
		m.playAnim(["_idle_front1"])
	end sub

	object.idleLeftAnim = sub()
		m.animTimer = invalid
		m.playAnim(["_idle_side1"])
	end sub

	object.idleRightAnim = sub()
    m.animTimer = invalid
		m.playAnim(["_idle_side1"])
	end sub

  object.updateView = sub()

    if m.view_wnd.getImage(m.game.char.getEntityName()) <> invalid

      ' update char data
      m.view_wnd.getImage(m.game.char.getEntityName()).alpha = m.game.char.getAlpha()
      m.view_wnd.getImage(m.game.char.getEntityName()).index = m.game.char.getIndex()
      m.view_wnd.getImage(m.game.char.getEntityName()).scale_x = m.game.char.getScaleX()
      m.view_wnd.getImage(m.game.char.getEntityName()).scale_y = m.game.char.getScaleY()
      m.view_wnd.getImage(m.game.char.getEntityName()).offset_x = m.game.char.getOffsetX()
      m.view_wnd.getImage(m.game.char.getEntityName()).offset_y = m.game.char.getOffsetY()

    end if

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
      
  end sub

  object.turnUp = sub()
    if m.game.char.getScaleX() > 0.0
      m.game.char.setOffsetX(m.game.char.getOffsetX() + m.game.char.getSizeW() * m.game.char.getScaleX())
      m.game.char.setScaleX(- m.game.char.getScaleX())
    end if
  end sub

  object.turnDown = sub()
    if m.game.char.getScaleX() < 0.0
      m.game.char.setOffsetX(m.game.char.getOffsetX() + m.game.char.getSizeW() * m.game.char.getScaleX())
      m.game.char.setScaleX(- m.game.char.getScaleX())
    end if
  end sub

  object.turnLeft = sub()
    if m.game.char.getScaleX() > 0.0
      m.game.char.setOffsetX(m.game.char.getOffsetX() + m.game.char.getSizeW() * m.game.char.getScaleX())
      m.game.char.setScaleX(- m.game.char.getScaleX())
    end if
  end sub

  object.turnRight = sub()
    if m.game.char.getScaleX() < 0.0
      m.game.char.setOffsetX(m.game.char.getOffsetX() + m.game.char.getSizeW() * m.game.char.getScaleX())
      m.game.char.setScaleX(- m.game.char.getScaleX())
    end if
  end sub

  object.idleUp = sub()
    m.game.char.setNPCCol(invalid)
    m.game.char.setMarkerCol(invalid)
    m.game.char.setVehCol(invalid)
    m.game.char.setColDown(false)
    m.game.char.setColLeft(false)
    m.game.char.setColRight(false)
  end sub

  object.idleDown = sub()
    m.game.char.setNPCCol(invalid)
    m.game.char.setMarkerCol(invalid)
    m.game.char.setVehCol(invalid)
    m.game.char.setColUp(false)
    m.game.char.setColLeft(false)
    m.game.char.setColRight(false)
  end sub

  object.idleLeft = sub()
    m.game.char.setNPCCol(invalid)
    m.game.char.setMarkerCol(invalid)
    m.game.char.setVehCol(invalid)
    m.game.char.setColUp(false)
    m.game.char.setColDown(false)
    m.game.char.setColRight(false)
  end sub

  object.idleRight = sub()
    m.game.char.setNPCCol(invalid)
    m.game.char.setMarkerCol(invalid)
    m.game.char.setVehCol(invalid)
    m.game.char.setColUp(false)
    m.game.char.setColDown(false)
    m.game.char.setColLeft(false)
  end sub

  object.walkUp = sub()
    if m.game.char.getColUp() = false
      m.game.map.setOffsetY(m.game.map.getOffsetY() + m.game.char.getUpSpeed())
    end if
  end sub

  object.walkDown = sub()
    if m.game.char.getColDown() = false
      m.game.map.setOffsetY(m.game.map.getOffsetY() - m.game.char.getDownSpeed())
    end if
  end sub

  object.walkLeft = sub()
    if m.game.char.getColLeft() = false
      m.game.map.setOffsetX(m.game.map.getOffsetX() + m.game.char.getLeftSpeed())
    end if
  end sub

  object.walkRight = sub()
    if m.game.char.getColRight() = false
      m.game.map.setOffsetX(m.game.map.getOffsetX() - m.game.char.getRightSpeed())
    end if
  end sub

  object.damageSP = sub()
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

  end sub

  object.regenSP = sub()

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

  end sub
    
end sub