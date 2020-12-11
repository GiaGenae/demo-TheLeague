class Team

    @@all = []
  
    def initialize(attributes)
        attributes.each do |data, meta|
            self.class.attr_accessor(data)
            self.send(("#{data}="), meta)
        end
        @@all << self
    end

    def self.all
        @@all
    end
    binding.pry
end