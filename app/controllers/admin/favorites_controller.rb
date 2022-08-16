class Admin::FavoritesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @member = Member.find(params[:member_id])
    @favorites = Favorite.where(member_id: @member.id)
  end
  
end
