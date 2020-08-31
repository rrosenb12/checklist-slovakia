class CategoriesController < ApplicationController

	before_action :find_category, only: [:show, :edit, :update, :destroy]

	def index 
		@categories = Category.all 
	end

	private

	def find_category
		@category = Category.find(params[:id])
	end



end

