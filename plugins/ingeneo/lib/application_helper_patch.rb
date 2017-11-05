module ApplicationHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)
    base.class_eval do
      alias_method_chain :javascript_heads ,:modification
    end

  end
  module InstanceMethods
    def javascript_heads_with_modification
      tags = javascript_include_tag('jquery-1.11.1-ui-1.11.0-ujs-3.1.4', 'application', 'responsive', 'ingeneo')
      unless User.current.pref.warn_on_leaving_unsaved == '0'
        tags << "\n".html_safe + javascript_tag("$(window).load(function(){ warnLeavingUnsaved('#{escape_javascript l(:text_warn_on_leaving_unsaved)}'); });")
      end
      tags
    end
  end
end
