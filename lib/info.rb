class ProjectFinal::Info
  attr_accessor  :title, :summary, :url
@@all = []


def self.all
  @@all
 end


 def save
  @@all << self
 end

end
