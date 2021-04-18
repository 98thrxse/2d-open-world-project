function obj_col(object)

    object.onCreate = function(args)
        
    end function

    object.colXY = function()
        ' position
        m.x = m.game.char.getZeroOffsetX()
        m.y = m.game.char.getZeroOffsetY()

    end function


    object.colGen = function()

        ' loading map config to create obj
        for i = 0 to m.game.obj.config.Count() - 1   
          if m.colliders[m.game.obj.config[i].col.name.toStr() + "_" + m.game.obj.config[i].id.toStr()] = invalid
            ' addColliderRectangle
            m.addColliderRectangle(m.game.obj.config[i].col.name.toStr() + "_" + m.game.obj.config[i].id.toStr(), m.game.obj.getColPosX(i), m.game.obj.getColPosY(i), m.game.obj.getColW(i), m.game.obj.getColH(i))
          
          end if
          
        end for
    
    end function
    

    object.onUpdate = function(dt as float)

        m.colXY()
        m.colGen()

    end function

    object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

        if other_collider_name = "char_col_up"
            if m.game.char.getUpCol() <> true then m.game.char.setUpCol(true)

        else if other_collider_name = "char_col_down"
            if m.game.char.getDownCol() <> true then m.game.char.setDownCol(true)

        else if other_collider_name = "char_col_left"
            if m.game.char.getLeftCol() <> true then m.game.char.setLeftCol(true)

        else if other_collider_name = "char_col_right"
            if m.game.char.getRightCol() <> true then m.game.char.setRightCol(true)

        end if

    end function

end function