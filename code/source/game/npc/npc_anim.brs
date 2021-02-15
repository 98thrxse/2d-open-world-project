function npc_anim(object)

	object.anim_options = {
		frame: 100
		timer: invalid
	}
    
	object.onCreate = function(args)

		' createInstance
		m.obj_wnd = m.game.createInstance("npc_obj")

	end function


	object.onUpdate = function(dt as float)

		for i = 0 to m.game.npc.config.Count() - 1

			if m.game.npc.getHP(i) <= 0
				m.game.npc.setAnim(i, 9)
			end if

			' update npc anim
			m.game.getInstanceByName("npc_obj").getImage(m.game.npc.config[i].obj_name.toStr() + "_" + m.game.npc.config[i].id.toStr()).index = m.game.npc.getAnim(i)

		end for

	end function
    
end function