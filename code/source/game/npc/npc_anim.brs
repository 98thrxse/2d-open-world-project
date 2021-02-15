function npc_anim(object)

	object.anim_options = {
		frame: 100
		timer: invalid
	}
    
	object.onCreate = function(args)

		' createInstance
		obj_wnd = m.game.createInstance("npc_obj")

		' window initialization
		m.obj = obj_wnd.obj

	end function


	object.onUpdate = function(dt as float)

		for i = 0 to m.game.npc.config.Count() - 1

			if m.game.npc.npcGetHP(i) <= 0
				m.game.npc.npcSetAnim(i, 9)
			end if

		end for

	end function
    
end function