class Tribe
  attr_reader :name, :members

  def initialize(options)
    @name = options[:name]
    @members = options[:members]
    puts @tribe
  end

  def tribal_council(immune: nil)
    eliminated_player = members.reject { |member| member == immune }.sample
    @members.delete(eliminated_player)
  end

  def to_s
    name
  end
end