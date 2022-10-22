puts 'Start inserting seed "lot_actions"...'
Lot.all.each do |lot|
  lot_action = lot.build_lot_action(
    action_id: Action.where(action_location_types: lot.location_type_id).ids.first
    # action_id: 1
  )
  lot_action.save!
  puts "lot_action No.#{lot_action.id} has created!"
end