function npc_obj(object)

  object.map_config = testOne_npc_config() ' fix stas

  object.onCreate = function(args)

    ' createInstance
    m.media_wnd = m.game.createInstance("npc_media")
    
    ' window initialization
    stand_front_region = m.media_wnd.stand_front_region
    stand_back_region = m.media_wnd.stand_back_region
    stand_side_region = m.media_wnd.stand_side_region
    
    walk_front1_region = m.media_wnd.walk_front1_region
    walk_front2_region = m.media_wnd.walk_front2_region
    walk_back1_region = m.media_wnd.walk_back1_region
    walk_back2_region = m.media_wnd.walk_back2_region
    walk_side1_region = m.media_wnd.walk_side1_region
    walk_side2_region = m.media_wnd.walk_side2_region

    ' loading map config to create npc
    for i = 0 to m.map_config.Count() - 1
      
      ' addAnimatedImage
      m.obj = m.addAnimatedImage(m.map_config[i].obj_name.toStr() + m.map_config[i].id.toStr(), [stand_front_region, stand_back_region, stand_side_region, walk_front1_region, walk_front2_region, walk_back1_region, walk_back2_region, walk_side1_region, walk_side2_region], { index: 0
        offset_x: m.map_config[i].offset_x,
        offset_y: m.map_config[i].offset_y
      })


      ' addColliderRectangle
      m.addColliderRectangle(m.map_config[i].col_name.toStr() + m.map_config[i].id.toStr(), m.map_config[i].offset_x, m.map_config[i].offset_y, m.map_config[i].width, m.map_config[i].height)
    
    end for

  end function

  object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

    if other_instance.name = "char_obj" and other_collider_name = "char_col_up"
      ' char_setUpCollider(true)
      char_setNPCCollider(true)

    else if other_instance.name = "char_obj" and other_collider_name = "char_col_down"
      ' char_setDownCollider(true)
      char_setNPCCollider(true)

    else if other_instance.name = "char_obj" and other_collider_name = "char_col_left"
      ' char_setLeftCollider(true)
      char_setNPCCollider(true)

    else if other_instance.name = "char_obj" and other_collider_name = "char_col_right"
      ' char_setRightCollider(true)
      char_setNPCCollider(true)

    end if

  end function
  
  object.onButton = function(code as integer)

    ' held
    if code = 1002 ' up

      if char_getUpCollider() = false
        m.y += char_getUpSpeed()
        ' char_setDownCollider(false)
        ' char_setLeftCollider(false)
        ' char_setRightCollider(false)
        char_setNPCCollider(false)

      end if
                    
    else if code = 1003 ' down

      if char_getDownCollider() = false
        m.y -= char_getDownSpeed()
        ' char_setUpCollider(false)
        ' char_setLeftCollider(false)
        ' char_setRightCollider(false)
        char_setNPCCollider(false)

      end if
        
        
    else if code = 1004 ' left

      if char_getLeftCollider() = false
        m.x += char_getLeftSpeed()
        ' char_setUpCollider(false)
        ' char_setDownCollider(false)
        ' char_setRightCollider(false)
        char_setNPCCollider(false)

      end if
        
    else if code = 1005 ' right

      if char_getRightCollider() = false
        m.x -= char_getRightSpeed()
        ' char_setUpCollider(false)
        ' char_setDownCollider(false)
        ' char_setLeftCollider(false)
        char_setNPCCollider(false)

      end if
        
    end if

  end function
      
end function