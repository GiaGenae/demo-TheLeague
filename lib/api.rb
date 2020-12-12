
class League::API

    def initialize
        @url = "https://www.balldontlie.io/api/v1/teams"
    end

    def get_team
        uri = URI.parse(@url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
        data["data"].each do |team|
            League::Team.new(team)
        end
    end
end

