class PostsController < ApplicationController
  def index
    options = {
      include: ['user', 'comments']
    }

    render json: Post.all,
           each_serializer: AmsPostSerializer,
           include: options[:include]
  end
end
