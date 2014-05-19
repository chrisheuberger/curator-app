class Curator < ActiveRecord::Base
  has_many :artworks, through: :collections
  has_secure_password

  def update_image
    artwork_image = HTTParty.get("http://www.brooklynmuseum.org/opencollection/api/oai.pmh.php?api-key=DMM628ShA4")
    artwork_image_hash = JSON.parse(artwork_image)
    self.image_url = ''
    self.image_url = artwork_image_hash['image']
    self
  end

end
