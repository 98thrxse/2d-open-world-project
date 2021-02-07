function action_char_npc(object)

    object.npc_config = testOne_npc_config() ' fix stas

    object.onCreate = function(args)
        
    end function
    

    object.onButton = function(code as integer)
        
        ' held
        if code = 1006
            if char_getSP() >= char_getSPDamage()
                m.charSPDamage()
                m.npcHPDamage()

            end if

        end if

    end function

    object.npcHPDamage = function()

        if m.hp_damage_timer = invalid
            if char_getNPCCollider() <> invalid
                id = right(char_getNPCCollider(), 1).toInt()
                m.npc_config[id].health -= char_getHPDamage()

                print char_getNPCCollider() + " was attacked"
                print m.npc_config[id].health

            end if

			m.hp_damage_timer = CreateObject("roTimeSpan")
            m.hp_damage_timer.Mark()

        end if
        
        if m.hp_damage_timer.TotalMilliseconds() + 1 >= char_getSPDamageTime()
            m.hp_damage_timer = invalid

        end if

    end function

    object.charSPDamage = function()

        if m.sp_damage_timer = invalid
            char_setSP(char_getSP() - char_getSPDamage())
			m.sp_damage_timer = CreateObject("roTimeSpan")
            m.sp_damage_timer.Mark()

        end if

        if m.sp_damage_timer.TotalMilliseconds() + 1 >= char_getSPDamageTime()
            m.sp_damage_timer = invalid

        end if

    end function

    object.charSPRegen = function()

        if m.sp_regen_timer = invalid
            m.sp_regen_timer = CreateObject("roTimeSpan")
            m.sp_regen_timer.Mark()

        end if

        if m.sp_regen_timer.TotalMilliseconds() + 1 >= char_getSPRegenTime()
            char_setSP(char_getSP() + char_getSPRegen())
            m.sp_regen_timer = invalid

        end if

    end function


    object.onUpdate = function(dt as float)

        if char_getSP() < 100 ' max sp fix stas
            m.charSPRegen()

        end if

    end function

end function