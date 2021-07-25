function npc_control(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.entity_wnd = m.game.getInstanceByName("npc_entity")
    m.col_wnd = m.game.getInstanceByName("npc_col")

  end function

  object.controlPos = function()

    ' entity position
    m.entity_wnd.x = m.game.map.getEntityOffsetX()
    m.entity_wnd.y = m.game.map.getEntityOffsetY()

    ' col position
    m.col_wnd.x = m.game.map.getEntityOffsetX()
    m.col_wnd.y = m.game.map.getEntityOffsetY()

  end function

  object.onUpdate = function(dt as float)

      m.controlPos()
      m.npcPath()

  end function


  object.npcPath = function()

    for i = 0 to m.game.npc.config.Count() - 1

      if m.game.npc.getPathCycle(i) <> invalid and m.game.npc.getPath(i) <> invalid

        if m.game.npc.getEntityOffsetX(i) < m.game.npc.getPathX(i, m.game.npc.getPathCycle(i))

          if m.game.npc.getScaleX(i) <> 1.0
            m.game.npc.setScaleX(i, 1.0)
            m.game.npc.setPathX(i, m.game.npc.getPathCycle(i), m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) - m.game.npc.getEntityW(i))
            m.game.npc.setEntityOffsetX(i, m.game.npc.getEntityOffsetX(i) - m.game.npc.getEntityW(i))
          end if


          m.game.npc.setEntityOffsetX(i, m.game.npc.getEntityOffsetX(i) + 1)
          m.game.npc.setColOffsetX(i, m.game.npc.getColOffsetX(i) + 1)

        else if m.game.npc.getEntityOffsetX(i) > m.game.npc.getPathX(i, m.game.npc.getPathCycle(i))

          if m.game.npc.getScaleX(i) <> -1.0
						m.game.npc.setScaleX(i, -1.0)
            m.game.npc.setPathX(i, m.game.npc.getPathCycle(i), m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) + m.game.npc.getEntityW(i))
						m.game.npc.setEntityOffsetX(i, m.game.npc.getEntityOffsetX(i) + m.game.npc.getEntityW(i))
					end if

          m.game.npc.setEntityOffsetX(i, m.game.npc.getEntityOffsetX(i) - 1)
          m.game.npc.setColOffsetX(i, m.game.npc.getColOffsetX(i) - 1)
        
        else if m.game.npc.getEntityOffsetY(i) <= m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))

          if m.game.npc.getScaleX(i) <> 1.0
            m.game.npc.setScaleX(i, 1.0)
            m.game.npc.setPathX(i, m.game.npc.getPathCycle(i), m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) - m.game.npc.getEntityW(i))
            m.game.npc.setEntityOffsetX(i, m.game.npc.getEntityOffsetX(i) - m.game.npc.getEntityW(i))
          end if

          m.game.npc.setEntityOffsetY(i, m.game.npc.getEntityOffsetY(i) + 1)
          m.game.npc.setColOffsetY(i, m.game.npc.getColOffsetY(i) + 1)

        else if m.game.npc.getEntityOffsetY(i) >= m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))

          if m.game.npc.getScaleX(i) <> 1.0
            m.game.npc.setScaleX(i, 1.0)
            m.game.npc.setPathX(i, m.game.npc.getPathCycle(i), m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) - m.game.npc.getEntityW(i))
            m.game.npc.setEntityOffsetX(i, m.game.npc.getEntityOffsetX(i) - m.game.npc.getEntityW(i))
          end if

          m.game.npc.setEntityOffsetY(i, m.game.npc.getEntityOffsetY(i) - 1)
          m.game.npc.setColOffsetY(i, m.game.npc.getColOffsetY(i) - 1)

        end if

        if m.game.npc.getEntityOffsetX(i) = m.game.npc.getPathX(i, m.game.npc.getPathCycle(i)) and m.game.npc.getEntityOffsetY(i) = m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))
          if m.game.npc.getPathCycle(i) = m.game.npc.config[i].attrs.path.position.Count() - 1 then m.game.npc.setPathCycle(i, 0) else m.game.npc.setPathCycle(i, m.game.npc.getPathCycle(i) + 1)
        end if

      end if

    end for

  end function
      
end function