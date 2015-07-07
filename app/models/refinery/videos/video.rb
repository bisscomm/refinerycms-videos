module Refinery
  module Videos
    class Video < Refinery::Core::BaseModel
      self.table_name = 'refinery_videos'

      translates :title, :video_key

      validates :title, presence: true, uniqueness: true

      scope :published, -> { where draft: false }
    end
  end
end
