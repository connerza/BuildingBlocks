def substrings(words, data)
	outHash = {}

	data.each do |findString|
		instances_found = 0

		words.downcase.split.each do |searchString|
			i = 0
			
			while i < searchString.length
				indexFound = searchString.index(findString, i)
				
				if !indexFound
					break
				end

				i = i + indexFound + 1
				instances_found = instances_found + 1
			end
		end

		outHash[findString] = instances_found
	end

	return outHash
end

dictionary = ["below","down","go","going","horn","how","howdy","it",
			"i","low","own","part","partner","sit"]

#puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
