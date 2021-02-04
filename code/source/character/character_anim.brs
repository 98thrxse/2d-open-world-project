function character_anim(object)

	object.anim_options = {
		time: 100
		timer: invalid
	}
    
	object.onCreate = function(args)

		' createInstance
		obj_wnd = m.game.createInstance("character_obj")

		' window initialization
		m.obj = obj_wnd.obj

	end function

	object.onButton = function(code as integer)

		' held
		if code = 1002 ' up
			m.animationTimer([3,4])

		else if code = 1003 ' down
			m.animationTimer([5,6])

		else if code = 1004 ' left
			m.animationTimer([7,8])

		else if code = 1005 ' right
			m.animationTimer([7,8])

		' released
		else if code = 102 ' up
			m.anim_options.timer = invalid
			m.obj.index = 0

		else if code = 103 ' down
			m.anim_options.timer = invalid
			m.obj.index = 1

		else if code = 104 ' left
			m.anim_options.timer = invalid
			m.obj.index = 2
			
		else if code = 105 ' right
			m.anim_options.timer = invalid
			m.obj.index = 2			

		end if

	end function

	object.animationTimer = function(arr)

		if m.anim_options.timer = invalid
			m.anim_options.timer = CreateObject("roTimeSpan")
			m.anim_options.timer.Mark()
		end if

		if m.anim_options.timer.TotalMilliseconds() + 1 >= arr.Count() * m.anim_options.time then m.anim_options.timer.Mark()
		m.obj.index = arr[int(m.anim_options.timer.TotalMilliseconds() / m.anim_options.time)]

	end function
    
end function