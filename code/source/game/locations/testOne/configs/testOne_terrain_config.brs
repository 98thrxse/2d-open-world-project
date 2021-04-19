function testOne_terrain_config() as object
    config = [

        [
            {
                id: [0, 0],
                entity: {
                    name: "terrain_entity",
                    anim: {
                        reg: ["sand"]
                        offset: {
                            x: 0,
                            y: 0
                        }
                    }

                }

            },

            {
                id: [0, 1],
                entity: {
                    name: "terrain_entity",
                    anim: {
                        reg: ["grass"]
                        offset: {
                            x: 1280,
                            y: 0
                        }
                    }

                }
 
            },

            {
                id: [0, 2],
                entity: {
                    name: "terrain_entity",
                    anim: {
                        reg: ["sand"]
                        offset: {
                            x: 2560,
                            y: 0
                        }
                    }

                }
            }
        ],

        [
            {
                id: [1, 0],
                entity: {
                    name: "terrain_entity",
                    anim: {
                        reg: ["grass"]
                        offset: {
                            x: 0,
                            y: 720
                        }
                    }

                }
            },

            {
                id: [1, 1]
                entity: {
                    name: "terrain_entity",
                    anim: {
                        reg: ["grass"]
                        offset: {
                            x: 1280,
                            y: 720
                        }
                    }

                }
            },

            {
                id: [1, 2]
                entity: {
                    name: "terrain_entity",
                    anim: {
                        reg: ["sand"]
                        offset: {
                            x: 2560,
                            y: 720
                        }
                    }

                }
            }
        ]
    ]

    return config

end function