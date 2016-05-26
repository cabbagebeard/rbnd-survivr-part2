require "colorizr"
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  eliminated = []
	8.times do
	  losing_tribe = @borneo.immunity_challenge 
		puts "#{losing_tribe.to_s.yellow} was the losing tribe."
		eliminated_player = losing_tribe.tribal_council
		puts "#{eliminated_player.to_s.capitalize.red} has been eliminated."
		eliminated.push(eliminated_player)
		text_breaker
	end
	eliminated.length
end

def phase_two
  eliminated = []
  3.times do
    immune = @borneo.individual_immunity_challenge
    puts "#{immune.to_s.capitalize.green} is immune."
    eliminated_player = @merge_tribe.tribal_council(immune: immune)
    puts "#{eliminated_player.to_s.capitalize.red} has been voted off."
    eliminated.push(eliminated_player)
    text_breaker
  end
  eliminated.length
end

def phase_three
  7.times do
    immune = @borneo.individual_immunity_challenge
    puts "#{immune.to_s.capitalize.green} is immune."
    eliminated_player = @merge_tribe.tribal_council(immune: immune)
    puts "#{eliminated_player.to_s.capitalize.red} has been voted off."
    @jury.add_member(eliminated_player)
    puts "#{eliminated_player.to_s.capitalize.blue} is now in the jury."
    text_breaker
  end
  @jury.members.length
end

def text_breaker
  puts ""
  puts "* " * 20
  puts ""
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
