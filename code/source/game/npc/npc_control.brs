function npc_control(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.view_wnd = m.game.getInstanceByName("npc_view")

  end function

  object.controlPos = function()

    ' entity position
    m.view_wnd.x = m.game.map.getEntityOffsetX()
    m.view_wnd.y = m.game.map.getEntityOffsetY()

  end function

  object.onUpdate = function(dt as float)

      m.controlPos()
      m.npcPath()
      m.npcDeath()
      m.npcAnimDeath()
      m.npcAnimWalk()
      m.animUpdate()

  end function


  object.npcPath = function()

    for i = 0 to m.game.npc.config.Count() - 1

      if m.game.npc.getPathCycle(i) <> invalid and m.game.npc.getPath(i) <> invalid

        if m.game.npc.getEntityOffsetX(i) < m.game.npc.getPathX(i, m.game.npc.getPathCycle(i))

          if m.game.npc.getScaleX(i) <> 1.0
            m.game.npc.setScaleX(i, 1.0)
            m.game.npc.setPathX(i, m.game.npc.getPathCycle(i), m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) - m.game.npc.getEntityW(i))
            m.game.npc.setEntityOffsetX(i, m.game.npc.getEntityOffsetX(i) - m.game.npc.getEntityW(i))
            m.game.npc.setColOffsetX(i, m.game.npc.getColOffsetX(i) - m.game.npc.getColW(i))
          end if


          m.game.npc.setEntityOffsetX(i, m.game.npc.getEntityOffsetX(i) + m.game.npc.getRightSpeed(i))
          m.game.npc.setColOffsetX(i, m.game.npc.getColOffsetX(i) + m.game.npc.getRightSpeed(i))

        else if m.game.npc.getEntityOffsetX(i) > m.game.npc.getPathX(i, m.game.npc.getPathCycle(i))

          if m.game.npc.getScaleX(i) <> -1.0
						m.game.npc.setScaleX(i, -1.0)
            m.game.npc.setPathX(i, m.game.npc.getPathCycle(i), m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) + m.game.npc.getEntityW(i))
						m.game.npc.setEntityOffsetX(i, m.game.npc.getEntityOffsetX(i) + m.game.npc.getEntityW(i))
            m.game.npc.setColOffsetX(i, m.game.npc.getColOffsetX(i) + m.game.npc.getColW(i))

					end if

          m.game.npc.setEntityOffsetX(i, m.game.npc.getEntityOffsetX(i) - m.game.npc.getLeftSpeed(i))
          m.game.npc.setColOffsetX(i, m.game.npc.getColOffsetX(i) - m.game.npc.getLeftSpeed(i))
        
        else if m.game.npc.getEntityOffsetY(i) <= m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))

          if m.game.npc.getScaleX(i) <> 1.0
            m.game.npc.setScaleX(i, 1.0)
            m.game.npc.setPathX(i, m.game.npc.getPathCycle(i), m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) - m.game.npc.getEntityW(i))
            m.game.npc.setEntityOffsetX(i, m.game.npc.getEntityOffsetX(i) - m.game.npc.getEntityW(i))
            m.game.npc.setColOffsetX(i, m.game.npc.getColOffsetX(i) - m.game.npc.getColW(i))

          end if

          m.game.npc.setEntityOffsetY(i, m.game.npc.getEntityOffsetY(i) + m.game.npc.getDownSpeed(i))
          m.game.npc.setColOffsetY(i, m.game.npc.getColOffsetY(i) + m.game.npc.getDownSpeed(i))

        else if m.game.npc.getEntityOffsetY(i) >= m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))

          if m.game.npc.getScaleX(i) <> 1.0
            m.game.npc.setScaleX(i, 1.0)
            m.game.npc.setPathX(i, m.game.npc.getPathCycle(i), m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) - m.game.npc.getEntityW(i))
            m.game.npc.setEntityOffsetX(i, m.game.npc.getEntityOffsetX(i) - m.game.npc.getEntityW(i))
            m.game.npc.setColOffsetX(i, m.game.npc.getColOffsetX(i) - m.game.npc.getColW(i))

          end if

          m.game.npc.setEntityOffsetY(i, m.game.npc.getEntityOffsetY(i) - m.game.npc.getUpSpeed(i))
          m.game.npc.setColOffsetY(i, m.game.npc.getColOffsetY(i) - m.game.npc.getUpSpeed(i))

        end if

        if m.game.npc.getEntityOffsetX(i) = m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) and m.game.npc.getEntityOffsetY(i) = m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))
          if m.game.npc.getPathCycle(i) = m.game.npc.config[i].attrs.path.position.Count() - 1 then m.game.npc.setPathCycle(i, 0) else m.game.npc.setPathCycle(i, m.game.npc.getPathCycle(i) + 1)
        end if

      end if

    end for

  end function

	object.npcAnimDeath = function()

		for i = 0 to m.game.npc.config.Count() - 1
			if m.game.npc.getHP(i) <= 0 and m.game.npc.getRegElement(i, m.game.npc.getIndex(i)) <> "hp_zero" 
        m.animPlay(i, ["hp_zero"])
			end if
		end for

	end function

  object.npcDeath = function()

		for i = 0 to m.game.npc.config.Count() - 1
      if m.game.npc.getHP(i) <= 0 and m.game.npc.getPathCycle(i) <> invalid and m.game.npc.getPath(i) <> invalid
        m.game.npc.setPathCycle(i, invalid)
        m.game.npc.setPath(i, [ [] ])
			end if
		end for

	end function

	object.npcAnimWalk = function()
		for i = 0 to m.game.npc.config.Count() - 1
			if m.game.npc.getHP(i) > 0 and m.game.npc.getPathCycle(i) <> invalid and m.game.npc.getPath(i) <> invalid

				if m.game.npc.getEntityOffsetX(i) < m.game.npc.getPathX(i, m.game.npc.getPathCycle(i))
					m.npcAnimWalkSide(i)
				
				else if m.game.npc.getEntityOffsetX(i) > m.game.npc.getPathX(i, m.game.npc.getPathCycle(i))
					m.npcAnimWalkSide(i)
				
				else if m.game.npc.getEntityOffsetY(i) <= m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))
					m.npcAnimWalkDown(i)
		
				else if m.game.npc.getEntityOffsetY(i) >= m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))
					m.npcAnimWalkUp(i)
		
				end if
	
			end if
	
		end for
	end function

	object.npcAnimWalkUp = function(i)
		m.animPlay(i, ["walk_back1", "stand_back1", "walk_back2"])
	end function

	object.npcAnimWalkDown = function(i)
		m.animPlay(i, ["walk_front1", "stand_front1", "walk_front2"])
	end function

	object.npcAnimWalkSide = function(i)
		m.animPlay(i, ["walk_side1", "stand_side1", "walk_side2"])
	end function


	object.animPlay = function(i, arr)

		if m.timer = invalid
			m.timer = CreateObject("roTimeSpan")
			m.timer.Mark()
		end if

		arrAnim = []

		for each element in arr
			for j = 0 to m.game.npc.config[i].entity.reg.Count() - 1
				if m.game.npc.getRegElement(i, j) = element then arrAnim.push(j)
			end for
		end for
		
		if m.timer.TotalMilliseconds() + 1 >= arrAnim.Count() * m.game.npc.getAnimTime(i) then m.timer.Mark()
		m.game.npc.setIndex(i, arrAnim[int(m.timer.TotalMilliseconds() / m.game.npc.getAnimTime(i))])

	end function


	object.animUpdate = function()

		for i = 0 to m.game.npc.config.Count() - 1
			if m.view_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + i.toStr()) <> invalid
				
				' update npc data
				m.view_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + i.toStr()).index = m.game.npc.getIndex(i)
				m.view_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + i.toStr()).scale_x = m.game.npc.getScaleX(i)
				m.view_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + i.toStr()).scale_y = m.game.npc.getScaleY(i)
				m.view_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + i.toStr()).offset_x = m.game.npc.getEntityOffsetX(i)
				m.view_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + i.toStr()).offset_y = m.game.npc.getEntityOffsetY(i)

				m.view_wnd.getCollider(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr()).offset_x = m.game.npc.getColOffsetX(i)
				m.view_wnd.getCollider(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr()).offset_y = m.game.npc.getColOffsetY(i)

			end if
		
		end for

	end function
      
end function