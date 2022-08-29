class CommentsController < ApplicationController

def index
 comments = Comment.where(params[:post_id])
 redirect_to post_path(comments)
end
 def create
    post = Post.find(params[:post_id])
    comment = current_member.comments.new(comment_params)
    comment.post_id = post.id
    comment.comments = params[:comment]
    comment.member_id = current_member.id
    comment.save
    redirect_to post_path(post)
  end

   def destroy
    Comment.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

  def comment_params
    params.permit(:post_id,)
  end

end

