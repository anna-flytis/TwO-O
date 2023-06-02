class MathQuestion
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def ask_question(player_name)
    puts "#{player_name}: What does #{@num1} plus #{@num2} equal?"
    gets.chomp.to_i
  end

  def check_answer(answer)
    answer == @num1 + @num2
  end
end


