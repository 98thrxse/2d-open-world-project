function globalXY(ver) as object
    m.xy = {

        getZeroOffsetX: xy_getZeroOffsetX
        setZeroOffsetX: xy_setZeroOffsetX

        getZeroOffsetY: xy_getZeroOffsetY
        setZeroOffsetY: xy_setZeroOffsetY

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

function xy_getZeroOffsetX() as integer
    return m.config.offset.x
end function

sub xy_setZeroOffsetX(x as integer)
    m.config.offset.x = x
    globalSave(m.config, "xy")
end sub

function xy_getZeroOffsetY() as integer
    return m.config.offset.y
end function

sub xy_setZeroOffsetY(y as integer)
    m.config.offset.y = y
    globalSave(m.config, "xy")
end sub