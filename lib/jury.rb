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
        votes[vote] += 1
      puts "#{member} votes for #{vote}"
    end
    votes.to_h
  end
  
  def report_votes(votes)
    votes.each do |finalist, votes| 
      puts "#{finalist.to_s}: #{votes.to_s}"
    end
  end
  
  def announce_winner(votes)
    winner = votes.max_by {|finalist, votes| votes}[0]
    puts "#{winner.to_s} is the winner!"
    winner
  end
  
end