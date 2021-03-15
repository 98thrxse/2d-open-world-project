function char_anim(object)
  
	object.onCreate = function(args)

		' getInstanceByName
		m.entity_wnd = m.game.getInstanceByName("char_entity")

	end function

	object.onButton = function(code as integer)

		' held
        if code = 1006 ' select
			if m.game.char.getSP() >= m.game.char.getSPDamage()
				m.playAnim([11,12,13,14,13,12,11,15,16,17,16,15,11,18,19,20,19,18,11])
			else
				m.playAnim([10])
			end if

		else if code = 1002 ' up
			m.playAnim([3,0,4])

		else if code = 1003 ' down
			m.playAnim([5,1,6])

		else if code = 1004 ' left
			m.playAnim([7,2,8])

		else if code = 1005 ' right
			m.playAnim([7,2,8])

		' released
		else if code = 106 ' select
			if m.game.char.getSP() >= m.game.char.getSPDamage()
				m.playAnim([11])
			else
				m.playAnim([10])
			end if

		else if code = 102 ' up
			m.timer = invalid
			m.playAnim([0])
			
		else if code = 103 ' down
			m.timer = invalid
			m.playAnim([1])

		else if code = 104 ' left
			m.timer = invalid
			m.playAnim([2])

		else if code = 105 ' right
			m.timer = invalid
			m.playAnim([2])

		end if

	end function

	object.playAnim = function(arr)

		if m.game.data.getFocus() = "char"
			if m.timer = invalid
				m.timer = CreateObject("roTimeSpan")
				m.timer.Mark()
			end if

			if m.timer.TotalMilliseconds() + 1 >= arr.Count() * m.game.char.getAnimTime() then m.timer.Mark()
			m.entity_wnd.entity.index = arr[int(m.timer.TotalMilliseconds() / m.game.char.getAnimTime())]

		end if

	end function

	object.onUpdate = function(dt as float)

        m.animUpdate()

    end function


    object.animUpdate = function()

        if m.entity_wnd.getImage("char_entity") <> invalid
                
			' update char alpha
			m.entity_wnd.getImage("char_entity").alpha = m.game.char.getAlpha()

        end if
        
    end function
    
end function