class CommentsController < ApplicationController
	before_action :authenticate_usuario!
	before_action :find_commentable, only: :create
	respond_to :js
	
	def create
		@comment = @commentable.comments.new do |comment|
		comment.comment = params[:comment_text]
		comment.user = current_usuario
		end
		@comment.save
	end
	
	def destroy
		@comment = current_usuario.comments.find(params[:id])
		@comment_id = params[:id]
		@comment.destroy
	end
	
	private
	def find_commentable
		@commentable_type = params[:commentable_type].classify
		@commentable = @commentable_type.constantize.find(params[:commentable_id])
	end
end
