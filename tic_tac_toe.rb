class Board
  attr_accessor :board

  def initialize(board=[[],[],[]])
    @board = board
    3.times do
      board[0] << BoardCase.new().form
    end
    3.times do
      board[1] << BoardCase.new().form
    end
    3.times do
      board[2] << BoardCase.new().form
    end
  end

  def show_board
    puts "\n"
    p ' ' + board[0].join(' | ') + ' '
    p "---|---|---"
    p ' ' + board[1].join(' | ') + ' '
    p "---|---|---"
    p ' ' + board[2].join(' | ') + ' '
    puts "\n"
  end

  def game_over
    3.times do |i|
      if @board[i] == ['X','X','X']
       return true
     elsif @board[i] == ['O','O','O']
       return true
     end
    end
    if (@board[0][0] == @board[1][0]) && (@board[1][0] == @board[2][0])
      return true

    elsif (@board[0][1] == @board[1][1]) && (@board[1][1] == @board[2][1])
      return true

    elsif (@board[0][2] == @board[1][2]) && (@board[1][2] == @board[2][2])
      return true

    elsif (@board[0][0] == @board[1][1]) && (@board[1][1] == @board[2][2])
      return true

    elsif (@board[2][0] == @board[1][1]) && (@board[1][1] == @board[0][2])
      return true
    end

    return false
  end
end


class BoardCase

    attr_accessor :form

    def initialize(form=' ')
      @form = form
    end

    def is_empty
      form == ' '
    end

end

class Player

  attr_accessor :name, :state

  def initialize(name,state)
    @name = name
    @state = state
  end

end

class Game

  def initialize
    @grille = Board.new
    @joueur1 = Player.new("Tic","X")
    @joueur2 = Player.new("Tac","O")
  end

  def turn(player)
    puts "C'est à #{player.name} de jouer"
    @grille.show_board
    p "Où veux-tu jouer ? (ligne,colonne)"
    print "> "
    choice = gets.chomp.split(',')
    while !(@grille.board[choice[0].to_i][choice[1].to_i]) == ' '
      p "Cette case est prise !"
      p "Où veux-tu jouer ? (ligne,colonne)"
      choice = gets.chomp.split(',')
    end
    @grille.board[choice[0].to_i][choice[1].to_i].gsub!(' ', player.state)
  end

  def start
    t = 1
    puts "Le jeu commence !\n"
    while @grille.game_over
      if t == 1
        self.turn(@joueur1)
        t += 1
      else
        self.turn(@joueur2)
        t -= 1
      end
    end
    if t == 1
      @grille.show_board
      p "C'est #{@joueur2.name} qui gagne !"
    else
      @grille.show_board
      p "C'est #{@joueur1.name} qui gagne !"
    end
  end


end

jeu = Game.new
jeu.start
