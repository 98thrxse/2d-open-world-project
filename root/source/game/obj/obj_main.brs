sub obj_main(object)

    object.onCreate = sub(args as object)

        m.game.obj = obj_data()
        
        ' createInstance
        m.game.createInstance("obj_view")
        m.game.createInstance("obj_control")

    end sub

    object.onDestroy = sub()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("obj_view"))
        m.game.destroyInstance(m.game.getInstanceByName("obj_control"))
    end sub
    
end sub