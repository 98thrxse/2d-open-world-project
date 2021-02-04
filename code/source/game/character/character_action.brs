function character_action(object)

    object.onCreate = function(args)
        
    end function
    

    object.onButton = function(code as integer)
        
        ' held
        if code = 1006
            if character_getSP() > 0
                m.playAttack()

            end if

        end if

    end function

    object.playAttack = function()

        if m.timer = invalid
            if character_getNPCCollider() = true then print "NPC was attacked" ' fix stas
            character_setSP(character_getSP() - character_getSPDamage())
			m.timer = CreateObject("roTimeSpan")
            m.timer.Mark()
        end if
        
        if m.timer.TotalMilliseconds() + 1 >= character_getDamageTime()
            m.timer = invalid
        end if

    end function

end function