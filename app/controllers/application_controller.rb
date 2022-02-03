class ApplicationController < ActionController::Base
  before_action :set_categories

  private
   def set_categories
    @categories = Category.select('id', 'title', 'slug');
  end
end
