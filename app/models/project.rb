class Project < ApplicationRecord

  broadcasts_to ->(project) { :projects }

  validates :content, presence: :true
  has_many :tasks

  def self.search(search)
    where("title LIKE ? OR content LIKE ?", 
          "%#{search.strip}%", "%#{search.strip}%" )
  end
end
