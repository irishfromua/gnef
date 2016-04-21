class AppealsController < ApplicationController

  before_filter :authorize

  def index
    @appeals = Appeal.all
  end

  def show
    @appeal = Appeal.find(params[:user_id])
  end

  def new
    @appeal = Appeal.new
  end

  def edit
    @appeal = Appeal.find(params[:id])
  end

  def create
    @appeal = Appeal.new(appeal_params)
    if @appeal.save
      redirect_to @appeal
    else
      render 'new'
    end
  end

  def update
    @appeal = Appeal.find(params[:id])
    if @appeal.update(appeal_params)
      redirect_to @appeal
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
    params.require(:appeal).permit(:title, :description, :contact)
  end

end