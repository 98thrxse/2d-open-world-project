function character_anim(object)
  
	object.onCreate = function(args)

		' createInstance
		obj_wnd = m.game.createInstance("character_obj")

		' window initialization
		m.obj = obj_wnd.obj

	end function

	object.onButton = function(code as integer)

		' held
		if code = 1002 ' up
			m.playAnim([3,4])

		else if code = 1003 ' down
			m.playAnim([5,6])

		else if code = 1004 ' left
			m.playAnim([7,8])

		else if code = 1005 ' right
			m.playAnim([7,8])

		' released
		else if code = 102 ' up
			m.timer = invalid
			m.obj.index = 0

		else if code = 103 ' down
			m.timer = invalid
			m.obj.index = 1

		else if code = 104 ' left
			m.timer = invalid
			m.obj.index = 2
			
		else if code = 105 ' right
			m.timer = invalid
			m.obj.index = 2			

		end if

	end function

	object.playAnim = function(arr)

		if m.timer = invalid
			m.timer = CreateObject("roTimeSpan")
			m.timer.Mark()
		end if

		if m.timer.TotalMilliseconds() + 1 >= arr.Count() * character_getAnimTime() then m.timer.Mark()
		m.obj.index = arr[int(m.timer.TotalMilliseconds() / character_getAnimTime())]

	end function
    
end function