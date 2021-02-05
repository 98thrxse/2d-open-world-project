function char_action(object)

    object.onCreate = function(args)
        
    end function
    

    object.onButton = function(code as integer)
        
        ' held
        if code = 1006
            if char_getSP() > 0
                m.playAttack()

            end if

        end if

    end function

    object.playAttack = function()

        if m.timer = invalid
            if char_getNPCCollider() = true then print "NPC was attacked" ' fix stas
            char_setSP(char_getSP() - char_getSPDamage())
			m.timer = CreateObject("roTimeSpan")
            m.timer.Mark()
        end if
        
        if m.timer.TotalMilliseconds() + 1 >= char_getDamageTime()
            m.timer = invalid
        end if

    end function

end function