class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
  end

  def edit
  end

  def new
  end
end
