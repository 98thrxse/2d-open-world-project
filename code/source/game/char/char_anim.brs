function char_anim(object)
  
	object.onCreate = function(args)

		' getInstanceByName
		m.entity_wnd = m.game.getInstanceByName("char_entity")

	end function

	object.onButton = function(code as integer)

		' held
        if code = 1006 ' select
			if m.game.getFocusGroup() = "char"
				m.charAttack()
			end if

		else if code = 1002 ' up
			if m.game.getFocusGroup() = "char"
				m.charWalkUp()
			end if

		else if code = 1003 ' down
			if m.game.getFocusGroup() = "char"
				m.charWalkDown()
			end if

		else if code = 1004 ' left
			if m.game.getFocusGroup() = "char"
				m.charWalkSide()
			end if

		else if code = 1005 ' right
			if m.game.getFocusGroup() = "char"
				m.charWalkSide()
			end if

		' released
		else if code = 106 ' select
			if m.game.getFocusGroup() = "char"
				m.charAfterAttack()
			end if

		else if code = 102 ' up
			if m.game.getFocusGroup() = "char"
				m.charIdleUp()
			end if
			
		else if code = 103 ' down
			if m.game.getFocusGroup() = "char"
				m.charIdleDown()
			end if

		else if code = 104 ' left
			if m.game.getFocusGroup() = "char"
				m.charIdleLeft()
			end if

		else if code = 105 ' right
			if m.game.getFocusGroup() = "char"
				m.charIdleRight()
			end if

		end if

	end function

	object.animPlay = function(arr)

		if m.animTimer = invalid
			m.animTimer = CreateObject("roTimeSpan")
			m.animTimer.Mark()
		end if

		arrAnim = []

		for each element in arr
			for i = 0 to m.game.char.config.entity.anim.reg.Count() - 1
				if m.game.char.getReg(i) = element then arrAnim.push(i)
			end for
		end for
		
		if m.animTimer.TotalMilliseconds() + 1 >= arrAnim.Count() * m.game.char.getAnimTime() then m.animTimer.Mark()
		m.game.char.setIndex(arrAnim[int(m.animTimer.TotalMilliseconds() / m.game.char.getAnimTime())])


	end function

	object.onUpdate = function(dt as float)

        m.animUpdate()

    end function


	object.charAttack = function()
		if m.game.char.getSP() >= m.game.char.getSPDamage()
			if stringUtils().include(m.game.char.getReg(m.game.char.getIndex()), "side")
				m.animPlay(["stand_side2", "attack_fist1_side", "attack_fist2_side", "attack_fist3_side", "attack_fist2_side", "attack_fist1_side", "stand_side2", "attack_fist4_side", "attack_fist5_side", "attack_fist6_side", "attack_fist5_side", "attack_fist4_side", "stand_side2", "attack_leg1_side", "attack_leg2_side", "attack_leg3_side", "attack_leg2_side", "attack_leg1_side", "stand_side2"])
			
			else if stringUtils().include(m.game.char.getReg(m.game.char.getIndex()), "front")
				m.animPlay(["stand_front1", "attack_fist1_front", "stand_front1", "attack_fist2_front", "stand_front1", "attack_leg1_front", "stand_front1"])

			else if stringUtils().include(m.game.char.getReg(m.game.char.getIndex()), "back")
				m.animPlay(["stand_back1", "attack_fist1_back", "stand_back1", "attack_fist2_back", "stand_back1", "attack_leg1_back", "stand_back1"])

			end if
		else
			m.animPlay(["sp_zero"])
		end if
	end function

	object.charWalkUp = function()
		m.animPlay(["walk_back1", "stand_back1", "walk_back2"])
	end function

	object.charWalkDown = function()
		m.animPlay(["walk_front1", "stand_front1", "walk_front2"])
	end function

	object.charWalkSide = function()
		m.animPlay(["walk_side1", "stand_side1", "walk_side2"])
	end function

	object.charAfterAttack = function()
		if m.game.char.getSP() >= m.game.char.getSPDamage()
			if stringUtils().include(m.game.char.getReg(m.game.char.getIndex()), "side")
				m.animPlay(["stand_side2"])
			else if stringUtils().include(m.game.char.getReg(m.game.char.getIndex()), "front")
				m.animPlay(["stand_front2"])

			else if stringUtils().include(m.game.char.getReg(m.game.char.getIndex()), "back")
				m.animPlay(["stand_back2"])
			end if
		else
			m.animPlay(["sp_zero"])
		end if
	end function

	object.charIdleUp = function()
		m.animTimer = invalid
		m.animPlay(["stand_back1"])
	end function

	object.charIdleDown = function()
		m.animTimer = invalid
		m.animPlay(["stand_front1"])
	end function

	object.charIdleLeft = function()
		m.animTimer = invalid
		m.animPlay(["stand_side1"])
	end function

	object.charIdleRight = function()
		m.animTimer = invalid
		m.animPlay(["stand_side1"])
	end function

    object.animUpdate = function()

        if m.entity_wnd.getImage(m.game.char.getEntityName()) <> invalid

			' update char alpha
			m.entity_wnd.getImage(m.game.char.getEntityName()).alpha = m.game.char.getAlpha()
			m.entity_wnd.getImage(m.game.char.getEntityName()).index = m.game.char.getIndex()
			m.entity_wnd.getImage(m.game.char.getEntityName()).scale_x = m.game.char.getScaleX()
			m.entity_wnd.getImage(m.game.char.getEntityName()).scale_y = m.game.char.getScaleY()
			m.entity_wnd.getImage(m.game.char.getEntityName()).offset_x = m.game.char.getEntityOffsetX()
			m.entity_wnd.getImage(m.game.char.getEntityName()).offset_y = m.game.char.getEntityOffsetY()

        end if
        
    end function
    
end function