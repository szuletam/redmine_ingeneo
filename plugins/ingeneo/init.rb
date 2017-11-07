Redmine::Plugin.register :ingeneo do
  name 'Ingeneo Modifications'
  author 'Ingeneo'
  description ''
  version '0.0.1'
  url ''
  author_url ''
  
  menu :top_menu, :indicators, {controller: 'indicators', action: 'index'}, :caption => :label_indicators

  Rails.configuration.to_prepare do
    WelcomeController.send(:include, WelcomePatch)
  end

  Rails.configuration.to_prepare do
    ApplicationHelper.send(:include, ApplicationHelperPatch)
  end

  Rails.configuration.to_prepare do
    ApplicationController.send(:include, ApplicationControllerPatch)
  end


end
