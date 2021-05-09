module UsersHelper
  def friend_requests
    unless current_user.id == params[:id].to_i
      content_tag(:button ,class: 'w3-button w3-blue') do
        (link_to "send friend request", " /users/#{params[:id]}/request", method: :post, 
        data: {confrim:"Send a friend request?"})
     end
    end
  end
end
