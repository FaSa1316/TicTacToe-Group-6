class BoardCase
    attr_accessor :valeur, :num_case
    
    def initialize(valeur, num_case)
      @valeur = valeur
      @num_case = num_case
    end
    
    def to_s
      
      @valeur.to_s
    end
  
end


  class Board
    include Enumerable 
    attr_accessor :array_case
  
    def initialize
     
        @case1 = BoardCase.new("1", 1)
        @case2 = BoardCase.new("2", 2)
        @case3 = BoardCase.new("3", 3)
        @case4 = BoardCase.new("4", 4)
        @case5 = BoardCase.new("5", 5)
        @case6 = BoardCase.new("6", 6)
        @case7 = BoardCase.new("7", 7)
        @case8 = BoardCase.new("8", 8)
        @case9 = BoardCase.new("9", 9)
  
        @array_case = [[@case1, @case2, @case3],[@case4, @case5, @case6],[@case7, @case8, @case9]]
    end
  
    def to_s
        @array_case.each do |x|
            puts "\t\t\t --- --- ---"
            puts "\t\t\t| "+x[0].to_s+" | "+x[1].to_s+" | "+x[2].to_s+" |"
            end
            puts "\t\t\t --- --- ---"
    end
  
    def play(valeur, case_num)
      case case_num 
      when 1
        if @array_case[0][0].to_s == "1".to_s 
          @array_case[0][0] = valeur
        else
          puts "Erreur, l'emplacement n'est pas vide! Choisissez un autre: "
          return false
        end
      when 2
        if @array_case[0][1].to_s == "2".to_s
          @array_case[0][1] = valeur
        else
          puts "Erreur, l'emplacement n'est pas vide! Choisissez un autre: "
          return false
        end
      when 3
        if @array_case[0][2].to_s == "3".to_s
          @array_case[0][2] = valeur
        else
          puts "Erreur, l'emplacement n'est pas vide! Choisissez un autre: "
          return false
        end
      when 4
        if @array_case[1][0].to_s == "4".to_s
          @array_case[1][0] = valeur
        else
          puts "Erreur, l'emplacement n'est pas vide! Choisissez un autre: " 
          return false
        end
      when 5
        if @array_case[1][1].to_s == "5".to_s
          @array_case[1][1] = valeur
        else
          puts "Erreur, l'emplacement n'est pas vide! Choisissez un autre: "
          return false
        end
      when 6
        if @array_case[1][2].to_s == "6".to_s
          @array_case[1][2] = valeur
        else
          puts "Erreur, l'emplacement n'est pas vide! Choisissez un autre: "
          return false
        end
      when 7
        if @array_case[2][0].to_s == "7".to_s
          @array_case[2][0] = valeur
        else
          puts "Erreur, l'emplacement n'est pas vide!"
          return false
        end
      when 8
        if @array_case[2][1].to_s == "8".to_s
          @array_case[2][1] = valeur
        else
          puts "Erreur, l'emplacement n'est pas vide!"
          return false
        end
      when 9
        if @array_case[2][2].to_s == "9".to_s
          @array_case[2][2] = valeur
        else
          puts "Erreur, l'emplacement n'est pas vide!"
          return false
        end
      end
  
    end
  
    def victory?
      if
        (@array_case[0][0] == @array_case[0][1]) && (@array_case[0][1] == @array_case[0][2]) ||
        (@array_case[1][0] == @array_case[1][1]) && (@array_case[1][1] == @array_case[1][2]) ||
        (@array_case[2][0] == @array_case[2][1]) && (@array_case[2][1] == @array_case[2][2]) ||
        (@array_case[0][0] == @array_case[1][0]) && (@array_case[1][0] == @array_case[2][0]) ||
        (@array_case[0][1] == @array_case[1][1]) && (@array_case[1][1] == @array_case[2][1]) ||
        (@array_case[0][2] == @array_case[1][2]) && (@array_case[1][2] == @array_case[2][2]) ||
        (@array_case[0][0] == @array_case[1][1]) && (@array_case[1][1] == @array_case[2][2]) ||
        (@array_case[0][2] == @array_case[1][1]) && (@array_case[1][1] == @array_case[2][0])
        true
      else
        false 
      end
    end
  end
   
  class Player
    attr_accessor :nom, :valeur
    
    def initialize(nom = nil, valeur = nil)
      if nom == nil
        puts "Entrer votre nom: "
        nom = gets.chomp
      end
      @nom = nom
      
      if valeur == nil
        puts "Vous choisissez quel valeur? (X ou O) "
        prise = gets.chomp
        while prise != "X" && prise != "O" 
        puts "Mauvaise choix, reessayer! "
        prise = gets.chomp
        end
        valeur = prise
      end
      @valeur = valeur
      
    end
  
  end


  class Game
    def initialize
      
      puts "\n\tPour le joueur 1"
      @joueur_1 = Player.new
  
      puts"\n\tPour le joueur 2"
      if @joueur_1.valeur == "X"       
        @joueur_2 = Player.new(nil, "O")
      else
        @joueur_2 = Player.new(nil, "X")
      end
  
      @board = Board.new
  
    end
  
    def go
      
      puts "\n #{@joueur_1.nom.upcase} va jouer le premier"
      sleep 2
      turn 
    end
  
    def turn
     
      tab = [["1", "2", "3"],["4", "5", "6"],["7", "8", "9"] ]
      puts "Les cases sont numérotés de manière suivant: "
      tab.each do |x|
        puts "\t\t\t --- --- ---"
        puts "\t\t\t| "+x[0].to_s+" | "+x[1]+" | "+x[2]+" |"
        end
      puts "\t\t\t --- --- ---"
      sleep 3
  
      boucle = true
      var_intermediaire = 0
      nbr_tour = 1
      
      while boucle
       
        sleep 2 
        if nbr_tour % 2 == 0
          puts "\n#{@joueur_2.nom.upcase}, vous allez vous placez où? (case entre 1 à 9)\n"
        else
          puts "\n#{@joueur_1.nom.upcase}, vous allez vous placez où? (case entre 1 à 9)\n"
        end
       
        var_intermediaire = gets.chomp
        var_intermediaire = var_intermediaire.to_i
        
        while (var_intermediaire < 1) || (9 < var_intermediaire) 
          puts "Error, mauvaise endroit. Reessayez ! "
          var_intermediaire = gets.chomp
          var_intermediaire = var_intermediaire.to_i
        end
       
        if nbr_tour % 2 == 0
          playing = @board.play(@joueur_2.valeur, var_intermediaire)
        else
          playing = @board.play(@joueur_1.valeur, var_intermediaire)
        end
        
        while playing == false
          var_intermediaire = gets.chomp
          var_intermediaire = var_intermediaire.to_i
          if nbr_tour % 2 == 0
            playing = @board.play(@joueur_2.valeur, var_intermediaire)
          else
            playing = @board.play(@joueur_1.valeur, var_intermediaire)
          end
        end
        
        sleep 1
        @board.to_s
        
        if @board.victory? == true
          if nbr_tour % 2 == 0
            puts "#{@joueur_2.nom.upcase} a gagner!"
          else
            puts "#{@joueur_1.nom.upcase} a gagner!"
          end
        end
        
        break if @board.victory? == true
        
        nbr_tour += 1
      
        if nbr_tour == 10
          puts "Match nul, on recommence!"
          nbr_tour = 1
         
          @board.array_case = tab
          @board.to_s
        end
      end
  
    end
  end
  Game.new.go