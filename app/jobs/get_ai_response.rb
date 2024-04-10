# frozen_string_literal: true

class GetAiResponse < ApplicationJob
  def perform(chat_id)
    chat = Chat.find(chat_id)
    call_openai(chat: chat)
  end

  private

  def call_openai(chat:)
    message = chat.messages.create(role: 'assistant', content: '')
    # message.broadcast_created

    OpenAI::Client.new(access_token: 'I have no access token').chat(
      parameters: {
        model: 'gpt-3.5-turbo',
        # model: 'gpt-4-turbo-preview',
        messages: Message.for_openai(chat.messages),
        temperature: 0.1,
        stream: stream_proc(message: message)
      }
    )
  end

  def stream_proc(message:)
    proc do |chunk, _bytesize|
      new_content = chunk.dig('choices', 0, 'delta', 'content')
      message.update(content: message.content + new_content) if new_content
    end
  end
end
