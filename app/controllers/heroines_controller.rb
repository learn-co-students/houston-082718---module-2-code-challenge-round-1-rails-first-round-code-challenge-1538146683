class HeroinesController < ApplicationController
  def index
    
    @heroines = Heroine.all
    @powers = Power.all

  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create

    new_heroine = Heroine.new(heroine_params)
    if new_heroine.valid?
      new_heroine.save
      redirect_to new_heroine
    else
      flash[:errors] = new_heroine.errors.full_messages
      redirect_to new_heroine_path
    end

    # new_heroine = Heroine.create(heroine_params)
    # redirect_to new_heroine
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
