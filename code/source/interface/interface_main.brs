function interface_main(object)

    object.save = character_save()
    object.data = interface_data()

    object.onCreate = function(args)

        ' loading map data to player data
        
        ' hp
        character_setHP(m.data.attributes.hp)


        'createInstance
        m.game.createInstance("interface_hp")

    end function

end function