function npc_anim(object)

	object.anim_options = {
		frame: 100
		timer: invalid
	}
    
	object.onCreate = function(args)

		' createInstance
		m.obj_wnd = m.game.getInstanceByName("npc_obj")

	end function

	
	object.animDeath = function()

		for i = 0 to m.game.npc.config.Count() - 1
			if m.game.npc.getHP(i) <= 0
				m.game.npc.setAnim(i, 9)

			end if

		end for

	end function


	object.animUpdate = function()

		for i = 0 to m.game.npc.config.Count() - 1
			if m.obj_wnd.getImage(m.game.npc.config[i].obj_name.toStr() + "_" + m.game.npc.config[i].id.toStr()) <> invalid
				' update npc anim
				m.obj_wnd.getImage(m.game.npc.config[i].obj_name.toStr() + "_" + m.game.npc.config[i].id.toStr()).index = m.game.npc.getAnim(i)

			end if
		
		end for

	end function


	object.onUpdate = function(dt as float)

		m.animDeath()
		m.animUpdate()

	end function
    
end function