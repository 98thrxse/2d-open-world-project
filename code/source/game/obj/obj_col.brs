function obj_col(object)

    object.onCreate = function(args)
        
    end function


    object.colGen = function()

        ' loading map config to create obj
        for i = 0 to m.game.obj.config.Count() - 1   
          if m.colliders[m.game.obj.getColName(i).toStr() + "_" + i.toStr()] = invalid
            ' addColliderRectangle
            m.addColliderRectangle(m.game.obj.getColName(i).toStr() + "_" + i.toStr(), m.game.obj.getColOffsetX(i), m.game.obj.getColOffsetY(i), m.game.obj.getColW(i), m.game.obj.getColH(i))
          
          end if
          
        end for
    
    end function
    

    object.onUpdate = function(dt as float)

        m.colGen()

    end function

    object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

        if other_collider_name = m.game.char.getColUpName()
            if m.game.char.getColUp() <> true then m.game.char.setColUp(true)

        else if other_collider_name = m.game.char.getColDownName()
            if m.game.char.getColDown() <> true then m.game.char.setColDown(true)

        else if other_collider_name = m.game.char.getColLeftName()
            if m.game.char.getColLeft() <> true then m.game.char.setColLeft(true)

        else if other_collider_name = m.game.char.getColRightName()
            if m.game.char.getColRight() <> true then m.game.char.setColRight(true)

        end if

    end function

end function