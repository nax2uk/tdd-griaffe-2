class RomanNumeral

    def convert(num = nil)
        return nil unless num
        recursive_convert(num, 1)
    end

    def get_place_value_number(num, position)
        return ((num % (10**position)) / (10**(position-1)))
    end

    def get_number_of_digits(num)
        return num.to_s.length
    end

    def recursive_convert(num, position)
        array_of_symbols = ['I', 'V', 'X', 'L', 'C', 'D', 'M', 'V', 'X']
        array_index = 2 * position - 2
        place_value_num = get_place_value_number(num, position)
        output_string = ""

        if position <= get_number_of_digits(num)
            output_string = recursive_convert(num, position + 1) << convert_helper(place_value_num, array_of_symbols[array_index], array_of_symbols[array_index + 1], array_of_symbols[array_index + 2])
        end
        output_string
    end

    def convert_helper(num, first_symbol, middle_symbol, last_symbol)
        return first_symbol * (num) if num >= 0 && num <= 3
        return first_symbol << middle_symbol if num == 4
        return middle_symbol << first_symbol * (num - 5) if num >= 5 && num <= 8
        return first_symbol << last_symbol if num == 9
    end
end

# X = 10
# IX = 9
# V = 5
# IV = 4
# I = 1