require_relative 'Board'
require_relative 'Player'

class Game

  #On instancie la grille et les 2 joueurs
  def initialize
    @grille = Board.new
    @joueur1 = Player.new("Tic","X")
    @joueur2 = Player.new("Tac","O")
  end

  #La méthode qui gère les actions pendant un tour
  def turn(player)
    puts "\n******************C'est à #{player.name} de jouer******************"
    @grille.show_board
    p "Où veux-tu jouer ? (ligne,colonne)"
    print "> "
    choice = gets.chomp.split(',')
    while !(@grille.board[(choice[0].to_i-1) *3 + choice[1].to_i-1] == ' ') #Transformation des coordonnées rentrées en
      p "Cette case est prise !"                                            #indice pour la grille
      @grille.show_board
      puts "\nChoisis une case vide !  (ligne,colonne)"
      print "> "
      choice = gets.chomp.split(',')
    end
    @grille.board[(choice[0].to_i-1) *3 + choice[1].to_i-1].gsub!(' ', player.state)
  end

  #La méthode qui lance le tout
  def start
    t = 1 #Le tour (par défaut joueur1)
    puts "Le jeu commence !\n"
    while !@grille.game_over #Tant que la partie n'est pas finie
      if @grille.full(@grille.board) #Si la grille est pleine, on break le while
        break
      elsif t == 1
        self.turn(@joueur1)
        t += 1 #On change le tour pour le joueur2
      else
        self.turn(@joueur2)
        t -= 1 #On change le tour pour le joueur1
      end
    end
    if t == 1 && @grille.game_over
      @grille.show_board
      puts "\n******************C'est #{@joueur2.name} qui gagne !******************"
    elsif t == 2 && @grille.game_over
      @grille.show_board
      puts "\n******************C'est #{@joueur1.name} qui gagne !******************"
    elsif @grille.full(@grille.board)
      @grille.show_board
      puts "\n******************Egalité !******************"
    end
  end
end

Game.new.start
