class HeroinesController < ApplicationController
	before_action :set_heroine, only: [:show]

	def index
		@heroines = Heroine.all
	end

	def show
	end

	def new
		@heroine = Heroine.new
	end

	def create
		new_heroine = Heroine.new(heroine_params)
		if new_heroine.save
			redirect_to heroine_path(new_heroine)
		else
			flash[:errors] = new_heroine.errors.full_messages
			redirect_to new_heroine_path
		end
	end

	def search
		@power_search = Power.find_by_name(params[:q])
		render :index
	end

	private

	def set_heroine
		@heroine = Heroine.find(params[:id])
	end

	def heroine_params
		params.require(:heroine).permit(:name, :super_name, :power_id)
	end
end
