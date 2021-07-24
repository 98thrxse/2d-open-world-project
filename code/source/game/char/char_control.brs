function char_control(object)

  object.onCreate = function(args)

    m.loadXY()

  end function


  object.saveXY = function()

    m.game.char.setEntityPosX(m.game.screen.GetWidth() / 2 - m.game.map.getEntityOffsetX())
    m.game.char.setEntityPosY(m.game.screen.GetHeight() / 2 - m.game.map.getEntityOffsetY())

  end function


  object.loadXY = function()

    ' position
    m.game.map.setEntityOffsetX(m.game.screen.GetWidth() / 2 - m.game.char.getEntityPosX())
    m.game.map.setEntityOffsetY(m.game.screen.GetHeight() / 2 - m.game.char.getEntityPosY())

  end function


  object.onUpdate = function(dt as float)

    m.saveXY()
    m.charSPRegen()

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
      end if

    else if code = 103 ' down
      if m.game.getFocusGroup() = "char"
        m.charIdleDown()        
      end if

    else if code = 104 ' left
      if m.game.getFocusGroup() = "char"
        m.charIdleLeft()        
      end if

    else if code = 105 ' right
      if m.game.getFocusGroup() = "char"
        m.charIdleRight()        
      end if

      
    ' held
    else if code = 1002 ' up
      if m.game.getFocusGroup() = "char"
        m.charWalkUp()
      end if
                      
    else if code = 1003 ' down
      if m.game.getFocusGroup() = "char"
        m.charWalkDown()      
      end if
        
    else if code = 1004 ' left
      if m.game.getFocusGroup() = "char"
        m.charWalkLeft()
      end if
            
    else if code = 1005 ' right
      if m.game.getFocusGroup() = "char"
        m.charWalkRight()
      end if

    else if code = 1006 ' select
      if m.game.getFocusGroup() = "char"
        m.charSPDamage()
        m.npcHPDamage()
      end if
      
		end if

	end function

  object.charTurnUp = function()
    if m.game.char.getScaleX() <> 1.0
      m.game.char.setEntityOffsetX(m.game.char.getEntityOffsetX() - m.game.char.getEntityW())
    end if
    m.game.char.setScaleX(1.0)
  end function

  object.charTurnDown = function()
    if m.game.char.getScaleX() <> 1.0
      m.game.char.setEntityOffsetX(m.game.char.getEntityOffsetX() - m.game.char.getEntityW())
    end if
    m.game.char.setScaleX(1.0)
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