class MessagesController < ApplicationController
before_action :find_message, only: [:show, :edit, :destroy, :update, :upvote, :downvote]

def index
  @q = Message.ransack(params[:q])
  @message = @q.result(distinct: true)
  @category = Category.all
end

def new
  @message = current_user.messages.build
end

def create
    @message = current_user.messages.build(message_params)
    if @message.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

   def update
    if @message.update(message_params)
      redirect_to message_path
    else
      redirect 'edit'
  end
  end



  def destroy
    @message.destroy
    redirect_to root_path
  end


  def upvote
    @message.upvote_from current_user
    redirect_to messages_path
  end

  def downvote
    @message.downvote_from current_user
    redirect_to messages_path
  end



  private


  def message_params
    params.require(:message).permit(:title, :description, category_ids: [])
  end

  def find_message
    @message = Message.find(params[:id])
  end



end
