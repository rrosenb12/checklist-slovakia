class CategoriesController < ApplicationController

	before_action :find_category, only: [:show, :edit, :update, :destroy]

	def index 
		@categories = Category.all 
	end

	def show
	end

	private

	def params

	end

	def find_category
		@category = Category.find(params[:id])
	end



end

