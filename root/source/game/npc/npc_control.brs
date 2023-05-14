sub npc_control(object)

  object.onCreate = sub(args as object)

    ' getInstanceByName
    m.view_wnd = m.game.getInstanceByName("npc_view")

  end sub

  object.updatePos = sub()

    ' entity position
    m.view_wnd.x = m.game.map.getOffsetX()
    m.view_wnd.y = m.game.map.getOffsetY()

  end sub

  object.onUpdate = sub(dt as float)

      m.updatePos()
      m.walk()
      m.pathReset()
      m.death()
      m.deathAnim()
      m.walkAnim()
      m.updateView()

  end sub

  object.pathReset = sub()
    for i = 0 to m.game.npc.config.Count() - 1
      if m.game.npc.getPathCycle(i) <> invalid and m.game.npc.getPath(i) <> invalid

        if m.game.npc.getOffsetX(i) = m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) and m.game.npc.getOffsetY(i) = m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))
          if m.game.npc.getPathCycle(i) = m.game.npc.config[i].path.position.Count() - 1 then m.game.npc.setPathCycle(i, 0) else m.game.npc.setPathCycle(i, m.game.npc.getPathCycle(i) + 1)
        end if

      end if
    end for
  end sub

  object.walk = sub()

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

  end sub

	object.deathAnim = sub()

		for i = 0 to m.game.npc.config.Count() - 1
			if m.game.npc.getHP(i) <= 0 and m.game.npc.getRegElement(i, m.game.npc.getIndex(i)) <> "hp_zero" 
        m.playAnim(i, ["hp_zero"])
			end if
		end for

	end sub

  object.death = sub()

		for i = 0 to m.game.npc.config.Count() - 1
      if m.game.npc.getHP(i) <= 0 and m.game.npc.getPathCycle(i) <> invalid and m.game.npc.getPath(i) <> invalid
        m.game.npc.setPathCycle(i, invalid)
        m.game.npc.setPath(i, [ [] ])
			end if
		end for

	end sub

	object.walkAnim = sub()
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
	end sub

	object.walkUpAnim = sub(i as integer)
		m.playAnim(i, ["walk_back1", "idle_back1", "walk_back2"])
	end sub

	object.walkDownAnim = sub(i as integer)
		m.playAnim(i, ["walk_front1", "idle_front1", "walk_front2"])
	end sub

	object.walkSideAnim = sub(i as integer)
		m.playAnim(i, ["walk_side1", "idle_side1", "walk_side2"])
	end sub


	object.playAnim = sub(i as integer, arr as object)

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

	end sub

  object.updateView = sub()

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

	end sub
      
end sub