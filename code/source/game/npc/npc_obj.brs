function npc_obj(object)

  object.npc_config = testOne_npc_config() ' fix stas

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

    ' position
    m.x = m.game.screen.GetWidth() / 2 - m.game.char.getPosX()
    m.y = m.game.screen.GetHeight() / 2 - m.game.char.getPosY()

    ' loading map config to create npc
    for i = 0 to m.npc_config.Count() - 1
      
      ' addAnimatedImage
      m.obj = m.addAnimatedImage(m.npc_config[i].obj_name.toStr() + "_" + m.npc_config[i].id.toStr(), [stand_front_region, stand_back_region, stand_side_region, walk_front1_region, walk_front2_region, walk_back1_region, walk_back2_region, walk_side1_region, walk_side2_region], { index: 0
        offset_x: m.npc_config[i].offset_x,
        offset_y: m.npc_config[i].offset_y
      })


      ' addColliderRectangle
      m.addColliderRectangle(m.npc_config[i].col_name.toStr() + "_" + m.npc_config[i].id.toStr(), m.npc_config[i].offset_x, m.npc_config[i].offset_y, m.npc_config[i].width, m.npc_config[i].height)
    
    end for

  end function

  object.posXY = function()

    m.game.char.setPosX(m.game.screen.GetWidth() / 2 - m.x)
    m.game.char.setPosY(m.game.screen.GetHeight() / 2 - m.y)

  end function

  object.onUpdate = function(dt as float)

    m.posXY()

  end function

  object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)

    if other_instance.name = "char_obj" and other_collider_name = "char_col_up"
      m.game.char.setNPCCollider(collider_name)

    else if other_instance.name = "char_obj" and other_collider_name = "char_col_down"
      m.game.char.setNPCCollider(collider_name)

    else if other_instance.name = "char_obj" and other_collider_name = "char_col_left"
      m.game.char.setNPCCollider(collider_name)

    else if other_instance.name = "char_obj" and other_collider_name = "char_col_right"
      m.game.char.setNPCCollider(collider_name)

    end if

  end function
  
  object.onButton = function(code as integer)

    ' held
    if code = 1002 ' up

      if m.game.char.getUpCollider() = false
        m.y += m.game.char.getUpSpeed()
        m.game.char.setNPCCollider(invalid)

      end if
                    
    else if code = 1003 ' down

      if m.game.char.getDownCollider() = false
        m.y -= m.game.char.getDownSpeed()
        m.game.char.setNPCCollider(invalid)

      end if
        
        
    else if code = 1004 ' left

      if m.game.char.getLeftCollider() = false
        m.x += m.game.char.getLeftSpeed()
        m.game.char.setNPCCollider(invalid)

      end if
        
    else if code = 1005 ' right

      if m.game.char.getRightCollider() = false
        m.x -= m.game.char.getRightSpeed()
        m.game.char.setNPCCollider(invalid)

      end if
        
    end if

  end function
      
end function