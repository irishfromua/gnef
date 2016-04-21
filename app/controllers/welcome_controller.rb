class WelcomeController < ApplicationController
  def index
    @appeals = Appeal.all
  end
end
