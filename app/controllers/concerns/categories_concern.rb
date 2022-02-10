module CategoriesConcern

  def set_categories
    @categories = Category.select('id', 'title', 'slug');
  end

end