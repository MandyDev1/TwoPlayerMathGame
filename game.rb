require_relative 'Player'
require_relative 'Question'

class Game
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @current_player = @player1
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def game_over?
    @player1.lives.zero? || @player2.lives.zero?
  end

  def display_score
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  def play
    puts "----- NEW GAME -----"

    until game_over?
      question = Question.new

      puts "#{@current_player == @player1 ? 'Player 1' : 'Player 2'}: #{question.question}"
      user_answer = gets.chomp.to_i

      if user_answer == question.answer
        puts "YES! You are correct."
      else
        puts "Seriously? No!"
        @current_player.lose_life
      end

      display_score
      switch_player

      puts "----- NEW TURN -----"
    end

    puts "----- GAME OVER -----"
    puts "#{@player1.lives.zero? ? 'Player 2' : 'Player 1'} wins with a score of #{@player1.lives.zero? ? @player2.lives : @player1.lives}/3"
    puts "Good bye!"
  end
end