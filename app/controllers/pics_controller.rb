class PicsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show ]
   before_action :find_pic, only: [:show, :edit, :update, :destroy ,:upvote]

  def index
    @pics = Pic.all.order("created_at DESC")
    
  end
  
  def show
    @pic = Pic.find(params[:id])
  end

  def new
    #@pic = Pic.new
    @pic = current_user.pics.build
  end

  def create
    #@pic =Pic.new(pic_params)
    @pic= current_user.pics.build(pic_params)

    if @pic.save
        redirect_to @pic, notice:"yes it was posted"
    else
        render 'new'
    end
  end

  def edit
    @pic = Pic.find(params[:id])
    if @pic.user != current_user
      flash[:error] = "You are not authorized to edit this post."
      redirect_to @pic
    end
  end
  
  def update
    @pic = Pic.find(params[:id])
    if @pic.user == current_user
      if @pic.update(pic_params)
        redirect_to @pic ,notice:"Yes post is updated sucessfully"
      else
        render 'edit'
      end
    else
    flash[:error] = "You are not authorized to update this post."
    redirect_to @pic
    end
  end
  def destroy
    @pic = Pic.find(params[:id])
  
    if @pic.user == current_user
      @pic.destroy
      flash[:notice] = "Post was successfully deleted."
    else
      flash[:error] = "You are not authorized to delete this post."
    end
  
    redirect_to root_path
  end
  def upvote
    @pic.upvote_by current_user
    redirect_to @pic
  end

  private
  def pic_params
    params.require(:pic).permit(:title ,:description , :image)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end

end
