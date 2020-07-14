json.extract! @conversation, :id, :starter_id, :recipient_id, :created_at
json.comments @conversation.messages do |message|
  json.extract! message, :id, :sender_id, :content, :read, :created_at
end
