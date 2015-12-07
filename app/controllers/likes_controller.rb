class LikesController < ApplicationController
  before_action :find_likeable
  before_action :authenticate_usuario!
  respond_to :js

  def create
    @likeable.liked_by current_usuario
  end

  def destroy
    @likeable.disliked_by current_usuario
  end

  private
  def find_likeable
    @likeable_type = params[:likeable_type].classify
    @likeable = @likeable_type.constantize.find(params[:likeable_id])
  end
end
