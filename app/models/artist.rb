require_relative "./concerns/slugifiable.rb"

class Artist < ActiveRecord::Base 
  has_many :songs 
  has_many :genres, through: :songs  

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def slug
    name = self.name.downcase.gsub(' ','-')
  end

   def self.find_by_slug(slug)
    Artist.all.find do |artist|
      artist.slug == slug
    end
  end
end 