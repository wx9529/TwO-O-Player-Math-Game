class Player
  attr_accessor :life

  def initialize(life)
    self.life = life
  end

  def modify_life 
    self.life -= 1 
  end

end