def bubble_sort(data)
	loop do
		swapped = false
		(0..data.length-2).each do |i|
			if data[i] > data[i+1]
				data[i], data[i+1] = data[i+1], data[i]
				swapped = true
			end
		end
		break if swapped == false
	end
	return data
end

def bubble_sort_by(data)
	loop do
		swapped = false
		(0..data.length-2).each do |i|
			if yield(data[i], data[i+1]) > 0
				data[i], data[i+1] = data[i+1], data[i]
				swapped = true
			end
		end
		break if swapped == false
	end
	return data
end


puts bubble_sort([4,3,78,2,0,2])
puts bubble_sort_by(["hi","hello","hey"]) {|left,right|
    left.length - right.length
}