class Painting < ActiveRecord::Base
  #attr_accessible :image, :name
  mount_uploader :image, ImageUploader

  before_create :default_name

  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end
  
  private
    def painting_params
      params.require(:painting).permit(:image, :name)
    end
  
end
