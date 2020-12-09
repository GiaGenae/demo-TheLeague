require_relative "../config/environment"

class League::API

    def initialize
        @url = "https://www.balldontlie.io/api/v1/stats"
    end

    def get_player
        uri = URI.parse(@url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
        data["data"].each do |player|
            get_player_data(player["data"])
        end
    end

    def get_player_data(url)
        uri = URI.parse(@url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
        Player.new(data)
    end
end

League::API.new.get_player # Laura said we will not be using; ask about this.