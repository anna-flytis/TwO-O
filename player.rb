class Player
  attr_reader :name, :score, :lives

  def initialize(name)
    @name = name
    @score = 0
    @lives = 3
  end

  def reduce_lives
    @lives -= 1
  end

  def update_score(points)
    @score += points
  end
end

