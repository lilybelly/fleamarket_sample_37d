class ImagesController < ApplicationController
  def create
    @image = @item.images.new(create_params)
  end

  private
  def create_params
    params.require(:image).permit(:item_id, :file)
  end
end

    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'  }
        format.json
      end
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
