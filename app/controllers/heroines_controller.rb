class HeroinesController < ApplicationController
  def index
    if params[:super_name]
      @heroine = Heroine.where('super_name LIKE ?', "%#{params[:super_name]}%")
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
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
        @heroine.save
        redirect_to heroine_path(@heroine)
    else
        render :new
    end
  end 

      private

      def heroine_params
        params.require(:heroine).permit(:super_name, :name, :power_id)
      end
      


      
end
