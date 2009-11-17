class Channel < ActiveRecord::Base
  has_many :messages

  validates_uniqueness_of :slug, :on => :create, :allow_nil => true, :message => "must be unique"
  
  before_validation :slugify_name
  before_save :set_name_if_empty
  
  private
  
  def set_name_if_empty
    self.name = self.slug if self.name.nil? and not self.slug.nil?
  end
  
  def slugify_name
    self.slug = self.name.parameterize.to_s if not self.name.nil? and self.slug.nil?
  end  
end
