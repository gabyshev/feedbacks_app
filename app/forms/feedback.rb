class Feedback
  include ActiveModel::Model
  include GlobalID::Identification
  attr_accessor :name, :message

  validates :name, :message, presence: true

  def id
    object_id
  end

  def self.find(id)
    ObjectSpace._id2ref(id.to_i)
  end
end
