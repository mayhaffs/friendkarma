class Job < ActiveRecord::Base
  attr_accessible :friend_karma_value, :group_id, :membership_id, :name, :time
  belongs_to :group
  belongs_to :membership
  has_many :requests
  has_many :comments

  validates_presence_of :friend_karma_value, :group_id, :membership_id, :name, :time
  def complete(user)
   requests = Request.where(group_id)
    requests.each do |request|
      request.completed = true  
    end
  end
end
