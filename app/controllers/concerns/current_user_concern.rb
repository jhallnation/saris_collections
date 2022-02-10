module CurrentUserConcern
  extend ActiveSupport

  def current_user
    super || guest_user 
  end

  def guest_user
    guest = GuestUser.new
    guest.first_name = 'Guest'
    guest.last_name = 'User'
    guest.email = 'guest@example.com'
    guest
  end
  
end