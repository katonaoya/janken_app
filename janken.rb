def setting
  
  loop{
    puts '何本勝負？（press count）'
    @match = gets.chomp.to_i
    break unless @match == 0
  }

  puts "#{@match}本勝負を選びました。"

  loop{
    puts '難易度を選んでください（easy or hard）'
    @level = gets.chomp
    break if @level == "easy" || @level == "hard"
  }

  puts "#{@level}モードを選択しました。"

  @win = @lose = 0

  janken

end

def janken

  count = 1

  @match.times do
    puts "#{count}本目"
  
    loop{
      puts "じゃんけん…（press g or c or p)"
      @you = gets.chomp
      break if @you == "g" || @you == "c" || @you == "p"
    }

    choice

    if @level == "easy"
      easy
    else
      hard
    end

    puts "#{@win}勝#{@lose}敗"
    count += 1

  end
end

def choice
  hand = {g: 'グー', c: 'チョキ', p: 'パー'}
  @cpu = ["g", "c", "p"].sample
  puts "CPU...#{hand[@cpu.to_sym]}"
  puts "あなた...#{hand[@you.to_sym]}"
end

def easy

  loop{
    break unless @you == @cpu

    loop{
      puts "あいこで…（press g or c or p)"
      @you = gets.chomp
      break if @you == "g" || @you == "c" || @you == "p"
    }

    choice

  }

  case 
  when @you == "g" && @cpu == "c"
    puts "あなたの勝ち"
    @win += 1
  when @you == "c" && @cpu == "p"
    puts "あなたの勝ち"
    @win += 1
  when @you == "p" && @cpu == "g"
    puts "あなたの勝ち"
    @win += 1
  else
    puts "あなたの負け"
    @lose += 1
  end

end

def hard

  case 
  when @you == "g" && @cpu == "c"
    puts "あなたの勝ち"
    @win += 1
  when @you == "c" && @cpu == "p"
    puts "あなたの勝ち"
    @win += 1
  when @you == "p" && @cpu == "g"
    puts "あなたの勝ち"
    @win += 1
  else
    puts "あなたの負け"
    @lose += 1
  end

end

setting
