function testOne_char_config() as object
    config = {

        pos: {
            x: invalid,
            y: invalid
        },

        size: {
            width: invalid,
            height: invalid,
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
            sp: 5
            hp_time: 1000,
            sp_time: 1000
        },

        anim: {
            alpha: 255,
            index: 9,
            time: 100
        },
        
        col: {
            up: false,
            down: false,
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