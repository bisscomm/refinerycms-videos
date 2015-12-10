module Refinery
  module Videos
    class VideosController < ::ApplicationController

      before_action :find_all_videos
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @video in the line below:
        present(@page)
      end

    protected

      def find_all_videos
        @videos = Video.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.find_by(link_url: Refinery::Videos.videos_path)
      end

    end
  end
end
