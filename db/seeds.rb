if defined?(::Spree::User)
  ::Spree::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms-banners').blank?
      user.plugins.create(:name => 'refinerycms-banners',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end


#url = "/banners"
#if defined?(::Refinery::Page) && ::Refinery::Page.where(:link_url => url).empty?
#  page = ::Refinery::Page.create(
#    :title => 'Banners',
#    :link_url => url,
#    :deletable => false,
#    :menu_match => "^#{url}(\/|\/.+?|)$"
#  )
#  Refinery::Pages.default_parts.each do |default_page_part|
#    page.parts.create(:title => default_page_part, :body => nil)
#  end
#end

