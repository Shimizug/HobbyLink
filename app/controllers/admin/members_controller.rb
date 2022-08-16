class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_member, only: [:show, :edit, :update, :destroy]

  def show
    @new_posts = @member.posts.last(4)
  end

  def index
    @members =  Member.where.not(email: "guest@example.com").page(params[:page])
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to admin_member_path(@member), notice: "会員が正常に更新されました。"
    else
      redirect_to request.referer
    end
  end

  def destroy
    if @member.destroy
      redirect_to admin_members_path, notice: "会員が正常に削除されました"
    else
      redirect_to request.referer
    end
  end

  private

  def member_params
    params.require(:member).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :genre_id, :introduction, :profile_image, :is_deleted, :hobby_state)
  end

  def ensure_member
    @member = Member.find(params[:id])
  end
end
