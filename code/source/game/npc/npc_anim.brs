function npc_anim(object)
    
	object.onCreate = function(args)

		' getInstanceByName
		m.entity_wnd = m.game.getInstanceByName("npc_entity")

	end function

	
	object.animDeath = function()

		for i = 0 to m.game.npc.config.Count() - 1
			if m.game.npc.getHP(i) <= 0
				m.game.npc.setIndex(i, 9)

			end if

		end for

	end function


	object.animUpdate = function()

		for i = 0 to m.game.npc.config.Count() - 1
			if m.entity_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + m.game.npc.config[i].id.toStr()) <> invalid
				
				' update npc anim
				m.entity_wnd.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + m.game.npc.config[i].id.toStr()).index = m.game.npc.getIndex(i)

			end if
		
		end for

	end function


	object.onUpdate = function(dt as float)

		m.animDeath()
		m.animUpdate()

	end function
    
end function