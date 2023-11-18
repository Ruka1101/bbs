class MessagesController < ApplicationController
    # GET /posts/:id/new
    def new
        @message = Message.new
    end

    # POST /posts/:id/new
    def create
        @message = Message.new(message_params)
        @post = Post.find(params[:id])
        @message.receiver_name = @post.user.name
        @message.receiver_email = @post.user.email
        @message.save!
        
        if @message.save
            # MessageMailer.send_message(@message).deliver
            redirect_to root_path, notice: 'メッセージを送信しました。'
        else
            redirect_to new_messages_path
        end
    end

    private

    def message_params
        params.require(:message).permit(:sender_name, :sender_email, :subject, :content)
    end
end
