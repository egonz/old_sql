class ActionController::Base
  
  def self.authenticate(options = {})
    raise Exception, "Authenticate cannot be called on ActionController::Base. Only it's subclasses" if self ==  ActionController::Base
  end

end