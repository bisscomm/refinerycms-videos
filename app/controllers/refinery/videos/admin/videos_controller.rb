module Refinery
  module Videos
    module Admin
      class VideosController < ::Refinery::AdminController

        crudify :'refinery/videos/video',
              :order => "position ASC",
              :include => [:translations]

        protected

        def video_params
          params.require(:video).permit(permitted_video_params)
        end
        
        def after_update_positions
          find_all_videos
          render :partial => '/refinery/videos/admin/videos/sortable_list' and return
        end

        private

        def permitted_video_params
          [
            :title,
            :video_key,
            :draft
          ]
        end

      end
    end
  end
end