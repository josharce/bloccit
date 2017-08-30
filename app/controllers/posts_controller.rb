class PostsController < ApplicationController
  def index
    @posts = Post.all

    @posts.each {|post| post.title = "SPAM" if post.id == 1 || post.id % 5 == 0}
  end

  def show
  end

  def new
  end

  def edit
  end
end
