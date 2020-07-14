json.array! @conversations do |conversation|
  json.extract! conversation, :id, :starter_id, :recipient_id, :created_at
end
