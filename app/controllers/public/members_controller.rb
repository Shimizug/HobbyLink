class Public::MembersController < ApplicationController
  before_action :ensure_correct_member, only: [:edit, :update, :unsubscribe, :withdraw]


  def index
    @members = Member.page(params[:page]).per(5)
  end

  def show
    @member = Member.find(params[:id])
    @posts = @member.posts.page(params[:page]).per(3)
    @new_posts = @member.posts.last(4)
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to member_path(@member), notice: "You have updated successfully."
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdraw
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  private

  def member_params
    params.require(:member).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :genre_id, :introduction, :profile_image)
  end

  def ensure_correct_member
    @member = Member.find(params[:id])
    unless @member == current_member
      redirect_to member_path(current_member)
    end
  end
end
