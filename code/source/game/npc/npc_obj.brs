function npc_obj(object)

  object.onCreate = function(args)

    ' createInstance
    m.media_wnd = m.game.createInstance("npc_media")
    
    ' window initialization
    m.stand_front_region = m.media_wnd.stand_front_region
    m.stand_back_region = m.media_wnd.stand_back_region
    m.stand_side_region = m.media_wnd.stand_side_region
    
    m.walk_front1_region = m.media_wnd.walk_front1_region
    m.walk_front2_region = m.media_wnd.walk_front2_region
    m.walk_back1_region = m.media_wnd.walk_back1_region
    m.walk_back2_region = m.media_wnd.walk_back2_region
    m.walk_side1_region = m.media_wnd.walk_side1_region
    m.walk_side2_region = m.media_wnd.walk_side2_region

    m.beaten_region = m.media_wnd.beaten_region

    ' position
    m.x = m.game.screen.GetWidth() / 2 - m.game.char.getPosX()
    m.y = m.game.screen.GetHeight() / 2 - m.game.char.getPosY()

  end function


  object.npcGen = function()

    ' loading map config to create npc
    for i = 0 to m.game.npc.config.Count() - 1
      if m.getImage(m.game.npc.config[i].obj_name.toStr() + "_" + m.game.npc.config[i].id.toStr()) = invalid
        ' addAnimatedImage
        m.addAnimatedImage(m.game.npc.config[i].obj_name.toStr() + "_" + m.game.npc.config[i].id.toStr(), [m.stand_front_region, m.stand_back_region, m.stand_side_region, m.walk_front1_region, m.walk_front2_region, m.walk_back1_region, m.walk_back2_region, m.walk_side1_region, m.walk_side2_region, m.beaten_region], { index: m.game.npc.npcGetAnim(i)
          offset_x: m.game.npc.config[i].offset_x,
          offset_y: m.game.npc.config[i].offset_y
        })

      end if

      if m.colliders[m.game.npc.config[i].col_name.toStr() + "_" + m.game.npc.config[i].id.toStr()] = invalid
        ' addColliderRectangle
        m.addColliderRectangle(m.game.npc.config[i].col_name.toStr() + "_" + m.game.npc.config[i].id.toStr(), m.game.npc.config[i].offset_x, m.game.npc.config[i].offset_y, m.game.npc.config[i].width, m.game.npc.config[i].height)
      end if
      
    end for

  end function


  object.posXY = function()

    m.game.char.setPosX(m.game.screen.GetWidth() / 2 - m.x)
    m.game.char.setPosY(m.game.screen.GetHeight() / 2 - m.y)

  end function

  object.onUpdate = function(dt as float)

    m.posXY()
    m.npcGen()

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
      m.game.char.setNPCCollider(invalid)

    else if code = 103
      m.game.char.setNPCCollider(invalid)

    else if code = 104
      m.game.char.setNPCCollider(invalid)


    else if code = 105
      m.game.char.setNPCCollider(invalid)

    end if

  end function
      
end function