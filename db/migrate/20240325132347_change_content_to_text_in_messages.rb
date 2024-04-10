# frozen_string_literal: true

class ChangeContentToTextInMessages < ActiveRecord::Migration[7.1]
  def change
    change_column :messages, :content, :text, comment: '消息内容返回的文本超长'
  end
end
