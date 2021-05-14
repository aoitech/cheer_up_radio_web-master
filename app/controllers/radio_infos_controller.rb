class RadioInfosController < ApplicationController
  before_action :authenticate_user!,only:[:new,:create]
  before_action :admin_user,only:[:new,:create]
  
  def index
    @radio_infos = RadioInfo.all.order("created_at DESC")
  end

  def new
    @radio = RadioInfo.new
    @radio_content = @radio.radio_contents.build
  end

  def create
    @radio = RadioInfo.new(radio_params)
    if @radio.valid?
      @radio.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def radio_params
    params.require(:radio_info).permit(:video, :info, :guest, :time_info, radio_contents_attributes: [:time, :content, :id, :_destroy]).merge(user_id: current_user.id)
  end

  def admin_user
    if current_user.role != "admin"
      flash[:notice]= "不正は許さぬ💪( ˙꒳​˙💪)"
      redirect_to root_path
    end
  end
end
