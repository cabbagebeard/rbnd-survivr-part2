class Jury
  attr_accessor :members
  
  
  def initialize
    @members = []
  end
  
  def add_member(member)
    @members.push(member)
  end
  
  def cast_votes(finalists)
    votes = {}
    finalists.each do |finalist|
      votes[finalist] = 0
    end
    @members.each do |member|
      vote = finalists.sample
      puts vote
    end
    votes.to_h
  end
  
end