class CategoriesController < ApplicationController
  before_action :set_category, :except => [:index, :new, :create]

  def index
    @categories = Category.all
    render json: @categories

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new()
    if @category.save
      render json: @category, status: :created, location: @category
      redirect_to categories_path, alert: "Category #{@category.name} has been created"
    else
      render json: @category.errors, status: :unprocessable_entity
      render new_category_path
    end
  end

  def show
    respond_to do |format|
      format.html {render :show }
    end
  end

  def edit
  end

  def update
    @category.update(category_params)
    render json: @category, status: :ok, location: @category
    redirect_to category_path, alert: "This category has been updated"
  end

  def destroy
    @category.destroy
    format.json { head :no_content }
    redirect_to root_path, alert: "Category #{@category.name} has been deleted"
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end


