class Test
  attr_reader :total_score

  def initialize
    questions_path = "#{__dir__}/../data/questions.txt"
    @questions = File.readlines(questions_path, chomp: true)
    @total_score = 0
    @user_choice = nil
    @question_count = 0
  end

  def in_progress?
    @question_count < @questions.size
  end

  def get_user_choice
    until @user_choice == 1 || @user_choice == 2 || @user_choice == 3
      puts "Введите 1 - если ответ ДА; 2 если НЕТ, 3 если ИНОГДА"
      @user_choice = STDIN.gets.to_i
    end
    @user_choice
  end

  def count_score
    if @user_choice == 1 && @questions.each_index { |i| i == 4; i == 9; i == 10 }
      @total_score += 2
    elsif @user_choice == 2 && @questions.each_index { |i| i == 4; i == 9; i == 10 }
      @total_score += 1
    elsif @questions.each_index { |i| i == 4; i == 9; i == 10 }
      @total_score += @user_choice.to_i
    else
      @total_score += @user_choice.to_i
    end

    @question_count += 1
  end

  def next_question
    puts @questions[@question_count]
    get_user_choice
    count_score
  end

  def on_test
    @questions.each_with_index do |value, index|
     puts "Вопрос № #{index + 1}: #{value}"
     get_user_choice
     count_score
     @user_choice = nil
      end
  end
end
