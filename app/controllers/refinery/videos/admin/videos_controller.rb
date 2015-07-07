module Refinery
  module Videos
    module Admin
      class VideosController < ::Refinery::AdminController

        crudify :'refinery/videos/video',
                :xhr_paging => true

      end
    end
  end
end
