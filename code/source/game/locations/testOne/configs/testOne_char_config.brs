function testOne_char_config() as object
    config = {

        xy: {
            name: "XY"
            offset: {
                x: invalid,
                y: invalid
            }
        }

        entity: {
            name: invalid
            size: {
                width: invalid,
                height: invalid,
            },

            anim: {
                index: invalid,
                alpha: 255,
                scale: {
                    x: invalid
                    y: invalid
                },
    
                offset: {
                    x: invalid
                    y: invalid
                },
                time: 100
            },

            pos: {
                x: invalid,
                y: invalid
            },

        }

        col: {
            name_up: invalid
            name_down: invalid
            name_left: invalid
            name_right: invalid

            offset: {
                x: 616,
                y: 332
            }
            
            up: false,
            down: false,
            left: false,
            right: false

            npc: invalid
        },

        attrs: {
            hp: invalid,
            sp: invalid
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
        }

        intersect: {
            obj: invalid
        }
    }

    return config

end function