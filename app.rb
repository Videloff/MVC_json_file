# require 'bundler'
# Bundler.require
require 'json'

require_relative "./lib/controller"
require_relative "./lib/gossip"
require_relative "./lib/rooter"
require_relative "./lib/view"

Rooter.new.perform