defmodule Euler17Test do
  use ExUnit.Case, async: true

  test "1 (one) should be 3" do
    assert Euler17.run(1) == 3
  end
  
  test "2 (two) should be 3 + 3" do
    assert Euler17.run(2) == 6
  end
  
  test "19 (nineteen) should be 106" do
	assert Euler17.run(19) == 106
  end
  
  test "20 (twenty) should be 106 + 6" do
	assert Euler17.run(20) == 112
  end
  
  test "21 (twenty one) should be 106 + 6 + (6 + 3)" do
	assert Euler17.run(21) == 121
  end
  
  test "32 (thirty two) should be 226" do
	assert Euler17.run(32) == 226
  end
  
  test "100 (one hundred) should be 864" do
	assert Euler17.run(100) == 864
  end
  
  test "101 (one hundred and one) should be 864 + 16" do
	assert Euler17.run(101) == 880
  end
  
  test "1000 (one thousand) should be 21124" do
	assert Euler17.run(1000) == 21124
  end
end
