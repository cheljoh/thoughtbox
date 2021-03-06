class LinksController < ApplicationController

  def index
    if current_user.nil?
      redirect_to login_path
    else
      if current_user.links
        @links = current_user.links
      end
    end
  end

  def create
    @link = current_user.links.create(link_params)
    if @link.save
      redirect_to root_path
    else
      flash[:notice] = "Your link is not valid, please try again"
      redirect_to root_path
    end
  end

  def edit
    if current_user.nil?
      flash[:notice] = "Please log in!"
    end
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to root_path
    else
      flash[:notice] = "Your link is not valid, please try again"
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end

end
