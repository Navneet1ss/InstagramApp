class PicsController < ApplicationController
   before_action :find_pic, only:[:show, :edit, :update, :destroy]
  def index
    @pics = Pic.all
  end
  
  def show
    @pic = Pic.find(params[:id])
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic =Pic.new(pic_params)

    if @pic.save
        redirect_to @pic, notice:"yes it was posted"
    else
        render 'new'
    end
  end

  def edit
    @pic = Pic.find(params[:id])
  end
  
  def update
    @pic = Pic.find(params[:id])

    if @pic.update(pic_params)
        redirect_to @pic ,notice:"Yes post is updated sucessfully"
    else
        render 'edit'
    end
  end

  def destroy
    @pic = Pic.find(params[:id])
    @pic.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def pic_params
    params.require(:pic).permit(:title ,:description)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end

end
