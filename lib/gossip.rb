require 'json'

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def already_existing
    if File.exist?('./db/gossip.json') && !File.zero?('./db/gossip.json')
      json_file = File.read('./db/gossip.json')
      already_saved_data = JSON.parse(json_file)
      return already_saved_data
    else
      return nil
    end
  end
  
  def self.all_file_content
    if File.exist?('./db/gossip.json') && !File.zero?('./db/gossip.json')
      json_file = File.read('./db/gossip.json')
      already_saved_data = JSON.parse(json_file)
      return already_saved_data
    else
      return nil
    end
  end

  def save
    data = {@author => @content}

    if File.exist?('./db/gossip.json')
      previous_data = already_existing()
    end
    if previous_data
      data = previous_data.merge!(data)
    end
    File.open("./db/gossip.json", "w") do |content|
      content.write(JSON.pretty_generate(data))
    end
  end
  
  def self.destroy_gossip(index)
    file = File.read('./db/gossip.json')
    data = JSON.parse(file)
    data.delete(data.keys[index])
    File.open('./db/gossip.json', "w") { |f| f.write(JSON.pretty_generate(data)) }
  end
end