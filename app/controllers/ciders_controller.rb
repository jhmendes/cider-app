class CidersController < ApplicationController

  def index
    @ciders = Cider.all
  end
end
