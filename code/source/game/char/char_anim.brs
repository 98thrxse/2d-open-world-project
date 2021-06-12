function char_anim(object)
  
	object.onCreate = function(args)

		' getInstanceByName
		m.entity_wnd = m.game.getInstanceByName("char_entity")

	end function

	object.onButton = function(code as integer)

		' held
        if code = 1006 ' select
			if m.game.getFocusGroup() = "char"
				if m.game.char.getSP() >= m.game.char.getSPDamage()
					m.playAnim(["stand_side2", "attack_fist1_side", "attack_fist2_side", "attack_fist3_side", "attack_fist2_side", "attack_fist1_side", "stand_side2", "attack_fist4_side", "attack_fist5_side", "attack_fist6_side", "attack_fist5_side", "attack_fist4_side", "stand_side2", "attack_leg1_side", "attack_leg2_side", "attack_leg3_side", "attack_leg2_side", "attack_leg1_side", "stand_side2"])
				else
					m.playAnim(["sp_zero"])
				end if
			end if

		else if code = 1002 ' up
			if m.game.getFocusGroup() = "char"
				m.playAnim(["walk_back1", "stand_back1", "walk_back2"])
			end if

		else if code = 1003 ' down
			if m.game.getFocusGroup() = "char"
				m.playAnim(["walk_front1", "stand_front1", "walk_front2"])
			end if

		else if code = 1004 ' left
			if m.game.getFocusGroup() = "char"
				m.playAnim(["walk_side1", "stand_side1", "walk_side2"])
			end if

		else if code = 1005 ' right
			if m.game.getFocusGroup() = "char"
				m.playAnim(["walk_side1", "stand_side1", "walk_side2"])
			end if

		' released
		else if code = 106 ' select
			if m.game.getFocusGroup() = "char"
				if m.game.char.getSP() >= m.game.char.getSPDamage()
					m.playAnim(["stand_side2"])
				else
					m.playAnim(["sp_zero"])

				end if

			end if

		else if code = 102 ' up
			if m.game.getFocusGroup() = "char"
				m.timer = invalid
				m.playAnim(["stand_back1"])

			end if
			
		else if code = 103 ' down
			if m.game.getFocusGroup() = "char"
				m.timer = invalid
				m.playAnim(["stand_front1"])
			
			end if

		else if code = 104 ' left
			if m.game.getFocusGroup() = "char"
				m.timer = invalid
				m.playAnim(["stand_side1"])
			
			end if

		else if code = 105 ' right
			if m.game.getFocusGroup() = "char"
				m.timer = invalid
				m.playAnim(["stand_side1"])

			end if

		end if

	end function

	object.playAnim = function(arr)

		if m.timer = invalid
			m.timer = CreateObject("roTimeSpan")
			m.timer.Mark()
		end if

		arrAnim = []

		for each element in arr
			for i = 0 to m.game.char.config.entity.anim.reg.Count() - 1
				if m.game.char.getReg(i) = element then arrAnim.push(i)
			end for
		end for
		
		if m.timer.TotalMilliseconds() + 1 >= arrAnim.Count() * m.game.char.getAnimTime() then m.timer.Mark()
		m.game.char.setIndex(arrAnim[int(m.timer.TotalMilliseconds() / m.game.char.getAnimTime())])


	end function

	object.onUpdate = function(dt as float)

        m.animUpdate()

    end function


    object.animUpdate = function()

        if m.entity_wnd.getImage(m.game.char.getEntityName()) <> invalid

			' update char alpha
			if m.entity_wnd.getImage(m.game.char.getEntityName()).alpha <> m.game.char.getAlpha() then m.entity_wnd.getImage("char_entity").alpha = m.game.char.getAlpha()
			if m.entity_wnd.getImage(m.game.char.getEntityName()).index <> m.game.char.getIndex() then m.entity_wnd.getImage("char_entity").index = m.game.char.getIndex()
			if m.entity_wnd.getImage(m.game.char.getEntityName()).scale_x <> m.game.char.getScaleX() then m.entity_wnd.getImage("char_entity").scale_x = m.game.char.getScaleX()
			if m.entity_wnd.getImage(m.game.char.getEntityName()).scale_y <> m.game.char.getScaleY() then m.entity_wnd.getImage("char_entity").scale_y = m.game.char.getScaleY()
			if m.entity_wnd.getImage(m.game.char.getEntityName()).offset_x <> m.game.char.getEntityOffsetX() then m.entity_wnd.getImage("char_entity").offset_x = m.game.char.getEntityOffsetX()
			if m.entity_wnd.getImage(m.game.char.getEntityName()).offset_y <> m.game.char.getEntityOffsetY() then m.entity_wnd.getImage("char_entity").offset_y = m.game.char.getEntityOffsetY()

        end if
        
    end function
    
end function