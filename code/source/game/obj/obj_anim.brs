function obj_anim(object)

	object.onCreate = function(args)

		' getInstanceByName
		m.entity_wnd = m.game.getInstanceByName("obj_entity")

	end function


    object.onUpdate = function(dt as float)

        m.animUpdate()

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