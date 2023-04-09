function filler_control(object)

    object.onCreate = function(args)

        ' getInstanceByName
        m.view_wnd = m.game.getInstanceByName("filler_view")

    end function

    object.controlPos = function()

        ' position
        m.view_wnd.x = m.game.map.getOffsetX()
        m.view_wnd.y = m.game.map.getOffsetY()

    end function

    ' stas
    object.animPlay = function(i, j, arr)

		if m.timer = invalid
			m.timer = CreateObject("roTimeSpan")
			m.timer.Mark()
		end if

		arrAnim = []

		for each element in arr
            for k = 0 to m.game.filler.config[i][j].reg.Count() - 1
                if m.game.filler.getRegElement(i, j, k) = element then arrAnim.push(k)
            end for
        end for

        if m.timer.TotalMilliseconds() + 1 >= arrAnim.Count() * m.game.filler.getAnimTime(i, j) then m.timer.Mark() ' * 1000 - AnimTime
		m.game.filler.setIndex(i, j, arrAnim[int(m.timer.TotalMilliseconds() / m.game.filler.getAnimTime(i, j))]) ' / 1000 - AnimTime

	end function

    object.controlUpdate = function()

        for i = 0 to m.game.filler.config.Count() - 1
            for j = 0 to m.game.filler.config[i].Count() - 1
                if m.view_wnd.getImage(m.game.filler.getName(i, j).toStr() + "_" + i.toStr() + j.toStr()) <> invalid
                    
                    ' update filler data
                    m.view_wnd.getImage(m.game.filler.getName(i, j).toStr() + "_" + i.toStr() + j.toStr()).index = m.game.filler.getIndex(i, j)

                end if
            end for
        end for

	end function

    object.autoAnimPlay = function()
        for i = 0 to m.game.filler.config.Count() - 1
            for j = 0 to m.game.filler.config[i].Count() - 1
                m.animPlay(i, j, ["filler_02", "filler_01"])
            end for
        end for
    end function

    object.onUpdate = function(dt as float)

        m.controlPos()
        m.autoAnimPlay()
        m.controlUpdate()

    end function
    
end function