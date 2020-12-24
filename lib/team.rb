class League::Team

    @@all = []
  
    def initialize(attributes)
        attributes.each do |data, meta|
            self.class.attr_accessor(data) 
            self.send(("#{data}="), meta) 
        end
        self.class.all << self
    end

    def self.all
        @@all
    end

    #provides list of teams to choose from
    def self.teams
        
        League::Team.all.each.with_index(1) do |team,counter|
            puts "#{counter}" + ". " + team.full_name

        end
    end

    #provides additional data for each team
    def teams_data
        # selected_team = self.class.all[prompt.to_i-1]
        puts ""
        puts "---------------------------"
        puts "Team Name: " + self.full_name
        puts "City: " + self.city
        puts "Division: " + self.division
        puts "Conference: " + self.conference
        puts ""
        puts "---------------------------"
    end

end