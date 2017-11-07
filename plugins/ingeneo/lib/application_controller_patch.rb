module ApplicationControllerPatch
  def self.included(base) # :nodoc:
    base.class_eval do
    end

    # Utility methods for all controllers
    def checkRequiredParams(*requiredParams)
      message = ''
      requiredParams.each do |paramSym|
        if params[paramSym].nil? then
          message += "No #{paramSym.to_s} specified.\\n"
        end
      end

      # Throw a bad request if not all parameters are in.
      if message.length > 0 then
        render_error :message => message, :status => 403
        return false;
      end

      return true;

    end

  end
end
