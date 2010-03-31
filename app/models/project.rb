class Project < ActiveRecord::Base

  belongs_to :company

  validates :name, :presence => true
  validates :description, :presence => true, :length => {:maximum => 200}

  def to_s
    name
  end

end