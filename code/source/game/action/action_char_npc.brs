function action_char_npc(object)

    object.npc_config = testOne_npc_config() ' fix stas

    object.onCreate = function(args)
        
    end function
    

    object.onButton = function(code as integer)
        
        ' held
        if code = 1006
            if m.game.user.getSP() >= m.game.user.getSPDamage()
                m.actionHPDamage()

            end if

        end if

    end function

    object.actionHPDamage = function()

        if m.hp_damage_timer = invalid
            if m.game.user.getNPCCollider() <> invalid
                id = right(m.game.user.getNPCCollider(), 1).toInt()
                m.npc_config[id].health -= m.game.user.getHPDamage()

                print m.game.user.getNPCCollider() + " was attacked"
                print m.npc_config[id].health

            end if

			m.hp_damage_timer = CreateObject("roTimeSpan")
            m.hp_damage_timer.Mark()

        end if
        
        if m.hp_damage_timer.TotalMilliseconds() + 1 >= m.game.user.getSPDamageTime()
            m.hp_damage_timer = invalid

        end if

    end function

end function