function npc_obj(object)

  object.control_options = {

    collider: {
        up: false,
        down: false
        left: false,
        right: false
    }

    speed: {
        up: 3,
        down: 3,
        left: 3,
        right: 3
    }
  }

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

    if other_instance.name = "player_obj" and other_collider_name = "player_col_up"
        m.control_options.collider.up = true

    else if other_instance.name = "player_obj" and other_collider_name = "player_col_down"
        m.control_options.collider.down = true

    else if other_instance.name = "player_obj" and other_collider_name = "player_col_left"
        m.control_options.collider.left = true

    else if other_instance.name = "player_obj" and other_collider_name = "player_col_right"
        m.control_options.collider.right = true

    end if

  end function
  
  object.onButton = function(code as integer)

    ' held
    if code = 1002 ' up

      if m.control_options.collider.up = false
        m.y += m.control_options.speed.up
        m.control_options.collider.down = false
        m.control_options.collider.left = false
        m.control_options.collider.right = false

      end if
                    
    else if code = 1003 ' down

      if m.control_options.collider.down = false
        m.y -= m.control_options.speed.down
        m.control_options.collider.up = false
        m.control_options.collider.left = false
        m.control_options.collider.right = false

      end if
        
        
    else if code = 1004 ' left

      if m.control_options.collider.left = false
        m.x += m.control_options.speed.left
        m.control_options.collider.up = false
        m.control_options.collider.down = false
        m.control_options.collider.right = false

      end if
        
    else if code = 1005 ' right

      if m.control_options.collider.right = false
        m.x -= m.control_options.speed.right
        m.control_options.collider.up = false
        m.control_options.collider.down = false
        m.control_options.collider.left = false

      end if
        
    end if

  end function
      
end function