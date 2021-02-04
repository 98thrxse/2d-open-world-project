function npc_obj(object)

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

  ' addAnimatedImage
    m.obj = m.addAnimatedImage("npc_obj", [stand_front_region, stand_back_region, stand_side_region, walk_front1_region, walk_front2_region, walk_back1_region, walk_back2_region, walk_side1_region, walk_side2_region], { index: 0
      offset_x: 300,
      offset_y: 200
    })

    ' addColliderRectangle
    m.addColliderRectangle("npc_col", m.obj.offset_x, m.obj.offset_y, stand_front_region.GetWidth(), stand_front_region.GetHeight())

  end function

  object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

    if other_instance.name = "character_obj" and other_collider_name = "character_col_up"
      character_setUpCollider(true)
      character_setNPCCollider(true)

    else if other_instance.name = "character_obj" and other_collider_name = "character_col_down"
      character_setDownCollider(true)
      character_setNPCCollider(true)

    else if other_instance.name = "character_obj" and other_collider_name = "character_col_left"
      character_setLeftCollider(true)
      character_setNPCCollider(true)

    else if other_instance.name = "character_obj" and other_collider_name = "character_col_right"
      character_setRightCollider(true)
      character_setNPCCollider(true)

    end if

  end function
  
  object.onButton = function(code as integer)

    ' held
    if code = 1002 ' up

      if character_getUpCollider() = false
        m.y += character_getUpSpeed()
        character_setDownCollider(false)
        character_setLeftCollider(false)
        character_setRightCollider(false)
        character_setNPCCollider(false)

      end if
                    
    else if code = 1003 ' down

      if character_getDownCollider() = false
        m.y -= character_getDownSpeed()
        character_setUpCollider(false)
        character_setLeftCollider(false)
        character_setRightCollider(false)
        character_setNPCCollider(false)

      end if
        
        
    else if code = 1004 ' left

      if character_getLeftCollider() = false
        m.x += character_getLeftSpeed()
        character_setUpCollider(false)
        character_setDownCollider(false)
        character_setRightCollider(false)
        character_setNPCCollider(false)

      end if
        
    else if code = 1005 ' right

      if character_getRightCollider() = false
        m.x -= character_getRightSpeed()
        character_setUpCollider(false)
        character_setDownCollider(false)
        character_setLeftCollider(false)
        character_setNPCCollider(false)

      end if
        
    end if

  end function
      
end function