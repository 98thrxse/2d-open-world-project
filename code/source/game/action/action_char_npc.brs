function action_char_npc(object)

    object.npc_config = testOne_npc_config() ' fix stas

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
            if char_getNPCCollider() <> invalid

                m.npc_config[right(char_getNPCCollider(), 1).toInt()].health -= char_getHPDamage()

                print char_getNPCCollider() + " was attacked"
                print m.npc_config[right(char_getNPCCollider(), 1).toInt()].health

            end if

            char_setSP(char_getSP() - char_getSPDamage())
            
			m.timer = CreateObject("roTimeSpan")
            m.timer.Mark()
        end if
        
        if m.timer.TotalMilliseconds() + 1 >= char_getDamageTime()
            m.timer = invalid
        end if

    end function

end function