class Player

  attr_accessor :name, :state
  #Simple classe qui crée un joueur avec un nom et sa forme sur la grille
  def initialize(name,state)
    @name = name
    @state = state
  end

end
