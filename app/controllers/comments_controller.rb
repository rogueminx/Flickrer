class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:new]

  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    @image = Image.find(params[:image_id])

    @comment = @image.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to image_path(@image)
    else
      render :new
    end
  end

  # def edit
  #   @image = Comment.find(params[:id])
  # end
  #
  # def update
  #   @image = Comment.find(params[:id])
  #   if @image.update(image_params)
  #     redirect_to comments_path
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @image = Comment.find(params[:id])
  #   @image.destroy
  #   redirect_to comments_path
  # end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
