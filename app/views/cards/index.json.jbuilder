json.array!(@cards) do |card|
  json.extract! card, :id, :name, :attr_one, :attr_two, :attr_three, :attr_four, :attr_five, :attr_six, :attr_description
  json.url card_url(card, format: :json)
end
