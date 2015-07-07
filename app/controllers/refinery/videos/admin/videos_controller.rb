module Refinery
  module Videos
    module Admin
      class VideosController < ::Refinery::AdminController

        crudify :'refinery/videos/video',
              :order => "position ASC",
              :include => [:translations],
              :xhr_paging => true

        private
          def video_params
            params.require(:video).permit(
              :title,
              :video_key,
              :draft
            )
          end

        protected
          def after_update_positions
            find_all_videos
            render :partial => '/refinery/videos/admin/videos/sortable_list' and return
          end
      end
    end
  end
end