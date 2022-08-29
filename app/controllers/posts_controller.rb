class PostsController < ApplicationController


  def index

    @posts = Post.all.order(created_at: :desc)
  end


  def search
    if params[:keyword]
      @posts = Post.search(params[:keyword])
      @keyword = params[:keyword]
      render "index"
    else
      @genre = Genre.find(params[:genre_id])
      @posts = Post.where(genre_id: @genre.id)
      @keyword = params[:keyword]
      render "index"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new

  end

  def new
    @post = Post.new
  end


  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id

    @post.save!
    redirect_to posts_path
  end



  def update
    # respond_to do |format|

    # end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_path
  end

  private

  def post_params
    params.require(:post).permit(:item_name, :image, :post_id, :introduction, :score, :price, :genre_id,:star)
  end
end