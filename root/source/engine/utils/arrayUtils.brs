function arrayUtils()
    func = {
        includes: function(array, element) as Boolean
            includes = false
            for each item in array
                if item = element
                    includes = true
                    exit for
                end if
            end for
            return includes
        end function

    }

    return func

end function