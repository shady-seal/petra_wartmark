class ArtsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @arts = Art.all
    @request = Request.new
    @arts = Art.paginate(page: params[:page], per_page: 10)
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
    if @art.save
      redirect_to arts_path
    else
      render 'new'
    end
  end

  def edit
    @art = Art.find(params[:id])
  end

  def update
    @art = Art.find(params[:id])
    if @art.update(art_params)
      if params[:art][:photos].present?
        params[:art][:photos].each do |photo|
          @art.photos.attach(photo)
        end
      end
      redirect_to arts_path
    else
      render 'edit'
    end
  end

  def destroy
    @art = Art.find(params[:id])
    @art.destroy
    redirect_to arts_path
  end

  private

  def art_params
    params.require(:art).permit(:name, :price, :size, photos:[])
  end
end
