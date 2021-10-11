# rubocop:disable all
module API
  module V1
    class Posts < Grape::API
      include API::V1::Defaults
      resource :posts do
        desc "Return all posts"
        get "" do
          Post.all
        end
        desc "Return a post"
        params do
          requires :id, type: String, desc: "ID of the user"
        end
        get ":id" do
          Post.where(id: permitted_params[:id]).first!
        end
      end
    end
   end
  end
# rubocop:enable all