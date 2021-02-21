function interact_main(object)

	object.onCreate = function(args)

		' createInstance
        m.game.createInstance("interact_char_npc")
        m.game.createInstance("interact_char_obj")

	end function

end function