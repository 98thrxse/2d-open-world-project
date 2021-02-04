function test_one_character_config() as object
    config = {

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