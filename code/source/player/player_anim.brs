function player_anim(object)

	object.anim_options = {
		frame_one: 100
		frame_two: 200
		timer: CreateObject("roTimeSpan")
	}
    
	object.onCreate = function(args)

		' createInstance
		obj_wnd = m.game.createInstance("player_obj")

		' window initialization
		m.obj = obj_wnd.obj

	end function
	
	object.onButton = function(code as integer)

		' held
		if code = 1002 ' up
			if m.anim_options.timer = invalid
				m.anim_options.timer = CreateObject("roTimeSpan")
				m.anim_options.timer.Mark()
			end if

			if m.anim_options.timer.TotalMilliseconds() < m.anim_options.frame_one
				m.obj.index = 5
			else if m.anim_options.timer.TotalMilliseconds() > m.anim_options.frame_one and m.anim_options.timer.TotalMilliseconds() < m.anim_options.frame_two
				m.obj.index = 6
			else if m.anim_options.timer.TotalMilliseconds() > m.anim_options.frame_one and m.anim_options.timer.TotalMilliseconds() > m.anim_options.frame_two
				m.anim_options.timer = invalid
			end if

		else if code = 1003 ' down
			if m.anim_options.timer = invalid
				m.anim_options.timer = CreateObject("roTimeSpan")
				m.anim_options.timer.Mark()
			end if

			if m.anim_options.timer.TotalMilliseconds() < m.anim_options.frame_one
				m.obj.index = 3
			else if m.anim_options.timer.TotalMilliseconds() > m.anim_options.frame_one and m.anim_options.timer.TotalMilliseconds() < m.anim_options.frame_two
				m.obj.index = 4
			else if m.anim_options.timer.TotalMilliseconds() > m.anim_options.frame_one and m.anim_options.timer.TotalMilliseconds() > m.anim_options.frame_two
				m.anim_options.timer = invalid
			end if

		else if code = 1004 ' left
			if m.anim_options.timer = invalid
				m.anim_options.timer = CreateObject("roTimeSpan")
				m.anim_options.timer.Mark()
			end if

			if m.anim_options.timer.TotalMilliseconds() < m.anim_options.frame_one
				m.obj.index = 7
			else if m.anim_options.timer.TotalMilliseconds() > m.anim_options.frame_one and m.anim_options.timer.TotalMilliseconds() < m.anim_options.frame_two
				m.obj.index = 8
			else if m.anim_options.timer.TotalMilliseconds() > m.anim_options.frame_one and m.anim_options.timer.TotalMilliseconds() > m.anim_options.frame_two
				m.anim_options.timer = invalid
			end if

		else if code = 1005 ' right
			if m.anim_options.timer = invalid
				m.anim_options.timer = CreateObject("roTimeSpan")
				m.anim_options.timer.Mark()
			end if

			if m.anim_options.timer.TotalMilliseconds() < 100
				m.obj.index = 7
			else if m.anim_options.timer.TotalMilliseconds() > m.anim_options.frame_one and m.anim_options.timer.TotalMilliseconds() < m.anim_options.frame_two
				m.obj.index = 8
			else if m.anim_options.timer.TotalMilliseconds() > m.anim_options.frame_one and m.anim_options.timer.TotalMilliseconds() > m.anim_options.frame_two
				m.anim_options.timer = invalid
			end if

		' released
		else if code = 102 ' up
			m.obj.index = 1

		else if code = 103 ' down
			m.obj.index = 0

		else if code = 104 ' left
			m.obj.index = 2
			
		else if code = 105 ' right
			m.obj.index = 2
			
		end if

	end function
    
end function