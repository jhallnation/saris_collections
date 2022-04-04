module CategoriesConcern

  def set_categories
    if logged_in?(:site_admin)
      @categories = Category.select('id', 'title', 'slug');
    else 
      @categories = Category.published.select('id', 'title', 'slug');
    end
  end

end