function arrayUtils()
    func = {
        contains: function(array, element) as Boolean
            contains = false
            for each item in array
                if item = element
                    contains = true
                    exit for
                end if
            end for
            return contains
        end function
    }

    return func

end function