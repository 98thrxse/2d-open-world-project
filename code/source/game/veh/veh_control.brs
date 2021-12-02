function veh_control(object)

  object.onCreate = function(args)

    ' getInstanceByName
    m.view_wnd = m.game.getInstanceByName("veh_view")

  end function

  object.controlPos = function()

    ' entity position
    m.view_wnd.x = m.game.map.getOffsetX()
    m.view_wnd.y = m.game.map.getOffsetY()

  end function

  object.onUpdate = function(dt as float)

    m.controlPos()

    m.controlUpdate()

end function

object.controlUpdate = function()

  for i = 0 to m.game.veh.config.Count() - 1
    if m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()) <> invalid
      
      ' update veh data
      m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).index = m.game.veh.getIndex(i)
      m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).scale_x = m.game.veh.getScaleX(i)
      m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).scale_y = m.game.veh.getScaleY(i)
      m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).offset_x = m.game.veh.getOffsetX(i)
      m.view_wnd.getImage(m.game.veh.getName(i).toStr() + "_" + i.toStr()).offset_y = m.game.veh.getOffsetY(i)

    end if

    if m.view_wnd.getCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr()) <> invalid
      m.view_wnd.getCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr()).offset_x = m.game.veh.getOffsetX(i)
      m.view_wnd.getCollider(m.game.veh.getName(i).toStr() + "_" + i.toStr()).offset_y = m.game.veh.getOffsetY(i)
    end if
  end for

end function
      
end function