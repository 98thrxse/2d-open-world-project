function npc_control(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.view_wnd = m.game.getInstanceByName("npc_view")

  end function

  object.updatePos = function()

    ' entity position
    m.view_wnd.x = m.game.map.getOffsetX()
    m.view_wnd.y = m.game.map.getOffsetY()

  end function

  object.onUpdate = function(dt as float)

      m.updatePos()
      m.walk()
      m.pathReset()
      m.death()
      m.deathAnim()
      m.walkAnim()
      m.updateView()

  end function

  object.pathReset = function()
    for i = 0 to m.game.npc.config.Count() - 1
      if m.game.npc.getPathCycle(i) <> invalid and m.game.npc.getPath(i) <> invalid

        if m.game.npc.getOffsetX(i) = m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) and m.game.npc.getOffsetY(i) = m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))
          if m.game.npc.getPathCycle(i) = m.game.npc.config[i].path.position.Count() - 1 then m.game.npc.setPathCycle(i, 0) else m.game.npc.setPathCycle(i, m.game.npc.getPathCycle(i) + 1)
        end if

      end if
    end for
  end function

  object.walk = function()

    for i = 0 to m.game.npc.config.Count() - 1

      if m.game.npc.getPathCycle(i) <> invalid and m.game.npc.getPath(i) <> invalid

        if m.game.npc.getOffsetX(i) < m.game.npc.getPathX(i, m.game.npc.getPathCycle(i))

          if m.game.npc.getScaleX(i) < 0.0
            m.game.npc.setScaleX(i, - m.game.npc.getScaleX(i))
            m.game.npc.setPathX(i, m.game.npc.getPathCycle(i), m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) - m.game.npc.getSizeW(i) * m.game.npc.getScaleX(i))
            m.game.npc.setOffsetX(i, m.game.npc.getOffsetX(i) - m.game.npc.getSizeW(i) * m.game.npc.getScaleX(i))
          end if

          if m.game.npc.getRightSpeed(i) > m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) - m.game.npc.getOffsetX(i)
            m.game.npc.setOffsetX(i, m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)))
          else
            m.game.npc.setOffsetX(i, m.game.npc.getOffsetX(i) + m.game.npc.getRightSpeed(i))
          end if

        else if m.game.npc.getOffsetX(i) > m.game.npc.getPathX(i, m.game.npc.getPathCycle(i))

          if m.game.npc.getScaleX(i) > 0.0
						m.game.npc.setScaleX(i, - m.game.npc.getScaleX(i))
            m.game.npc.setPathX(i, m.game.npc.getPathCycle(i), m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) - m.game.npc.getSizeW(i) * m.game.npc.getScaleX(i))
						m.game.npc.setOffsetX(i, m.game.npc.getOffsetX(i) - m.game.npc.getSizeW(i) * m.game.npc.getScaleX(i))

					end if

          if m.game.npc.getLeftSpeed(i) > m.game.npc.getOffsetX(i) - m.game.npc.getPathX(i, m.game.npc.getPathCycle(i))
            m.game.npc.setOffsetX(i, m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)))
          else
            m.game.npc.setOffsetX(i, m.game.npc.getOffsetX(i) - m.game.npc.getLeftSpeed(i))
          end if

        else if m.game.npc.getOffsetY(i) <= m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))

          if m.game.npc.getScaleX(i) < 0.0
            m.game.npc.setScaleX(i, - m.game.npc.getScaleX(i))
            m.game.npc.setPathX(i, m.game.npc.getPathCycle(i), m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) - m.game.npc.getSizeW(i) * m.game.npc.getScaleX(i))
            m.game.npc.setOffsetX(i, m.game.npc.getOffsetX(i) - m.game.npc.getSizeW(i) * m.game.npc.getScaleX(i))

          end if

          if m.game.npc.getDownSpeed(i) > m.game.npc.getPathY(i, m.game.npc.getPathCycle(i)) - m.game.npc.getOffsetY(i)
            m.game.npc.setOffsetY(i, m.game.npc.getPathY(i, m.game.npc.getPathCycle(i)))
          else
            m.game.npc.setOffsetY(i, m.game.npc.getOffsetY(i) + m.game.npc.getDownSpeed(i))
          end if

        else if m.game.npc.getOffsetY(i) >= m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))

          if m.game.npc.getScaleX(i) < 0.0
            m.game.npc.setScaleX(i, - m.game.npc.getScaleX(i))
            m.game.npc.setPathX(i, m.game.npc.getPathCycle(i), m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) - m.game.npc.getSizeW(i) * m.game.npc.getScaleX(i))
            m.game.npc.setOffsetX(i, m.game.npc.getOffsetX(i) - m.game.npc.getSizeW(i) * m.game.npc.getScaleX(i))

          end if

          if m.game.npc.getUpSpeed(i) > m.game.npc.getOffsetY(i) - m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))
            m.game.npc.setOffsetY(i, m.game.npc.getPathY(i, m.game.npc.getPathCycle(i)))
          else
            m.game.npc.setOffsetY(i, m.game.npc.getOffsetY(i) - m.game.npc.getUpSpeed(i))
          end if
        end if

      end if

    end for

  end function

	object.deathAnim = function()

		for i = 0 to m.game.npc.config.Count() - 1
			if m.game.npc.getHP(i) <= 0 and m.game.npc.getRegElement(i, m.game.npc.getIndex(i)) <> "hp_zero" 
        m.playAnim(i, ["hp_zero"])
			end if
		end for

	end function

  object.death = function()

		for i = 0 to m.game.npc.config.Count() - 1
      if m.game.npc.getHP(i) <= 0 and m.game.npc.getPathCycle(i) <> invalid and m.game.npc.getPath(i) <> invalid
        m.game.npc.setPathCycle(i, invalid)
        m.game.npc.setPath(i, [ [] ])
			end if
		end for

	end function

	object.walkAnim = function()
		for i = 0 to m.game.npc.config.Count() - 1
			if m.game.npc.getHP(i) > 0 and m.game.npc.getPathCycle(i) <> invalid and m.game.npc.getPath(i) <> invalid

				if m.game.npc.getOffsetX(i) < m.game.npc.getPathX(i, m.game.npc.getPathCycle(i))
					m.walkSideAnim(i)
				
				else if m.game.npc.getOffsetX(i) > m.game.npc.getPathX(i, m.game.npc.getPathCycle(i))
					m.walkSideAnim(i)
				
				else if m.game.npc.getOffsetY(i) <= m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))
					m.walkDownAnim(i)
		
				else if m.game.npc.getOffsetY(i) >= m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))
					m.walkUpAnim(i)
		
				end if
	
			end if
	
		end for
	end function

	object.walkUpAnim = function(i)
		m.playAnim(i, ["walk_back1", "idle_back1", "walk_back2"])
	end function

	object.walkDownAnim = function(i)
		m.playAnim(i, ["walk_front1", "idle_front1", "walk_front2"])
	end function

	object.walkSideAnim = function(i)
		m.playAnim(i, ["walk_side1", "idle_side1", "walk_side2"])
	end function


	object.playAnim = function(i, arr)

		if m.timer = invalid
			m.timer = CreateObject("roTimeSpan")
			m.timer.Mark()
		end if

		arrAnim = []

		for each element in arr
			for j = 0 to m.game.npc.config[i].reg.Count() - 1
				if m.game.npc.getRegElement(i, j) = element then arrAnim.push(j)
			end for
		end for
		
		if m.timer.TotalMilliseconds() + 1 >= arrAnim.Count() * m.game.npc.getAnimTime(i) then m.timer.Mark()
		m.game.npc.setIndex(i, arrAnim[int(m.timer.TotalMilliseconds() / m.game.npc.getAnimTime(i))])

	end function

  object.onButton = function(code as integer)

    ' held
    if code = 1006 ' select
      if m.game.getFocusGroup() = "char"
        m.getCharHPDamage()
      end if

    else if code = 1002 ' up
      if m.game.getFocusGroup() = "veh"
        m.getVehHPDamage()
      end if
                      
    else if code = 1003 ' down
      if m.game.getFocusGroup() = "veh"
        m.getVehHPDamage()
      end if
        
    else if code = 1004 ' left
      if m.game.getFocusGroup() = "veh"
        m.getVehHPDamage()
      end if
            
    else if code = 1005 ' right
      if m.game.getFocusGroup() = "veh"
        m.getVehHPDamage()
      end if
      
    end if

  end function

  object.getCharHPDamage = function()
    if m.game.char.getNPCCol() <> invalid and m.game.char.getSP() >= m.game.char.getSPDamage() and m.game.char.getRegElement(m.game.char.getIndex()) <> "sp_zero"
      if m.hp_damage_timer = invalid

        m.game.npc.setHP(m.game.char.getNPCCol().split("_").peek().toInt(), m.game.npc.getHP(m.game.char.getNPCCol().split("_").peek().toInt()) - m.game.char.getHPDamage())

        print m.game.char.getNPCCol() + " was attacked"
        print m.game.npc.getHP(m.game.char.getNPCCol().split("_").peek().toInt())
    
        m.hp_damage_timer = CreateObject("roTimeSpan")
        m.hp_damage_timer.Mark()
    
      end if
        
      if m.hp_damage_timer.TotalMilliseconds() + 1 >= m.game.char.getSPDamageTime()
        m.hp_damage_timer = invalid
      end if

      m.game.char.setNPCCol(invalid)

    end if
  end function

  object.getVehHPDamage = function()
    if m.game.veh.getNPCCol(m.game.char.getVeh().split("_").peek().toInt()) <> invalid
      if m.game.npc.getHP(m.game.veh.getNPCCol(m.game.char.getVeh().split("_").peek().toInt()).split("_").peek().toInt()) > 0
        m.game.npc.setHP(m.game.veh.getNPCCol(m.game.char.getVeh().split("_").peek().toInt()).split("_").peek().toInt(), 0)

        print m.game.veh.getNPCCol(m.game.char.getVeh().split("_").peek().toInt()) + " was attacked"
        print m.game.npc.getHP(m.game.veh.getNPCCol(m.game.char.getVeh().split("_").peek().toInt()).split("_").peek().toInt())
      end if
    end if
  end function

	object.updateView = function()

		for i = 0 to m.game.npc.config.Count() - 1
			if m.view_wnd.getImage(m.game.npc.getName(i).toStr() + "_" + i.toStr()) <> invalid
				
				' update npc data
				m.view_wnd.getImage(m.game.npc.getName(i).toStr() + "_" + i.toStr()).index = m.game.npc.getIndex(i)
				m.view_wnd.getImage(m.game.npc.getName(i).toStr() + "_" + i.toStr()).scale_x = m.game.npc.getScaleX(i)
				m.view_wnd.getImage(m.game.npc.getName(i).toStr() + "_" + i.toStr()).scale_y = m.game.npc.getScaleY(i)
				m.view_wnd.getImage(m.game.npc.getName(i).toStr() + "_" + i.toStr()).offset_x = m.game.npc.getOffsetX(i)
				m.view_wnd.getImage(m.game.npc.getName(i).toStr() + "_" + i.toStr()).offset_y = m.game.npc.getOffsetY(i)

			end if

      if m.view_wnd.getCollider(m.game.npc.getName(i).toStr() + "_" + i.toStr()) <> invalid
        m.view_wnd.getCollider(m.game.npc.getName(i).toStr() + "_" + i.toStr()).offset_x = m.game.npc.getOffsetX(i)
				m.view_wnd.getCollider(m.game.npc.getName(i).toStr() + "_" + i.toStr()).offset_y = m.game.npc.getOffsetY(i)
      end if
		end for

	end function
      
end function