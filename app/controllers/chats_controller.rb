# frozen_string_literal: true

class ChatsController < ApplicationController
  respond_to :html

  def new
    @chat = Chat.create(user: current_user)
    respond_with(@chat)
  end

  def create
    @chat = Chat.includes(:messages).where(user: current_user, messages: { id: nil }).first_or_create
    respond_with(@chat)
  end

end
