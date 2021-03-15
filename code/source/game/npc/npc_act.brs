function npc_act(object)

    object.onCreate = function(args)
        
    end function

    object.onButton = function(code as integer)

        if code = 1006 ' select
            if m.game.char.getSP() >= m.game.char.getSPDamage()
                m.npcHPDamage()
    
            end if

        end if

    end function
    
    object.npcHPDamage = function()

		if m.game.data.getFocusGroup() = "char"
            if m.hp_damage_timer = invalid
            if m.game.char.getNPCCol() <> invalid and m.game.char.getSP() >= m.game.char.getSPDamage()
                id = right(m.game.char.getNPCCol(), 1).toInt()
                m.game.npc.setHP(id, m.game.npc.getHP(id) - m.game.char.getHPDamage())
        
                print m.game.char.getNPCCol() + " was attacked"
                print m.game.npc.getHP(id)
        
            end if
        
            m.hp_damage_timer = CreateObject("roTimeSpan")
            m.hp_damage_timer.Mark()
        
            end if
            
            if m.hp_damage_timer.TotalMilliseconds() + 1 >= m.game.char.getSPDamageTime()
                m.hp_damage_timer = invalid
        
            end if

        end if
    
    end function

end function