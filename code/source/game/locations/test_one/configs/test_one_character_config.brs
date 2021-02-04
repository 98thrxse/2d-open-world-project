function test_one_character_config() as object
    config = {

        attributes: {
            hp: invalid,
            sp: invalid
        },

        damage: {
            hp: 10,
            sp: 10
            time: 500,
        },

        anim: {
            time: 100
        },
        
        collider: {
            npc: false,

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