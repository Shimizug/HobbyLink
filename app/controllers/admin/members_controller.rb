class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_member, only: [:show, :edit, :update]

  def index
    @members = Member.all.page(params[:page]).per(4)
  end

  def show
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to member_path(@member), notice: "You have updated successfully."
    else
      redirect_torequest.referer
    end
  end

  private

  def member_params
    params.require(:member).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end

  def ensure_member
    @member = Member.find(params[:id])
  end
end
  