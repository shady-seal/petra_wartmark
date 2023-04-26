class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      RequestMailer.send_email(@request).deliver_now
      redirect_to art_path, notice: "Request sent!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def request_params
    params.require(:request).permit(:email, :name, :content, :subject)
  end
end
