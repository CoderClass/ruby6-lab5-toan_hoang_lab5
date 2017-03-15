class MessagesController < ApplicationController
	def index
		@messages = Message.all
	end

  def new
    @message = Message.new
  end

  def create

    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      flash[:message] = "Send successfully"
      # ActionCable.server.broadcast("chat" , {message: @message.body})
      ActionCable.server.broadcast("chat" , {message: render_message(@message)})
      redirect_to root_path
    else
      flash[:error] = "Send error"
    end

  end

  private 

  def message_params
    params.require(:message).permit(:body)
  end

  def render_message(message)
    ApplicationController.render(partial: 'messages/message', locals: {message: message})
  end


end
