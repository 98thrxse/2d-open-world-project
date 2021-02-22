function obj_anim(object)

	object.onCreate = function(args)

		' getInstanceByName
		m.entity_wnd = m.game.getInstanceByName("obj_entity")

	end function


    object.onUpdate = function(dt as float)

        m.objAlpha()
        m.animUpdate()

    end function

    
    object.objAlpha = function()

        m.game.char.setObjIntersect(invalid)

        for i = 0 to m.game.obj.config.Count() - 1
            if m.game.char.getEntityPosX() < m.game.obj.getEntityPosX(i) + m.game.obj.getEntityW(i) and m.game.char.getEntityPosX() > m.game.obj.getEntityPosX(i) and m.game.char.getEntityPosY() + m.game.char.getEntityH() / 2 < m.game.obj.getEntityPosY(i) + m.game.obj.getEntityH(i) and m.game.char.getEntityPosY() + m.game.char.getEntityH() / 2 > m.game.obj.getEntityPosY(i)
                if m.game.obj.getAlpha(i) <> 125 then m.game.obj.setAlpha(i, 125)
                m.game.char.setObjIntersect(i)

            else
                if m.game.obj.getAlpha(i) <> 255 then m.game.obj.setAlpha(i, 255)

            end if
        end for

        if m.game.char.getObjIntersect() = invalid
            if m.game.char.getAlpha() <> 255 then m.game.char.setAlpha(255)

        else
            if m.game.char.getAlpha() <> 125 then m.game.char.setAlpha(125)

        end if

    end function


    object.animUpdate = function()

        for i = 0 to m.game.obj.config.Count() - 1
            if m.entity_wnd.getImage(m.game.obj.config[i].entity.name.toStr() + "_" + m.game.obj.config[i].id.toStr()) <> invalid
                
                ' update obj alpha
                m.entity_wnd.getImage(m.game.obj.config[i].entity.name.toStr() + "_" + m.game.obj.config[i].id.toStr()).alpha = m.game.obj.getAlpha(i)

            end if
        
        end for
    end function

end function