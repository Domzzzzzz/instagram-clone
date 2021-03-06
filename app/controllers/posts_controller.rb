class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.order('created_at DESC').page(params[:page]).per_page(10)
  end

  def new
    @post = current_user.posts.build
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end


  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your new post couldn't be created! Please check the form."
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to posts_path
    else
      flash.now[:alert] = "Update failed. Please check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
    flash[:success] = "Post deleted"
  end

#------------------------------------------------------------------------
  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  # a user can change the URL in the address bar to navigate to another users
  # edit post page, this method prevents that and redirects the user to root
  def owned_post
    unless current_user == @post.user
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to authenticated_root_path
    end
  end

end
