require 'multi_json'
require 'forwardable'

class Message
  extend Forwardable

  def initialize(metadata, payload)
    @metadata = metadata
    @payload  = payload
    @body     = MultiJson.load(payload, symbolize_keys: true)
  end

  def_delegator :@body, :[]
  def_delegators :@metadata, :routing_key, :timestamp, :exchange

  attr_reader :body
end

