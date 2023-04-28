class Controller
  attr_accessor :gossip, :view

  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    View.clear_term
    key, value = params.values
    @gossip = Gossip.new(key, value)
    @gossip.save
  end

  def index_gossips
    if Gossip.all_file_content()
      @view.index_gossips(Gossip.all_file_content)
    end
  end

  def index_gossips_to_delete
    if Gossip.all_file_content()
      @view.index_gossips_to_delete(Gossip.all_file_content)
    end
  end

end