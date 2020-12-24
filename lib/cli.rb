# Displays information [include puts/print]

require_relative "../config/environment"
require_relative "../lib/modules/league"
require_relative "../lib/cli"
require_relative "../lib/api"

class League::CLI

    def run 
        greeting
        sleep(3)
        ready
    end

    #greets user upon running program
    def greeting
        puts ""
        puts ""
        puts "Welcome to" + "..." 
        puts " 
         ▄▄▄▄▄▄▄▄▄▄▄  ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄            ▄            ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄      
        ▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌          ▐░▌          ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌     
         ▀▀▀▀█░█▀▀▀▀ ▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀▀▀           ▐░▌          ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀▀▀      
             ▐░▌     ▐░▌       ▐░▌▐░▌                    ▐░▌          ▐░▌          ▐░▌       ▐░▌▐░▌          ▐░▌       ▐░▌▐░▌               
             ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄           ▐░▌          ▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌▐░▌ ▄▄▄▄▄▄▄▄ ▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄      
             ▐░▌     ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌          ▐░▌          ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌▐░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌     
             ▐░▌     ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀           ▐░▌          ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░▌ ▀▀▀▀▀▀█░▌▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀▀▀      
             ▐░▌     ▐░▌       ▐░▌▐░▌                    ▐░▌          ▐░▌          ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌               
             ▐░▌     ▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄           ▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄▄▄ ▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄      
             ▐░▌     ▐░▌       ▐░▌▐░░░░░░░░░░░▌          ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     
              ▀       ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀            ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀      
                                                                                                                                            "
        sleep(1)
        puts ""
        puts ""
        puts ""
        puts "Congratulations on becoming an NBA team general manager." 
        puts ""
        puts ""
        puts "Are you ready for this upcoming season? (y/n)"
        sleep(0.5)
        puts ""
        puts ""
        puts ""
        League::API.new.get_team
    end

    #asks user if ready to begin (y/n)
    def ready

        input = gets.strip.downcase

        if input == "y"
            puts "Great! Let's get started."
            sleep(2.5)
            puts ""
            puts ""
            League::Team.teams
            loop do 
                prompt = gets.strip.downcase
                if prompt.to_i.between?(1,League::Team.all.size) 
                    selected_team = League::Team.all[prompt.to_i-1]
                    selected_team.teams_data
                    puts "Would you like to access another team? If not, type 'exit'."
                elsif prompt == "exit"
                    goodbye 
                    exit
                else 
                    puts "Invalid entry. Input valid number or 'exit'."
                end
                puts ""
            end

        elsif input == "n"
            puts "Better luck next year!"
            goodbye
        else 
            puts "Invalid entry. Please choose (y/n)"
            ready
        end
    end

    # #provides list of teams to choose from
    # def teams
    #     counter = 1

    #     League::Team.all.each do |team|
    #         puts "#{counter}" + ". " + team.full_name

    #     counter += 1
    #     end
    # end

    # #provides additional data for each team
    # def teams_data(prompt)
    #     selected_team = League::Team.all[prompt.to_i-1]
    #     puts ""
    #     puts "---------------------------"
    #     puts "Team Name: " + selected_team.full_name
    #     puts "City: " + selected_team.city
    #     puts "Division: " + selected_team.division
    #     puts "Conference: " + selected_team.conference
    #     puts ""
    #     puts "---------------------------"
    # end


    def goodbye
        puts "Good luck in the off season!"
    end
end

