class HeroinesController < ApplicationController
  # def index
  #   @heroines = Heroine.all
  # end

  def index
    @heroines = Heroine.all	    
    if params[:power]
      @heroines = Heroine.select {|heroine| heroine.power.name.downcase.include?(params[:power].downcase)}
    else
      @heroines = Heroine.all
    end
  end	 

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
  end

  # def create
  #   my_heroine = Heroine.create(heroine_params)
  #   redirect_to my_heroine
  # end

  def create
    @heroine = Heroine.new(heroine_params)
     if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      flash[:error] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)

  end
end
