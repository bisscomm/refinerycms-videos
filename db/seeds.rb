::Refinery::User.all.each do |user|
  user.plugins.where(:name => 'refinery-videos').first_or_create!
end if defined?(::Refinery::User)

Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang
  url = Refinery::Videos.videos_path

  if defined?(Refinery::Page) && Refinery::Page.where(link_url: url).empty?
    page = Refinery::Page.create(
      :title => 'Videos',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end
end
