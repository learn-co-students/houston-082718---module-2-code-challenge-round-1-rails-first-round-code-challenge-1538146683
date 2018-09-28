class HeroinesController < ApplicationController
  def index
    if params[:power]
      @heroines = Heroine.select { |heroine|
        heroine.power.name.downcase.include?(params[:power].downcase)
      }
  else
    @heroines = Heroine.all
  end

  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    heroine = Heroine.new(h_params)
    if heroine.valid?
      heroine.save
      redirect_to heroine_path(heroine)
    else
      flash[:errors] = heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def edit
    @heroine = Heroine.find(params[:id])
  end

  def update
    if @heroine = Heroine.update(params[:id], h_params)
      redirect_to heroine_path(@heroine)
    else
     flash[:errors] = heroine.errors.full_messages
     redirect_to new_heroine_path
    end
  end

  def destroy
    Heroine.find(params[:id]).destroy
    redirect_to heroines_url
  end

private
  def h_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
