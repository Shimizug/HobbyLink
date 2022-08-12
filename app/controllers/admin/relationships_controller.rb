class Admin::RelationshipsController < ApplicationController
  def followings
    member = Member.find(params[:member_id])
		@members = member.followings.page(params[:page])
  end

  def followers
    member = Member.find(params[:member_id])
		@members = member.followers.page(params[:page])
  end
  
end
