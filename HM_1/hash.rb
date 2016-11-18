=begin
  1.Створити хеш з ключами(букви алфавіту) та значення(сума 2 попередніх)
  Приклад: {a: 1, b: 1, c: 2, d: 3….}
  Вивести пари ключ, значення, в яких значення менше 15
=end

def fibonacci n
  n <= 1 ? n :  fibonacci( n - 1 ) + fibonacci( n - 2 )
end

hash = Hash.new ()
('a'..'z').each_with_index do |f, i|
  hash[f] = fibonacci(i)
end

hash.select! {|key, value| value < 15}
puts hash


=begin
  2.{'yes' => 23, 'b' => 'travel', 'yesterday' => 34, :yesss => :fg, try: 30, key: 'some value', 'yesterday1'
  => 34, 'yesteryear' => 2014}
  Вивести кількість ключів, значення яких починаються на “yes”
=end

yes_hash = { 'yes' => 23, 'b' => 'travel', 'yesterday' => 34, :yesss => :fg, try: 30, 
            key: 'some value', 'yesterday1' => 34, 'yesteryear' => 2014 }

yes_key_count = 0

yes_hash.each { |key,value| yes_key_count += 1 if key.to_s.start_with?("yes") } 

puts yes_key_count