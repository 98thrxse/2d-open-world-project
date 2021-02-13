function action_char(object)

    object.onCreate = function(args)
        
    end function
    

    object.onButton = function(code as integer)
        
        ' held
        if code = 1006
            if m.game.user.getSP() >= m.game.user.getSPDamage()
                m.actionSPDamage()

            end if

        end if

    end function

    object.actionSPDamage = function()

        if m.sp_damage_timer = invalid
            m.game.user.setSP(m.game.user.getSP() - m.game.user.getSPDamage())
			m.sp_damage_timer = CreateObject("roTimeSpan")
            m.sp_damage_timer.Mark()

        end if

        if m.sp_damage_timer.TotalMilliseconds() + 1 >= m.game.user.getSPDamageTime()
            m.sp_damage_timer = invalid

        end if

    end function

    object.actionSPRegen = function()

        if m.sp_regen_timer = invalid
            m.sp_regen_timer = CreateObject("roTimeSpan")
            m.sp_regen_timer.Mark()

        end if

        if m.sp_regen_timer.TotalMilliseconds() + 1 >= m.game.user.getSPRegenTime()
            m.game.user.setSP(m.game.user.getSP() + m.game.user.getSPRegen())
            m.sp_regen_timer = invalid

        end if

    end function


    object.onUpdate = function(dt as float)

        if m.game.user.getSP() < 100 ' fix stas
            m.actionSPRegen()

        end if

    end function

end function