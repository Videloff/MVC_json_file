class Rooter
  attr_accessor :controller

  def initialize
    @controller = Controller.new
  end

  def perform

    while true
      View.clear_term
      print "Que voulez-vous faire ?\n(1) - Créer un gossip.\n(2) - Afficher tous les gossips.\n(3) - Supprimer un ou plusieurs gossips.\n(4) - Quitter l'application.\n>> "
      answer = gets.chomp.to_i
      case answer
        when 1
          View.clear_term
          @controller.create_gossip
          puts "le gossip a bien été ajouté et sauvegardé dans le fichier 'gossip.json'."
        when 2
          View.clear_term
          @controller.index_gossips
        when 3
          View.clear_term
          @controller.index_gossips_to_delete
        when 4
          View.clear_term
          puts "Vous avez choisis de quitter l'application.\nMerci d'avoir de l'avoir utilisé.\nProgramme terminé."
          break
        else
          puts "Erreur de saisie. Merci de répondre par un chiffre compris entre '1' et '4'."
      end

    end
  
  end

end