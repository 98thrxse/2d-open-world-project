function action_npc(object)

    object.npc_config = testOne_npc_config() ' fix stas

    object.onCreate = function(args)
        
    end function

    ' fix stas
    object.actionHPDamage = function()

        ' for i = 0 to m.npc_config.Count() - 1
        '     if m.npc_config[i].health <= 0
        '         print "dead"
        '     end if
        ' end for

    end function

    object.onUpdate = function(dt as float)

        m.actionHPDamage()

    end function

end function