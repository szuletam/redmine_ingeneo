Redmine::Plugin.register :ingeneo do
  name 'Ingeneo Modifications'
  author 'Ingeneo'
  description ''
  version '0.0.1'
  url ''
  author_url ''
  
  menu :admin_menu, :quality_indicators, {controller: 'quality_indicators', action: 'index'}, :caption => :label_quality_indicators, :html => {:class => 'icon icon-ind-calidad'}

  Rails.configuration.to_prepare do
    WelcomeController.send(:include, WelcomePatch)
  end

end
