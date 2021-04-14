function testOne_char_config() as object
    config = {

        entity: {
            size: {
                width: invalid,
                height: invalid,
            },

            anim: {
                index: 9,
                alpha: 255,
                time: 100
            },

            pos: {
                x: invalid,
                y: invalid
            }
        }

        col: {
            npc: invalid,
            
            up: false,
            down: false,
            left: false,
            right: false
        },

        attributes: {
            hp: invalid,
            sp: invalid
        },

        damage: {
            hp: 10,
            sp: 10
            hp_time: 500,
            sp_time: 500
        },

        regen: {
            hp: 5,
            sp: 5,
            hp_time: 1000,
            sp_time: 1000
        },

        speed: {
            up: 3,
            down: 3,
            left: 3,
            right: 3
        }

        intersect: {
            obj: invalid
        },  

    }

    return config

end function