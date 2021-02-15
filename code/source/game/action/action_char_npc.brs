function action_char_npc(object)

    object.onCreate = function(args)
        
    end function
    

    object.onButton = function(code as integer)
        
        ' held
        if code = 1006
            if m.game.char.getSP() >= m.game.char.getSPDamage()
                m.actionHPDamage()

            end if

        end if

    end function

    object.actionHPDamage = function()

        if m.hp_damage_timer = invalid
            if m.game.char.getNPCCollider() <> invalid
                id = right(m.game.char.getNPCCollider(), 1).toInt()
                m.game.npc.npcSetHP(id, m.game.npc.npcGetHP(id) - m.game.char.getHPDamage())

                print m.game.char.getNPCCollider() + " was attacked"
                print m.game.npc.npcGetHP(id)

            end if

			m.hp_damage_timer = CreateObject("roTimeSpan")
            m.hp_damage_timer.Mark()

        end if
        
        if m.hp_damage_timer.TotalMilliseconds() + 1 >= m.game.char.getSPDamageTime()
            m.hp_damage_timer = invalid

        end if

    end function

end function