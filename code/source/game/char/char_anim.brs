function char_anim(object)
  
	object.onCreate = function(args)

		' getInstanceByName
		obj_wnd = m.game.getInstanceByName("char_entity")

		' window initialization
		m.obj = obj_wnd.obj

	end function

	object.onButton = function(code as integer)

		' held
        if code = 1006 ' select
			m.playAnim([10,11,12,13,12,11,10,14,15,16,15,14,10,17,18,19,18,17,10])

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
			m.playAnim([10])

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

		if m.timer = invalid
			m.timer = CreateObject("roTimeSpan")
			m.timer.Mark()
		end if

		if m.timer.TotalMilliseconds() + 1 >= arr.Count() * m.game.char.getAnimTime() then m.timer.Mark()
		m.obj.index = arr[int(m.timer.TotalMilliseconds() / m.game.char.getAnimTime())]

	end function
    
end function