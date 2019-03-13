# problem from https://projecteuler.net/problem=17

# If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were \
# written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) 
# contains 23 letters and 115 (one hundred and fifteen) 
# contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

# Inspired by https://github.com/sorentwo/euler/blob/master/euler_017.rb

# Some funny bugs I encountered
# % is not available in elixir
# forgot "and"
# got 21125 <- because I had space for one thousand


defmodule Euler17 do
  @ones ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven",
			"twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
			
  @tens ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
  
  def run(number) do
	Enum.map(1..number, fn (n) -> Euler17.to_word(n) end)
	 |> Enum.map(fn(number_word) -> String.length(number_word) end) 
	 |> Enum.reduce(fn(acc, n) -> acc + n end)
  end
  
  def to_word(number) when number <= 19 do 
	Enum.at(@ones, number - 1)
  end		
  
  def to_word(number) when number > 19 and number < 100 and rem(number, 10) == 0 do
    tens_index = div(number, 10) - 2
	Enum.at(@tens, tens_index) 
  end
  
  def to_word(number) when number > 19 and number < 100 and rem(number, 10) != 0 do
    tens_index = div(number, 10) - 2 
	Enum.at(@tens, tens_index) <> to_word(rem(number, 10))
  end
  
  def to_word(number) when number > 99 and number < 1000 and rem(number, 100) == 0 do
	hundred_index = div(number, 100)
	to_word(hundred_index) <> "hundred"
  end
  
  def to_word(number) when number > 99 and number < 1000 and rem(number, 100) != 0 do
	hundred_index = div(number, 100)
	tens_digits = rem(number, 100) 
	to_word(hundred_index) <> "hundred" <> "and" <> to_word(tens_digits)
  end
  
  def to_word(number) when number == 1000 do
	"one" <> "thousand"
  end
end

#IO.inspect Euler17.run(1) # => 3
#IO.inspect Euler17.run(2) # => 6
#IO.inspect Euler17.run(1000) # => 21124 


