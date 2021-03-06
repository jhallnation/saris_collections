module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
       (link_to 'Register', new_user_registration_path, class: style) +
        ' '.html_safe +
        (link_to 'Login', new_user_session_path, class: style)
    else
       (link_to 'Logout', destroy_user_session_path, method: :delete, class: style) +
       (link_to 'Edit Account', edit_user_registration_path(current_user), class: style)  
    end
  end

  def image_generator(width:, height:)
    "https://place-hold.it/#{width}x#{height}"
  end

  def check_image img
    if !img.nil?
      img
    else    
      image_generator(width: '350', height: '200')
    end
  end
end
