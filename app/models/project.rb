class Project < ApplicationRecord

  after_create_commit {broadcast_prepend_to "projects"}
  after_update_commit {broadcast_replace_to "projects"}
  after_destroy_commit {broadcast_remove_to "projects"}
  
  validates :content, presence: :true
  has_many :tasks

  def self.search(search)
    where("title LIKE ? OR content LIKE ?", 
          "%#{search.strip}%", "%#{search.strip}%" )
  end
end
