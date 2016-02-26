module Enumerable
	def my_each
		return self unless block_given?
		for i in self
			yield(i)
		end
	end

	def my_each_with_index
		return self unless block_given?
		for i in 0..self.length-1
			yield(self[i], i)
		end
	end

	def my_select
		outList = []
		my_each {|x| outList << x if yield(x)}
		return outList
	end

	def my_all?
		all = true
		my_each do |x|
			if not yield(x)
				all = false
				break
			end
		end
		all
	end

	def my_any?
		any = false
		my_each do |x|
			if yield(x)
				any = true
				break
			end
		end
		any
	end

	def my_none?
		none = false
		my_each do |x|
			if yield(x)
				none = false
				break
			end
		end
		none
	end

	def my_count(arg = nil)
		i = 0
		if block_given?
			my_each do |x|
				if yield(x)
					i+=1
				end
			end
		elsif num.nil?
			i = self.length
		else
			my_each do |x|
				if x == arg
					i+=1
				end
			end
		end
		i
	end

	def my_map(proc = nil)
		if proc
			outList = []
			if block_given?
				my_each {|x| outList << proc.call(yield(x))}
			else
				my_each {|x| outList << proc.call(x)}
			end
			return outList
		else
			self
		end
	end

	def my_inject(initial = nil)
		if initial.nil?
			acc = self.first
		else
			acc = initial	
		end

		my_each{|i| acc = yield(acc, i)}
		acc
	end
end

def multiply_els(l)
	l.my_inject(1) {|x,y| x*y}
end

puts multiply_els([2,4,5])