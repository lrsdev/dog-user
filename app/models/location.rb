class Location < ActiveRecord::Base
  has_many :reports
  has_many :dogstatuses
  has_many :accesses
  validates :name, :presence => true
  validates :type, :presence => true
  validates :blurb, :presence => true
  validates :geolocation, :presence => true

  enum type: [ :beach ]

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # Return last 5 reports in JSON response
  
=begin
  def as_json(options = {})
    {
      :id => id,
      :location_type => location_type,
      :blurb => blurb,
      :dog_guidelines => dog_guidelines,
      :dog_status => dog_status,
      :name => name,
      :image_thumb => image.url(:thumb),
      :image_medium => image.url(:medium),
      :sightings => Report.where(location_id: id),
      :access_points => access_points
    }
  end
=end
end
