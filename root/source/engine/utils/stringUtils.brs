function stringUtils()
    func = {
        includes: function(str as string, substr as string) as Boolean
            arrOfStr = str.split("")
            arrOfSubstr = substr.split("")
            result = false

            for i = 0 to arrOfStr.Count() - arrOfSubstr.Count()
                if arrOfStr[i] = arrOfSubstr[0]
                    for j = 1 to arrOfSubstr.Count() - 1
                        if arrOfStr[i + j] <> arrOfSubstr[j]
                            exit for
                        else if j = arrOfSubstr.Count() - 1
                            result = true
                            exit for
                            exit for
                        end if
                    end for
                end if
            end for

            return result

        end function
    }

    return func

end function