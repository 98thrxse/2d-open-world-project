function char_act(object)

    object.onCreate = function(args)
        
    end function
    

    object.onButton = function(code as integer)
        
        ' held
        if code = 1006
            if m.game.char.getSP() >= m.game.char.getSPDamage()
                m.actSPDamage()

            end if

        end if

    end function

    object.actSPDamage = function()

        if m.sp_damage_timer = invalid
            m.game.char.setSP(m.game.char.getSP() - m.game.char.getSPDamage())
			m.sp_damage_timer = CreateObject("roTimeSpan")
            m.sp_damage_timer.Mark()

        end if

        if m.sp_damage_timer.TotalMilliseconds() + 1 >= m.game.char.getSPDamageTime()
            m.sp_damage_timer = invalid

        end if

    end function

    object.actSPRegen = function()

        if m.sp_regen_timer = invalid
            m.sp_regen_timer = CreateObject("roTimeSpan")
            m.sp_regen_timer.Mark()

        end if

        if m.sp_regen_timer.TotalMilliseconds() + 1 >= m.game.char.getSPRegenTime()
            m.game.char.setSP(m.game.char.getSP() + m.game.char.getSPRegen())
            m.sp_regen_timer = invalid

        end if

    end function


    object.onUpdate = function(dt as float)

        if m.game.char.getSP() < 100
            m.actSPRegen()

        end if

    end function

end function