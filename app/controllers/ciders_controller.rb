class CidersController < ApplicationController

  def index
    @ciders = Cider.all
  end


  def new
    @cider = Cider.new
  end

  def create
    @cider = Cider.new(cider_params)

      if @cider.save
        redirect_to @cider, notice: "Cider Created Successfully!"
      else
        flash[:notice] = "Failed to Save Cider"
        render :new
      end
  end

  def show
    @cider = Cider.find(params[:id])
  end



  private

 # Never trust parameters from the scary internet, only allow the white list through.
 def cider_params
   params.require(:cider).permit(:company, :style, :abv, :season, :description)
 end

end
