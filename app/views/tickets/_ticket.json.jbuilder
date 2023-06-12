json.extract! ticket, :id, :requestNumber, :sequenceNumber, :requestType, :requestAction, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
