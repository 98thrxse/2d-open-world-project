sub interact_main(object)

  object.onCreate = sub(args as object)

    ' createInstance
    m.game.createInstance("interact_char_veh")
    m.game.createInstance("interact_char_obj")
    m.game.createInstance("interact_char_npc")
    m.game.createInstance("interact_char_marker")
    m.game.createInstance("interact_char_hud")
    m.game.createInstance("interact_obj_veh")
    m.game.createInstance("interact_npc_veh")

  end sub

  object.onDestroy = sub()
    ' destroyInstance
    m.game.destroyInstance(m.game.getInstanceByName("interact_char_veh"))
    m.game.destroyInstance(m.game.getInstanceByName("interact_char_obj"))
    m.game.destroyInstance(m.game.getInstanceByName("interact_char_npc"))
    m.game.destroyInstance(m.game.getInstanceByName("interact_char_marker"))
    m.game.destroyInstance(m.game.getInstanceByName("interact_char_hud"))
    m.game.destroyInstance(m.game.getInstanceByName("interact_obj_veh"))
    m.game.destroyInstance(m.game.getInstanceByName("interact_npc_veh"))
    
  end sub
    
end sub