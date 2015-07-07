class CreateVideosVideos < ActiveRecord::Migration

  def up
    create_table :refinery_videos do |t|
      t.string :title
      t.string :video_key
      t.integer :draft, :default => true
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-videos"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => Refinery::Videos.videos_path})
    end

    drop_table :refinery_videos

  end

end
