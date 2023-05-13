function interact_main(object)

  object.onCreate = function(args)

    ' createInstance
    m.game.createInstance("interact_char_veh")
    m.game.createInstance("interact_char_obj")
    m.game.createInstance("interact_char_npc")
    m.game.createInstance("interact_char_marker")
    m.game.createInstance("interact_char_interface")
    m.game.createInstance("interact_obj_veh")
    m.game.createInstance("interact_npc_veh")

  end function

  object.onDestroy = function()
    ' destroyInstance
    m.game.destroyInstance(m.game.getInstanceByName("interact_char_veh"))
    m.game.destroyInstance(m.game.getInstanceByName("interact_char_obj"))
    m.game.destroyInstance(m.game.getInstanceByName("interact_char_npc"))
    m.game.destroyInstance(m.game.getInstanceByName("interact_char_marker"))
    m.game.destroyInstance(m.game.getInstanceByName("interact_char_interface"))
    m.game.destroyInstance(m.game.getInstanceByName("interact_obj_veh"))
    m.game.destroyInstance(m.game.getInstanceByName("interact_npc_veh"))
    
  end function
    
end function