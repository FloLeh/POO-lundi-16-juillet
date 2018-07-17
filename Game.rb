require_relative 'Board'
require_relative 'Player'

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
    while (@grille.board[(choice[0].to_i-1) *3 + choice[1].to_i-1] == ' ')==false
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

Game.new.start
