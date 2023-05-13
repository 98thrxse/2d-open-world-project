function interact_npc_veh(object)

    object.onButton = function(code as integer)

        ' held
        if code = 1002 ' up
          if m.game.getFocusGroup() = "veh"
            m.npcHPDamage()
          end if
                          
        else if code = 1003 ' down
          if m.game.getFocusGroup() = "veh"
            m.npcHPDamage()
          end if
            
        else if code = 1004 ' left
          if m.game.getFocusGroup() = "veh"
            m.npcHPDamage()
          end if
                
        else if code = 1005 ' right
          if m.game.getFocusGroup() = "veh"
            m.npcHPDamage()
          end if
          
        end if
    
    end function

    object.npcHPDamage = function()
        if m.game.veh.getNPCCol(m.game.char.getVeh().split("_").peek().toInt()) <> invalid
          if m.game.npc.getHP(m.game.veh.getNPCCol(m.game.char.getVeh().split("_").peek().toInt()).split("_").peek().toInt()) > 0
            m.game.npc.setHP(m.game.veh.getNPCCol(m.game.char.getVeh().split("_").peek().toInt()).split("_").peek().toInt(), 0)
    
            print m.game.veh.getNPCCol(m.game.char.getVeh().split("_").peek().toInt()) + " was attacked"
            print m.game.npc.getHP(m.game.veh.getNPCCol(m.game.char.getVeh().split("_").peek().toInt()).split("_").peek().toInt())
          end if
        end if
    end function

end function