function character_action(object)

    object.onCreate = function(args)
        
    end function
    

    object.onButton = function(code as integer)
        
        ' held
        if code = 1006
            m.playAction()
            
        end if

    end function

    object.playAction = function()

        if m.timer = invalid
            character_setSP(character_getSP() - character_getSPDamage())
			m.timer = CreateObject("roTimeSpan")
            m.timer.Mark()
        end if
        
        if m.timer.TotalMilliseconds() + 1 >= 1000
            m.timer = invalid
        end if

	end function

end function