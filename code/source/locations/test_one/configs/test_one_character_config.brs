function test_one_character_config() as object
    config = {

        damage: {
            hp: 10,
            sp: 10
        },

        anim: {
            time: 100
        },
        
        collider: {
            up: false,
            down: false
            left: false,
            right: false
        },
    
        speed: {
            up: 3,
            down: 3,
            left: 3,
            right: 3
        }
    }

    return config

end function