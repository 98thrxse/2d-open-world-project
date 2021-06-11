function globalXY(ver) as object
    m.xy = {

        get2DOffsetX: xy_get2DOffsetX
        set2DOffsetX: xy_set2DOffsetX

        get2DOffsetY: xy_get2DOffsetY
        set2DOffsetY: xy_set2DOffsetY

		config: invalid
	}

	m.xy.config = globalLoad("xy")

	if m.xy.config = invalid OR m.xy.config.version <> ver
        globalSave(invalid, "xy")

		m.xy.config = {
			offset: {
				x: 0,
				y: 0
			}

			version: ver
		}

        globalSave(m.config, "xy")

	end if

	return m.xy

end function

function xy_get2DOffsetX() as integer
    return m.config.offset.x
end function

sub xy_set2DOffsetX(x as integer)
    m.config.offset.x = x
    globalSave(m.config, "xy")
end sub

function xy_get2DOffsetY() as integer
    return m.config.offset.y
end function

sub xy_set2DOffsetY(y as integer)
    m.config.offset.y = y
    globalSave(m.config, "xy")
end sub