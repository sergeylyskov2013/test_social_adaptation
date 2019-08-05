#  тест взят с сайта http://www.syntone-spb.ru/
name = ARGV[0] # здесь наш аргумент: имя пользователя

if Gem.win_platform? && ARGV[0]
  name = name.encode("UTF-8")
end

if name == nil
  name = "Стеснительное привидение"
elsif name == "-v"
  # Если пользователь хочет только выяснить версию программы или просто
  # убедиться, что она работает, выводим информацию о программе и выходим.
  puts version
  exit
end

# Объявим массив вопросов и запишем в перменную questions
questions = [
  "Переживаете ли вы в ожидании важной деловой встречи? ",
  "Если вам поручат выступить с докладом на каком либо мероприятии, " +
  "вызовет ли это у вас чувство дискомфорта?",
  "Вы откладываете поход к врачу до последнего момента?",
  "Если вам предстоит командировка в незнакомый город," +
  " постараетесь ли вы избежать этой командировки?",
  "Вы делитесь своими мыслями и чувствами с кем бы то ни было?",
  "Вас раздражает, когда незнакомые люди на улице обращаются к вам с вопросом?",
  "Вы думаете, что людям разных поколений действительно трудно понимать друг друга?",
  "Вам сложно будет сказать человеку, чтобы он вернул вам деньги, " +
  "взятые у вас несколько месяцев назад?",
  "Вам подали некачественное блюдо в кафе. Промолчите ли вы?",
  "Вы заговорите с незнакомым человеком, оставшись с ним наедине?",
  "Обнаружив в кассе, магазине, библиотеке длинную очередь, вы встанете в нее?",
  "Вам неприятно быть судьей в чужих конфликтах?",
  "Вы всегда оцениваете произведения искусства на свой вкус, " +
  " не прислушиваясь к чужому мнению?",
  "Если кто то выскажет ошибочную точку зрения на хорошо известный вам вопрос, " +
  "вы предпочтете промолчать и не исправлять его?",
  "Просьбы помочь в учебе или работе раздражают вас?",
  "Вам проще изложить свое мнение на бумаге, чем рассказать о нем?"
]
# Создадим массив результатов теста и запишем его в переменную results
# 30 31 балл.
results = [
  'Что скрывать, вы некоммуникабельны, и страдаете от этого прежде всего сами. ' +
  'Но и окружающим очень трудно с вами, ведь там, где необходимы совместные ' +
  'усилия, вы совершенно теряетесь. Почему вы так неохотно общаетесь? ' +
  'Неужели в вашем окружении совсем нет интересных людей? Попробуйте потренировать ' +
  'свою общительность — обращайтесь к людям с различными вопросами, ' +
  'пусть даже для начала они будут касаться только работы.',
  # 25 29 баллов.
   'Вы неразговорчивы, предпочитаете одиночество шумным компаниям. ' +
   'Друзей у вас совсем немного. Новая работа и новые люди вызывают у вас ' +
   'чувство дискомфорта. Эта особенность характера не ускользнула от вашего ' +
   'внимания, и вы часто сердитесь на себя за нее. Вспомните, как легко вы ' +
   'общаетесь, когда чем то очень увлечены. Ведь можете же, когда хотите.',
   # 19 24 балла.
   'В целом вы общительный человек. Новая обстановка и новые проблемы вас не пугают. ' +
   'И все таки с людьми вы сходитесь осторожно, постепенно, публично высказываетесь ' +
   'неохотно. Иногда ваши высказывания саркастичны, даже безо всякого на то основания.',
   # 14 18 баллов.
   'С коммуникабельностью у вас все в порядке. Вы любознательны, терпеливы, ' +
   'внимательно слушаете интересного собеседника, спокойно отстаиваете свою точку ' +
   'зрения. Встреча с новыми людьми не вызывает у вас неприятных ощущений. ' +
   'Но многолюдные места, шумные компании и болтливые люди вызывают у вас раздражение.',
   # 9 13 баллов.
   'Вы весьма общительны, не так ли? Ваши любопытство, разговорчивость, ' +
   'вспыльчивость вызывают у некоторых людей раздражение и заставляют думать о вас как ' +
   'о легкомысленном человеке. Вы легко знакомитесь с новыми людьми, вам нравятся большие ' +
   'компании, особенно если вы находитесь в центре всеобщего внимания. Вам не помешает ' +
   'выработать в себе немного терпения и усидчивости, необходимых для решения серьезных проблем.',
   # 4 8 баллов.
   'Вы, кажется, знакомы со всеми и все всегда обо всех знаете. Вы любите ' +
   'принимать участие в различных обсуждениях, хотя серьезные темы кажутся вам ужасно скучными. ' +
   'Привыкли высказываться даже в том случае, если недостаточно компетентны в обсуждаемом ' +
   'вопросе. Беретесь за любое дело, хотя не всегда можете успешно довести его до конца. ' +
   'Неудивительно, что руководители и коллеги относятся к вам с недоверием и никто не ' +
   'хочет выполнять с вами совместные задания.',
   # 3 балла или менее.
   'Ваша общительность чрезмерна. Вы говорливы, многословны, ' +
   'вспыльчивы, обидчивы, часто необъективны. Вы вмешиваетесь в дела, которые не имеют' +
   'к вам никакого отношения. Беретесь судить о проблемах, в которых совершенно не' +
   'разбираетесь. Часто из за вас возникают конфликты. С серьезной работой вы справиться' +
   'не в состоянии. Людям очень трудно с вами. Вам необходимо воспитывать в себе терпение, ' +
   'сдержанность и уважительное отношение к людям.'
]
# Приветствуем пользователя
puts "Добрый день, #{name}! Ответьте пожалуйста честно на несколько " \
  "вопросов, чтобы узнать кое-что о себе."
puts

score = 0

questions.each_with_index do |value, index|
  puts "Вопрос № #{index + 1}: #{value}"
  puts

  user_input = nil

  until %w[0 1 2].include?(user_input)
    puts
    puts " Введите 1, если согласны,  2 если согласны частично. "
    puts " Не согласны: введите: 0 "
    user_input = STDIN.gets.chomp
    puts
  end

  if user_input == "1" && [4, 9, 10].none?(index)
      score += 2
    elsif user_input == "2" && [4, 9, 10].none?(index)
      score += 1
    elsif [4, 9, 10].include?(index)
    score += user_input.to_i
    else
    score += user_input.to_i
  end
end

puts "#{name}"
puts "Ваш результат теста - #{score}):"

if score >= 30
  puts results[0]
elsif score >= 25
    puts results[1]
elsif score >= 19
    puts results[2]
elsif score >= 14
    puts results[3]
elsif score >= 9
    puts results[4]
elsif score >= 4
    puts results[5]
else
  puts results[6]
end
