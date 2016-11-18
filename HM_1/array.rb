
# 1. [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array = (1..10).to_a

# Вивести масив використовуючи each
array.each {|i| puts i }

# Вивести числа більше 5
array.each {|i| puts i if i > 5 }

# Вивести та занести непарні числа в окремий масив
array2 = []

array.each do |i| 
	p i if i % 2 != 0 
	array2 << i if i % 2 != 0
end

# Додати 11 в кінець та 3 в початок масиву

array.unshift(3)
array << 11
# array.insert(0, 3)
# array.push(11)

# 2. Заповнити випадковими числами від -10 до 10 двомірний масив 4х4 (як мариця)

a = []
b = []
4.times do |i|
	4.times {b << rand(-10..10)}
	a << b
	b = []
end

# 3. Вивести суму всіх від*ємних чисел та вивести кожне від*ємне число

sum = 0
a.flatten!
a.each do |i|
	if i < 0
		sum += i
		print " " + i.to_s 
	end
end
puts
p sum

=begin
4. Заповнити масив із 40 елементів випадковими строками у виді дати і температури повітря(“24.03 -12”). 
Порахувати та вивести середню температуру за кожен місяць
=end

avarage_temp = []
date_array = Array.new(40) {"#{rand(1..31)}.#{rand(1..12)} #{rand(-40..40)}"} 
date_array.map! {|i| i.split(".")[1].to_s } 																	
date_array.each do |i|
	tmp_arr = []
	for j in date_array
		tmp_arr << j.split[1].to_i if i.split[0] == j.split[0] 
	end
	avarage_temp << "#{i.split[0]}: #{(tmp_arr.inject(0){|sum,x| sum + x } / tmp_arr.length.to_f)}"
end
p avarage_temp.uniq
