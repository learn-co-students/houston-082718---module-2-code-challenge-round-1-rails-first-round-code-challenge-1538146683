class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

	def new
		@heroine = Heroine.new
	end

  def create
    @heroine = Heroine.new(params.require(:heroine).permit(:name, :super_name, :power_id))
    
		if @heroine.save
			redirect_to heroine_path(@heroine)
		else
      render :new
    end
  end

  def filter
    @heroines = Heroine.where(power_id: params[:power_id])

    render :index
  end
end
