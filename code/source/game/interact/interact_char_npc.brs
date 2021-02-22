function interact_char_npc(object)

    object.onCreate = function(args)
        
    end function
    

    object.onButton = function(code as integer)
        
        ' held
        if code = 1006
            if m.game.char.getSP() >= m.game.char.getSPDamage()
                m.interactHPDamage()

            end if

        end if

    end function

    object.interactHPDamage = function()

        if m.hp_damage_timer = invalid
            if m.game.map.getCharNPCCol() <> invalid
                id = right(m.game.map.getCharNPCCol(), 1).toInt()
                m.game.npc.setHP(id, m.game.npc.getHP(id) - m.game.char.getHPDamage())

                print m.game.map.getCharNPCCol() + " was attacked"
                print m.game.npc.getHP(id)

            end if

			m.hp_damage_timer = CreateObject("roTimeSpan")
            m.hp_damage_timer.Mark()

        end if
        
        if m.hp_damage_timer.TotalMilliseconds() + 1 >= m.game.char.getSPDamageTime()
            m.hp_damage_timer = invalid

        end if

    end function

end function