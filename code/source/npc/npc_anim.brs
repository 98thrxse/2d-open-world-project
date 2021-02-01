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
    
end function