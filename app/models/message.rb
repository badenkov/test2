class Message < ActiveRecord::Base
  attr_accessible :name, :phone, :email, :content

  belongs_to :user
end
