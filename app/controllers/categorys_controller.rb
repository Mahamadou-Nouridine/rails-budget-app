class CategorysController < ApplicationController
  def index
    @title="Categories"
    @rigth_el = "menu"
    @left_el = "search"
  end

  def show
    render "show"
  end

  def new

  end
end
