class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def contact
  end

  def about
    @title = "About"
  end
end
