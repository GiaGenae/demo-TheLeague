# Displays information [include puts/print]

require_relative "../config/environment"
require_relative "../lib/modules/league"
require_relative "../lib/cli"
require_relative "../lib/api"

class League::CLI

    def run 
        greeting
        sleep(2)
        teams
        # exit
    end

    def greeting
        puts "Welcome to" + "..." + "THE LEAGUE!"
        sleep(1)
        puts ""
        puts ""
        puts ""
        puts "Congratulations on becoming an NBA team general manager." 
        puts ""
        puts ""
        puts "Please choose your team to receive additional details."
        sleep(1)
        puts ""
        puts ""
        puts ""
        League::API.new.get_team
    end

    def teams
        counter = 1

        League::Team.all.each do |team|
            puts "#{counter}" + ". " + team.full_name

        counter += 1
        end
    end

    # def exit
    #     loop do |greeting|
    #     end
    # end
end
