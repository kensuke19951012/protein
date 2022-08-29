class MembersController < ApplicationController
  
  def show
    @member = Member.find(params[:id])
    @post = @member.post.page(params[:page])
  end

  def edit
    @member = Member.find(params[:id])
  end

   def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to member_path
   end


  private

  def member_params
    params.require(:member).permit(:name, :profile_image)
  end

end
