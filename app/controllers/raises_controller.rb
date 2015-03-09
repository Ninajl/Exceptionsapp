class RaisesController <ApplicationController

  def index
    raise AccessDenied
  end

end
