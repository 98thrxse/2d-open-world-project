function action_main(object)

	object.onCreate = function(args)

		' createInstance
        m.game.createInstance("action_char")
        m.game.createInstance("action_npc")
        m.game.createInstance("action_char_npc")
        m.game.createInstance("action_char_obj")

	end function

end function