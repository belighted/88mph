class Project < ActiveRecord::Base

  belongs_to :company
  has_many :participations
  has_many :users, :through => :participations

  validates :name, :presence => true
  validates :description, :presence => true, :length => {:maximum => 200}

  def to_s
    name
  end

end