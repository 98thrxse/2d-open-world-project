function char_control(object)

  object.onCreate = function(args)

    ' getInstanceByName
		m.view_wnd = m.game.getInstanceByName("char_view")

  end function


  object.savePos = function()

    m.game.char.setEntityPosX(m.game.screen.GetWidth() / 2 - m.game.map.getEntityOffsetX())
    m.game.char.setEntityPosY(m.game.screen.GetHeight() / 2 - m.game.map.getEntityOffsetY())

  end function


  object.onUpdate = function(dt as float)

    m.savePos()
    m.charSPRegen()
    m.animUpdate()

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
    else if code = 102 ' up
      if m.game.getFocusGroup() = "char"
        m.charIdleUp()      
        m.charAnimIdleUp()
      end if

    else if code = 103 ' down
      if m.game.getFocusGroup() = "char"
        m.charIdleDown() 
        m.charAnimIdleDown()       
      end if

    else if code = 104 ' left
      if m.game.getFocusGroup() = "char"
        m.charIdleLeft()
        m.charAnimIdleLeft()        
      end if

    else if code = 105 ' right
      if m.game.getFocusGroup() = "char"
        m.charIdleRight() 
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
        m.npcHPDamage()
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
			for i = 0 to m.game.char.config.entity.reg.Count() - 1
				if m.game.char.getRegElement(i) = element then arrAnim.push(i)
			end for
		end for
		
		if m.animTimer.TotalMilliseconds() + 1 >= arrAnim.Count() * m.game.char.getAnimTime() then m.animTimer.Mark()
		m.game.char.setIndex(arrAnim[int(m.animTimer.TotalMilliseconds() / m.game.char.getAnimTime())])


	end function

  object.charAnimAttack = function()
		if m.game.char.getSP() >= m.game.char.getSPDamage()
			if stringUtils().include(m.game.char.getRegElement(m.game.char.getIndex()), "side")
				m.animPlay(["stand_side2", "attack_fist1_side", "attack_fist2_side", "attack_fist3_side", "attack_fist2_side", "attack_fist1_side", "stand_side2", "attack_fist4_side", "attack_fist5_side", "attack_fist6_side", "attack_fist5_side", "attack_fist4_side", "stand_side2", "attack_leg1_side", "attack_leg2_side", "attack_leg3_side", "attack_leg2_side", "attack_leg1_side", "stand_side2"])
			
			else if stringUtils().include(m.game.char.getRegElement(m.game.char.getIndex()), "front")
				m.animPlay(["stand_front1", "attack_fist1_front", "stand_front1", "attack_fist2_front", "stand_front1", "attack_leg1_front", "stand_front1"])

			else if stringUtils().include(m.game.char.getRegElement(m.game.char.getIndex()), "back")
				m.animPlay(["stand_back1", "attack_fist1_back", "stand_back1", "attack_fist2_back", "stand_back1", "attack_leg1_back", "stand_back1"])

			end if
		else
			m.animPlay(["sp_zero"])
		end if
	end function

	object.charAnimWalkUp = function()
		m.animPlay(["walk_back1", "stand_back1", "walk_back2"])
	end function

	object.charAnimWalkDown = function()
		m.animPlay(["walk_front1", "stand_front1", "walk_front2"])
	end function

	object.charAnimWalkSide = function()
		m.animPlay(["walk_side1", "stand_side1", "walk_side2"])
	end function

	object.charAnimAfterAttack = function()
		if m.game.char.getSP() >= m.game.char.getSPDamage()
			if stringUtils().include(m.game.char.getRegElement(m.game.char.getIndex()), "side")
				m.animPlay(["stand_side2"])
			else if stringUtils().include(m.game.char.getRegElement(m.game.char.getIndex()), "front")
				m.animPlay(["stand_front2"])

			else if stringUtils().include(m.game.char.getRegElement(m.game.char.getIndex()), "back")
				m.animPlay(["stand_back2"])
			end if
		else
			m.animPlay(["sp_zero"])
		end if
	end function

	object.charAnimIdleUp = function()
		m.animTimer = invalid
		m.animPlay(["stand_back1"])
	end function

	object.charAnimIdleDown = function()
		m.animTimer = invalid
		m.animPlay(["stand_front1"])
	end function

	object.charAnimIdleLeft = function()
		m.animTimer = invalid
		m.animPlay(["stand_side1"])
	end function

	object.charAnimIdleRight = function()
    m.animTimer = invalid
		m.animPlay(["stand_side1"])
	end function

  object.animUpdate = function()

    if m.view_wnd.getImage(m.game.char.getEntityName()) <> invalid

      ' update char data
      m.view_wnd.getImage(m.game.char.getEntityName()).alpha = m.game.char.getAlpha()
      m.view_wnd.getImage(m.game.char.getEntityName()).index = m.game.char.getIndex()
      m.view_wnd.getImage(m.game.char.getEntityName()).scale_x = m.game.char.getScaleX()
      m.view_wnd.getImage(m.game.char.getEntityName()).scale_y = m.game.char.getScaleY()
      m.view_wnd.getImage(m.game.char.getEntityName()).offset_x = m.game.char.getEntityOffsetX()
      m.view_wnd.getImage(m.game.char.getEntityName()).offset_y = m.game.char.getEntityOffsetY()

    end if
      
  end function

  object.charTurnUp = function()
    if m.game.char.getScaleX() <> 1.0
      m.game.char.setEntityOffsetX(m.game.char.getEntityOffsetX() - m.game.char.getEntityW())
      m.game.char.setScaleX(1.0)
    end if
  end function

  object.charTurnDown = function()
    if m.game.char.getScaleX() <> 1.0
      m.game.char.setEntityOffsetX(m.game.char.getEntityOffsetX() - m.game.char.getEntityW())
      m.game.char.setScaleX(1.0)
    end if
  end function

  object.charTurnLeft = function()
    if m.game.char.getScaleX() <> -1.0
      m.game.char.setEntityOffsetX(m.game.char.getEntityOffsetX() + m.game.char.getEntityW())
      m.game.char.setScaleX(-1.0)
    end if
  end function

  object.charTurnRight = function()
    if m.game.char.getScaleX() <> 1.0
      m.game.char.setEntityOffsetX(m.game.char.getEntityOffsetX() - m.game.char.getEntityW())
      m.game.char.setScaleX(1.0)
    end if
  end function

  object.charIdleUp = function()
    m.game.char.setNPCCol(invalid)
    m.game.char.setColDown(false)
    m.game.char.setColLeft(false)
    m.game.char.setColRight(false)
  end function

  object.charIdleDown = function()
    m.game.char.setNPCCol(invalid)
    m.game.char.setColUp(false)
    m.game.char.setColLeft(false)
    m.game.char.setColRight(false)
  end function

  object.charIdleLeft = function()
    m.game.char.setNPCCol(invalid)
    m.game.char.setColUp(false)
    m.game.char.setColDown(false)
    m.game.char.setColRight(false)
  end function

  object.charIdleRight = function()
    m.game.char.setNPCCol(invalid)
    m.game.char.setColUp(false)
    m.game.char.setColDown(false)
    m.game.char.setColLeft(false)
  end function

  object.charWalkUp = function()
    if m.game.char.getColUp() = false
      m.game.map.setEntityOffsetY(m.game.map.getEntityOffsetY() + m.game.char.getUpSpeed())
    end if
  end function

  object.charWalkDown = function()
    if m.game.char.getColDown() = false
      m.game.map.setEntityOffsetY(m.game.map.getEntityOffsetY() - m.game.char.getDownSpeed())
    end if
  end function

  object.charWalkLeft = function()
    if m.game.char.getColLeft() = false
      m.game.map.setEntityOffsetX(m.game.map.getEntityOffsetX() + m.game.char.getLeftSpeed())
    end if
  end function

  object.charWalkRight = function()
    if m.game.char.getColRight() = false
      m.game.map.setEntityOffsetX(m.game.map.getEntityOffsetX() - m.game.char.getRightSpeed())
    end if
  end function
  
  object.npcHPDamage = function()
    if m.game.char.getSP() >= m.game.char.getSPDamage()
      if m.hp_damage_timer = invalid
        if m.game.char.getNPCCol() <> invalid and m.game.char.getSP() >= m.game.char.getSPDamage()
          id = right(m.game.char.getNPCCol(), 1).toInt()
          m.game.npc.setHP(id, m.game.npc.getHP(id) - m.game.char.getHPDamage())
  
          print m.game.char.getNPCCol() + " was attacked"
          print m.game.npc.getHP(id)
    
        end if
    
        m.hp_damage_timer = CreateObject("roTimeSpan")
        m.hp_damage_timer.Mark()
    
      end if
        
      if m.hp_damage_timer.TotalMilliseconds() + 1 >= m.game.char.getSPDamageTime()
        m.hp_damage_timer = invalid
      end if

    end if

  end function

  object.charSPDamage = function()
    if m.game.char.getSP() >= m.game.char.getSPDamage()

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