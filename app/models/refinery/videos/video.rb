module Refinery
  module Videos
    class Video < Refinery::Core::BaseModel
      self.table_name = 'refinery_videos'

      attr_accessible :title, :video_key, :draft, :position

      validates :title, :presence => true, :uniqueness => true

      scope :published, -> { where :draft => false }
    end
  end
end
