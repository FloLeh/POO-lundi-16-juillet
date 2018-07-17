class Board
  attr_accessor :board

  def initialize(board=[])
    @board = board
    9.times do
      board << BoardCase.new().form
    end
  end

  def show_board
    puts "\n   1   2   3"
    p '1 ' + board[0..2].join(' | ') + ' '
    p " ---|---|---"
    p '2 ' + board[3..5].join(' | ') + ' '
    p " ---|---|---"
    p '3 ' + board[6..8].join(' | ') + ' '
    puts "\n"
  end

  def full(boards)
    !boards.include?(' ')
  end

  def game_over
    ([board[0], board[1], board[2]].uniq.size == 1 && [board[0], board[1], board[2]].uniq != [' ']) ||
    ([board[3], board[4], board[5]].uniq.size == 1 && [board[3], board[4], board[5]].uniq != [' ']) ||
    ([board[6], board[7], board[8]].uniq.size == 1 && [board[6], board[7], board[8]].uniq != [' ']) ||
    ([board[0], board[3], board[6]].uniq.size == 1 && [board[0], board[3], board[6]].uniq != [' ']) ||
    ([board[1], board[4], board[7]].uniq.size == 1 && [board[1], board[4], board[7]].uniq != [' ']) ||
    ([board[2], board[5], board[8]].uniq.size == 1 && [board[2], board[5], board[8]].uniq != [' ']) ||
    ([board[0], board[4], board[8]].uniq.size == 1 && [board[0], board[4], board[8]].uniq != [' ']) ||
    ([board[2], board[4], board[6]].uniq.size == 1 && [board[2], board[4], board[6]].uniq != [' '])
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
    puts "\n******************C'est à #{player.name} de jouer******************"
    @grille.show_board
    p "Où veux-tu jouer ? (ligne,colonne)"
    print "> "
    choice = gets.chomp.split(',')
    while (@grille.board[(choice[0].to_i) *3 + choice[1].to_i] == ' ')==false
      p "Cette case est prise !"
      @grille.show_board
      puts "\nChoisis une case vide !  (ligne,colonne)"
      print "> "
      choice = gets.chomp.split(',')
    end
    @grille.board[(choice[0].to_i-1) *3 + choice[1].to_i-1].gsub!(' ', player.state)
  end

  def start
    t = 1
    puts "Le jeu commence !\n"
    while !@grille.game_over
      if @grille.full(@grille.board)
        break
      elsif t == 1
        self.turn(@joueur1)
        t += 1
      else
        self.turn(@joueur2)
        t -= 1
      end
    end
    if t == 1 && @grille.game_over
      @grille.show_board
      puts "\n******************C'est #{@joueur2.name} (O) qui gagne !******************"
    elsif t == 2 && @grille.game_over
      @grille.show_board
      puts "\n******************C'est #{@joueur1.name} (X) qui gagne !******************"
    elsif @grille.full(@grille.board)
      @grille.show_board
      puts "\n******************Egalité !******************"
    end
  end


end

jeu = Game.new
jeu.start
=begin
" X | X | O "
"---|---|---"
" O | O | X "
"---|---|---"
" X | O | X "
=end
