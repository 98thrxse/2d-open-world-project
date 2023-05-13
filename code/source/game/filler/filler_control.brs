sub filler_control(object)

    object.onCreate = sub(args as object)

        ' getInstanceByName
        m.view_wnd = m.game.getInstanceByName("filler_view")

    end sub

    object.updatePos = sub()

        ' position
        m.view_wnd.x = m.game.map.getOffsetX()
        m.view_wnd.y = m.game.map.getOffsetY()

    end sub

    object.playAnim = sub(i as integer, j as integer, arr as object)

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

        if m.timer.TotalMilliseconds() + 1 >= arrAnim.Count() * m.game.filler.getAnimTime(i, j) then m.timer.Mark()
		m.game.filler.setIndex(i, j, arrAnim[int(m.timer.TotalMilliseconds() / m.game.filler.getAnimTime(i, j))])

	end sub

    object.updateView = sub()

        for i = 0 to m.game.filler.config.Count() - 1
            for j = 0 to m.game.filler.config[i].Count() - 1
                if m.view_wnd.getImage(m.game.filler.getName(i, j).toStr() + "_" + i.toStr() + j.toStr()) <> invalid
                    
                    ' update filler data
                    m.view_wnd.getImage(m.game.filler.getName(i, j).toStr() + "_" + i.toStr() + j.toStr()).index = m.game.filler.getIndex(i, j)

                end if
            end for
        end for

	end sub

    object.autoPlayAnim = sub()
        for i = 0 to m.game.filler.config.Count() - 1
            for j = 0 to m.game.filler.config[i].Count() - 1
                m.playAnim(i, j, m.game.filler.getReg(i, j))
            end for
        end for
    end sub

    object.onUpdate = sub(dt as float)

        m.updatePos()
        m.autoPlayAnim()
        m.updateView()

    end sub
    
end sub