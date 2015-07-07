module Refinery
  module Videos
    include ActiveSupport::Configurable

    config_accessor :videos_path

    self.videos_path = "/videos"
  end
end