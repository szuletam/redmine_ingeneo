Redmine::Plugin.register :ingeneo do
  name 'Ingeneo Modifications'
  author 'Ingeneo'
  description ''
  version '0.0.1'
  url ''
  author_url ''
  
  menu :admin_menu, :indicators, {controller: 'indicators', action: 'index'}, :caption => :label_indicators, :html => {:class => 'icon icon-ind-calidad'}

  Rails.configuration.to_prepare do
    WelcomeController.send(:include, WelcomePatch)
  end

  Rails.configuration.to_prepare do
    ApplicationHelper.send(:include, ApplicationHelperPatch)
  end


end
