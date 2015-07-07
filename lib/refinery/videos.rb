require 'refinerycms-core'

module Refinery
  autoload :VideosGenerator, 'generators/refinery/videos/videos_generator'

  module Videos
    require 'refinery/videos/engine'
    require 'refinery/videos/configuration'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
