class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_categories

  include DeviseWhitelist
  include CategoriesConcern
  include CurrentUserConcern
end
