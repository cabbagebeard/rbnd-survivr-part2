class Game
  attr_reader :tribes
  
  def initialize(tribe1, tribe2)
    @tribes = [tribe1, tribe2]
  end
  
  def add_tribe(tribe)
    @tribes.push(tribe)
  end
  
  def immunity_challenge
    @tribes.sample
  end
  
  def clear_tribes
    @tribes.clear
  end
  
	def merge(name)
		members = []
		@tribes.each do |tribe| 
		  members += tribe.members
		end
		merged_tribe = Tribe.new({name: name, members: members})
		self.clear_tribes
		self.add_tribe(merged_tribe)
		merged_tribe
	end

	def individual_immunity_challenge
		@tribes[0].members.sample
	end
	
end