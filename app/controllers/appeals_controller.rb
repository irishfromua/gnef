class AppealsController < ApplicationController

  before_filter :authorize

  def index
   # @appeals = Appeal.all
   @appeals = Appeal.where(user_id: current_user.id)
  end

  def show
    @appeal = Appeal.find(params[:id])
    if @appeal.user_id == current_user.id
      render 'show'
    else
      redirect_to '/appeals'
    end
  end

  def new
    @appeal = Appeal.new
  end

  def edit
   @appeal = Appeal.find(params[:id])
  end

  def create
    @appeal = Appeal.new(appeal_params)
    @appeal.user_id = current_user.id
    if @appeal.save
      redirect_to @appeal
    else
      render 'new'
    end
  end

  # def update
  #   @appeal = Appeal.find(params[:id])
  #   if @appeal.update(appeal_params)
  #     redirect_to @appeal
  #   else
  #     render 'edit'
  #   end
  # end

  def update
    @appeal = Appeal.find(params[:id])
    if @appeal.user_id == current_user.id
      if @appeal.update(appeal_params)
        redirect_to @appeal
      else
        render 'edit'
      end
    else
      render 'edit'
    end
  end

  def destroy
    @appeal = Appeal.find(params[:id])
    @appeal.destroy
    redirect_to appeals_path
  end

private
  def appeal_params
    params.require(:appeal).permit(:user_id, :title, :description, :contact)
  end

end
