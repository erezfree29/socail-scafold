module UsersHelper
  def make_friend_request
    content_tag(:button, class: 'w3-button w3-blue') do
      (unless current_user.id == params[:id].to_i
         link_to 'send friend request', "/users/#{params[:id]}/request", method: :post,
                                                                         data: { confrim: 'Send a friend request?' }
       end)
    end
  end

  def pending_friends_header
    content_tag(:h1) { 'Pending Friends' unless current_user.id != params[:id].to_i }
  end

  def pending_friends
    content_tag_for(:div, @pending_friends) do |friend|
      if current_user.id == params[:id].to_i
        "Name: #{friend.name}" \
        "Email: #{friend.email}"
      end
    end
  end

  def friend_requests_header
    content_tag(:h1) { 'Friends requests' unless current_user.id != params[:id].to_i }
  end

  def friend_requests
    content_tag_for(:div, @requesting_friends) do |friend|
      "Name: #{friend.name}" if current_user.id == params[:id].to_i
    end
  end

  def approve_requests
    content_tag_for(:div, @requesting_friends) do |friend|
      if current_user.id == params[:id].to_i
        (link_to 'approve', "/users/#{current_user.id}/approve/#{friend.id}", method: :put,
                                                                              data: { confrim: 'approve request?' })
      end
    end
  end

  def delete_requests
    content_tag_for(:div, @requesting_friends) do |friend|
      if current_user.id == params[:id].to_i
        (link_to 'delete', "/users/#{current_user.id}/approve/#{friend.id}", method: :delete,
                                                                             data: { confrim: 'approve request?' })
      end
    end
  end
end
