class CategoryController < ApplicationController
  def index
    @title="Categories"
    @rigth_el = "menu"
    @left_el = "search"
  end
end
