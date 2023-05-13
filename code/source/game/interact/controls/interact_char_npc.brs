function interact_char_npc(object)

    object.onButton = function(code as integer)

        ' held
        if code = 1006 ' select
          if m.game.getFocusGroup() = "char"
            m.npcHPDamage()
          end if
        end if
    
    end function

    object.npcHPDamage = function()
        if m.game.char.getNPCCol() <> invalid and m.game.char.getSP() >= m.game.char.getSPDamage() and m.game.char.getRegElement(m.game.char.getIndex()) <> "sp_zero"
          if m.hp_damage_timer = invalid
    
            m.game.npc.setHP(m.game.char.getNPCCol().split("_").peek().toInt(), m.game.npc.getHP(m.game.char.getNPCCol().split("_").peek().toInt()) - m.game.char.getHPDamage())
    
            print m.game.char.getNPCCol() + " was attacked"
            print m.game.npc.getHP(m.game.char.getNPCCol().split("_").peek().toInt())
        
            m.hp_damage_timer = CreateObject("roTimeSpan")
            m.hp_damage_timer.Mark()
        
          end if
            
          if m.hp_damage_timer.TotalMilliseconds() + 1 >= m.game.char.getSPDamageTime()
            m.hp_damage_timer = invalid
          end if
    
          m.game.char.setNPCCol(invalid)
    
        end if
    end function

end function