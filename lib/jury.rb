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
      puts "#{member.to_s.capitalize.blue} voted for #{vote.to_s.capitalize.green}"
      votes[vote] += 1
    end
    votes
  end
  
  def report_votes(votes)
    votes.each do |finalist, votes| 
      puts "#{finalist.to_s.capitalize}: #{votes.to_s}".yellow
    end
  end
  
  def announce_winner(votes)
    winner = votes.max_by {|finalist, votes| votes}[0]
    puts "*   ".pink * 8
    puts "*   ".light_grey * 8
    puts "*   ".light_blue * 8
    puts "#{winner.to_s.capitalize.green} is the winner!"
    winner
  end
  
end