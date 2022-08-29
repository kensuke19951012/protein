class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @members = Member.all
  end

  def destroy
    Member.destroy(params[:id])
    redirect_to admin_members_path
  end
end
