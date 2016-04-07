class Feedback
  include ActiveModel::Model
  attr_accessor :name, :message

  validates :name, :message, presence: true
end
