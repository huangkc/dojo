class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments, dependent: :destroy
  belongs_to :user

  def time_since_creation
  	((Time.now - created_at) / 3600).round
  end
end
