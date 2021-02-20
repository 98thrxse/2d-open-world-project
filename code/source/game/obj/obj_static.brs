function obj_static(object)

    object.onCreate = function(args)

        ' getInstanceByName
        m.media_wnd = m.game.getInstanceByName("obj_media")

        ' position
        m.x = m.game.screen.GetWidth() / 2 - m.game.char.getPosX()
        m.y = m.game.screen.GetHeight() / 2 - m.game.char.getPosY()

    end function

    object.objGen = function()

        ' loading map config to create obj
        for i = 0 to m.game.obj.config.Count() - 1
          if m.getImage(m.game.obj.config[i].obj_name.toStr() + "_" + m.game.obj.config[i].id.toStr()) = invalid
            ' addAnimatedImage
            m.addAnimatedImage(m.game.obj.config[i].obj_name.toStr() + "_" + m.game.obj.config[i].id.toStr(), [m.media_wnd.obj_region, invalid], { index: 0
                offset_x: m.game.obj.getPosX(i),
                offset_y: m.game.obj.getPosY(i)
            })
    
          end if
    
          if m.colliders[m.game.obj.config[i].col_name.toStr() + "_" + m.game.obj.config[i].id.toStr()] = invalid
            ' addColliderRectangle
            m.addColliderRectangle(m.game.obj.config[i].col_name.toStr() + "_" + m.game.obj.config[i].id.toStr(), m.game.obj.getPosX(i), m.game.obj.getPosY(i), m.game.obj.config[i].width, m.game.obj.config[i].height)
          
          end if
          
        end for
    
    end function
    
    
    object.posXY = function()

        m.game.char.setPosX(m.game.screen.GetWidth() / 2 - m.x)
        m.game.char.setPosY(m.game.screen.GetHeight() / 2 - m.y)

    end function

    object.onUpdate = function(dt as float)

        m.posXY()
        m.objGen()

    end function

    object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

        if other_instance.name = "char_obj" and other_collider_name = "char_col_up"
            m.game.char.setUpCollider(true)
            print "up"

        else if other_instance.name = "char_obj" and other_collider_name = "char_col_down"
            m.game.char.setDownCollider(true)
            print "down"


        else if other_instance.name = "char_obj" and other_collider_name = "char_col_left"
            m.game.char.setLeftCollider(true)
            print "left"

        else if other_instance.name = "char_obj" and other_collider_name = "char_col_right"
            m.game.char.setRightCollider(true)
            print "right"

        end if

    end function

    object.onButton = function(code as integer)

        ' held
        if code = 1002 ' up
            if m.game.char.getUpCollider() = false
                m.y += m.game.char.getUpSpeed()

            end if
                        
		else if code = 1003 ' down
            if m.game.char.getDownCollider() = false
                m.y -= m.game.char.getDownSpeed()

            end if
            
            
		else if code = 1004 ' left
            if m.game.char.getLeftCollider() = false
                m.x += m.game.char.getLeftSpeed()

            end if
            
        else if code = 1005 ' right
            if m.game.char.getRightCollider() = false
                m.x -= m.game.char.getRightSpeed()

            end if
            
        end if

        ' released
        if code = 102
            m.game.char.setDownCollider(false)
            m.game.char.setLeftCollider(false)
            m.game.char.setRightCollider(false)

        else if code = 103
            m.game.char.setUpCollider(false)
            m.game.char.setLeftCollider(false)
            m.game.char.setRightCollider(false)

        else if code = 104
            m.game.char.setUpCollider(false)
            m.game.char.setDownCollider(false)
            m.game.char.setRightCollider(false)

        else if code = 105
            m.game.char.setUpCollider(false)
            m.game.char.setDownCollider(false)
            m.game.char.setLeftCollider(false)

        end if

    end function

end function