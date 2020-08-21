class Game

  attr_reader :current_turn

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_turn = player1
  end

  def attack(player)
    player.receive_damage
  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  def opponent_of(the_player)
    @players.select {|player| player != the_player }.first
  end

  def hp_check?
    players.select { |player| player.hit_points <= 0 }.any?
  end

  def loser
    players.select { |player| player.hit_points <= 0 }.first
  end

  private

  attr_reader :players

end