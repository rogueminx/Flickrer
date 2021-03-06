class ImagesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
    @comments = @image.comments
    @users = User.all
    @tags = @image.tags

  end

  def new_tag
    @image = Image.find(params[:id])

    tag = Tag.new
    tag.user_id = params[:user_to_tag]
    tag.image_id = @image.id
    tag.save

    redirect_to image_path(@image)
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    if @image.save
      redirect_to images_path
    else
      render :new
    end
  end

  def edit

    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to image_path(@image)
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path
  end

  private
    def image_params
      params.require(:image).permit(:title, :description, :image)
    end
end
