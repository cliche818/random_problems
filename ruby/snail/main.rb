# problem from https://www.codewars.com/kata/snail
# inspired by another solution on github...

# 1) read out the first row of the 2d array
# 2) remove first row from 2d array
# 3) rotate the 2d array counter clockwise  90 degrees (achieved by tranpose.reverse)
# 4) repeat step 1 until empty array

class Snail
  def self.run(array)
	if array == []
		return ''
	else
		return array.first.join(' ') + ' ' + Snail.run(array[1..-1].transpose.reverse)
	end
  end
end

p Snail.run([[1,2,3], [4,5,6],[7,8,9]]) # => 1 2 3 6 9 8 7 4 5
p Snail.run([[1,2], [3,4]]) # => 1 2 3 6 9 8 7 4 5
p Snail.run([[1,2,3,1], [4,5,6,4], [7,8,9,7], [7,8,9,7]]) # => 1 2 3 1 4 7 7 9 8 7 7 4 5 6 9 8

