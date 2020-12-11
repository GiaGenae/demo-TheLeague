# Displays information [include puts/print]

require_relative "../lib/modules/league"
require_relative "../lib/cli"
require_relative "../lib/api"

class League::CLI

    def run 
        greeting
        teams
        exit
    end

    def greeting
        puts "Welcome to THE LEAGUE! 
        
        Congratulations on becoming an NBA team general manager. 

        Objective: Build a championship team. 
        Good luck!"
    end

    def teams
        # League::Team.each.with_index(1) do |team, i|
            # puts "#{i + 1}. #{team.name}"
    end

    def exit
    end
end