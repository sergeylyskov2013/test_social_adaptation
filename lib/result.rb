class Result
  def initialize
    result_path = "#{__dir__}/../data/results.txt"
    @results = File.readlines(result_path, chomp: true)
  end

  def text_result(total_score)
    case total_score
    when 0..3
      @results[6]
    when 4..8
      @results[5]
    when 9..13
      @results[4]
    when 14..18
      @results[3]
    when 19..24
      @results[2]
    when 25..29
      @results[1]
    when 30..32
      @results[0]
    end
  end

  # Склонение слова "балл"
  def inflection(number, krokodil, krokodila, krokodilov)
    return krokodilov if (11..14).include?(number % 100)

    case number % 10
    when 1 then krokodil
    when 2..4 then krokodila
    else krokodilov
    end
  end
end
