class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def top
  end

  def index
  end

end
