class PublishIntent
  include Mongoid::Document
  include Mongoid::Timestamps

  PUBLISH_TIME_LEEWAY = 1.minute

  field :_id, :as => :base_path, :type => String
  field :publish_time, :type => DateTime

  validates :base_path, :absolute_path => true
  validates :publish_time, :presence => true

  def past?
    publish_time <= PUBLISH_TIME_LEEWAY.ago
  end
end
