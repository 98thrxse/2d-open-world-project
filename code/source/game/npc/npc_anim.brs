function npc_anim(object)
    
	object.onCreate = function(args)

		' getInstanceByName
		m.entity_wnd = m.game.getInstanceByName("npc_entity")
		m.col_wnd = m.game.getInstanceByName("npc_col")

	end function

	
	object.npcDeath = function()

		for i = 0 to m.game.npc.config.Count() - 1
			if m.game.npc.getHP(i) <= 0
				if m.game.npc.getReg(i, m.game.npc.getIndex(i)) <> "hp_zero" 
					m.animPlay(i, ["hp_zero"])
					m.game.npc.setPathCycle(i, 0)
					m.game.npc.setPath(i, [ [m.game.npc.getEntityOffsetX(i), m.game.npc.getEntityOffsetY(i)] ])
				end if
			end if
		end for

	end function

	object.npcWalk = function()
		for i = 0 to m.game.npc.config.Count() - 1
			if m.game.npc.getHP(i) > 0 and m.game.npc.getPathCycle(i) <> invalid and m.game.npc.getPath(i) <> invalid

				if m.game.npc.getEntityOffsetX(i) < m.game.npc.getPathX(i, m.game.npc.getPathCycle(i))
					m.npcWalkSide(i)
				
				else if m.game.npc.getEntityOffsetX(i) > m.game.npc.getPathX(i, m.game.npc.getPathCycle(i))
					m.npcWalkSide(i)
				
				else if m.game.npc.getEntityOffsetY(i) <= m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))
					m.npcWalkDown(i)
		
				else if m.game.npc.getEntityOffsetY(i) >= m.game.npc.getPathY(i, m.game.npc.getPathCycle(i))
					m.npcWalkUp(i)
		
				end if
	
			end if
	
		end for
	end function

	object.npcWalkUp = function(i)
		m.animPlay(i, ["walk_back1", "stand_back1", "walk_back2"])
	end function

	object.npcWalkDown = function(i)
		m.animPlay(i, ["walk_front1", "stand_front1", "walk_front2"])
	end function

	object.npcWalkSide = function(i)
		m.animPlay(i, ["walk_side1", "stand_side1", "walk_side2"])
	end function


	object.animPlay = function(i, arr)

		if m.timer = invalid
			m.timer = CreateObject("roTimeSpan")
			m.timer.Mark()
		end if

		arrAnim = []

		for each element in arr
			for j = 0 to m.game.npc.config[i].entity.anim.reg.Count() - 1
				if m.game.npc.getReg(i, j) = element then arrAnim.push(j)
			end for
		end for
		
		if m.timer.TotalMilliseconds() + 1 >= arrAnim.Count() * m.game.npc.getAnimTime(i) then m.timer.Mark()
		m.game.npc.setIndex(i, arrAnim[int(m.timer.TotalMilliseconds() / m.game.npc.getAnimTime(i))])

	end function


	object.animUpdate = function()

		for i = 0 to m.game.npc.config.Count() - 1
			if m.entity_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + i.toStr()) <> invalid
				
				' update npc data
				m.entity_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + i.toStr()).index = m.game.npc.getIndex(i)
				m.entity_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + i.toStr()).scale_x = m.game.npc.getScaleX(i)
				m.entity_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + i.toStr()).scale_y = m.game.npc.getScaleY(i)
				m.entity_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + i.toStr()).offset_x = m.game.npc.getEntityOffsetX(i)
				m.entity_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + i.toStr()).offset_y = m.game.npc.getEntityOffsetY(i)

				m.col_wnd.getCollider(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr()).offset_x = m.game.npc.getColOffsetX(i)
				m.col_wnd.getCollider(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr()).offset_y = m.game.npc.getColOffsetY(i)

			end if
		
		end for

	end function


	object.onUpdate = function(dt as float)

		m.npcDeath()
		m.npcWalk()
		m.animUpdate()

	end function
    
end function