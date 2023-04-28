class View

  def initialize
    @index = 0
  end

  def create_gossip
    puts "Vous avez choisis de créer un gossip."
    print "Quelle est le nom de la key ?\n>> "
    key = gets.chomp.to_s
    print "Quelle est le contenu de la value ?\n>> "
    value = gets.chomp.to_s
    return params = {content: key, author: value}
  end

  def index_gossips(gossip_list)
    @index = 0
    back_to_menue = ""
    if gossip_list.empty?
      puts "Aucun gossip n'est sauvegardé dans le fichier."
    else
      gossip_list.each do|(key, value)|
        puts "(#{@index+1}) - #{key} : '#{value}'"
        @index+=1
      end
    end
    puts "entrez sur n'importe quelle saisie pour revenir au menu principal."
    back_to_menue = gets.chomp
  end

  def index_gossips_to_delete(gossip_list)
    if gossip_list.empty?
      puts "Aucun gossip n'est sauvegardé dans le fichier."
    else
      while true
        View.clear_term
        if Gossip.all_file_content()
          gossip_list = Gossip.all_file_content
        end
        choice = "vide"
        @index = 0
        gossip_list.each do|(key, value)| print "(#{@index+1}) - #{key} : '#{value}'\n"; @index+=1 end
        if gossip_list.empty?
          puts "Aucun gossip n'est sauvegardé dans le fichier."
        end
        puts "Veuillez saisir l'index du gossip à supprimer. (0 pour annuler)"
        while(choice = gets.chomp.to_i)
          break if (choice >= 0 && choice < @index + 1)
          puts "Erreur de saisie : index inexistant."
        end
        if choice == 0
          break
        end
        Gossip.destroy_gossip(choice-1)
      end
    end
  end

  def self.clear_term
    system('cls') || system('clear')
  end

end