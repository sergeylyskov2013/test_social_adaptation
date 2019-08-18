require_relative 'lib/test'
require_relative 'lib/result'

puts 'ТЕСТ НА УРОВЕНЬ ОБЩИТЕЛЬНОСТИ'
puts 'ИДЕЯ ВЗЯТА на http://www.syntone-spb.ru/'
puts
puts "Здравствуйте, как вас зовут? "
name = STDIN.gets.chomp

begin
test = Test.new
test.on_test

result = Result.new

while test.in_progress?
  test.next_question
end
puts

message = "#{name}, Ваш результат #{test.total_score} " \
       "#{result.inflection(test.total_score, "бал", "балла", "баллов")}."

puts message
puts
puts result.text_result(test.total_score)

rescue SystemCallError => error
  puts "Не найден файл: " + error.message
rescue Interrupt
  puts "\nВы вышли из игры."
end
