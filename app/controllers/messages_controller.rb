# frozen_string_literal: true

class MessagesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!

  def create
    @message = Message.create(message_params.merge(chat_id: params[:chat_id], role: 'user'))

    GetAiResponse.perform_later(@message.chat_id)

    respond_to(&:turbo_stream)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end