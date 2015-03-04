json.array!(@hands) do |hand|
  json.extract! hand, :id, :user_id, :card_id, :game_id
  json.url hand_url(hand, format: :json)
end
