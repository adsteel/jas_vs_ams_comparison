class PostsController < ApplicationController
  def index
    options = {
      include: ['user', 'comments']
    }

    render json: JasPostSerializer.new(Post.all, options)
  end
end
