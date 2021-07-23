function npc_anim(object)
    
	object.onCreate = function(args)

		' getInstanceByName
		m.entity_wnd = m.game.getInstanceByName("npc_entity")

	end function

	
	object.animDeath = function()

		for i = 0 to m.game.npc.config.Count() - 1
			if m.game.npc.getHP(i) <= 0
				if m.game.npc.getReg(i, m.game.npc.getIndex(i)) <> "hp_zero" then m.playAnim(i, ["hp_zero"])
			end if
		end for

	end function

	object.playAnim = function(i, arr)

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
		
		' fix stas
		if m.timer.TotalMilliseconds() + 1 >= arrAnim.Count() * m.game.npc.getAnimTime(i) then m.timer.Mark()
		m.game.npc.setIndex(i, arrAnim[int(m.timer.TotalMilliseconds() / m.game.npc.getAnimTime(i))])

	end function

	object.animUpdate = function()

		for i = 0 to m.game.npc.config.Count() - 1
			if m.entity_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + i.toStr()) <> invalid
				
				' update npc anim
				m.entity_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + i.toStr()).index = m.game.npc.getIndex(i)

			end if
		
		end for

	end function


	object.onUpdate = function(dt as float)

		m.animDeath()
		m.animUpdate()

	end function
    
end function