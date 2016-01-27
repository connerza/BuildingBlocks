def caesar_cipher(s, shift)
	new_string = ""
	s.each_char do |c|
		c_int = c.ord			
		if /[A-Z]/.match(c)
			shift.times do
				c_int = c_int + 1
				if c_int > 90
					c_int = 65
				end
			end
			new_string << c_int.chr
		elsif /[a-z]/.match(c)
			shift.times do
				c_int = c_int + 1
				if c_int > 123
					c_int = 141
				end
			end
			new_string << c_int.chr
		else
			new_string << c
		end		
	end
	return new_string
end

puts caesar_cipher("What a string!", 5)