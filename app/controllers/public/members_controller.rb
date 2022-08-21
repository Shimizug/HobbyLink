class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_correct_member, only: [:edit, :update, :unsubscribe, :withdraw]

  def show
    @member = Member.find(params[:id])
    @new_posts = @member.posts.last(4)
  end

  def index
    @members = Member.where(is_deleted: false).where.not(email: "guest@example.com").page(params[:page])
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to member_path(@member), notice: "会員が正常に更新されました。"
    else
      redirect_to request.referer
    end
  end
  
  #退会画面の表示
  def unsubscribe
  end
  
  #退会の操作
  def withdraw
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  private

  def member_params
    params.require(:member).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :genre_id, :introduction, :profile_image, :is_deleted, :hobby_state)
  end

  def ensure_correct_member
    @member = Member.find(params[:id])
    unless @member == current_member
      redirect_to member_path(current_member)
    end
  end
end
