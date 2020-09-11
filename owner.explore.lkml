explore: owner_core {
  extension: required 
  label: "Calendar Event"

join: calendar_event {
  sql_on: ${calendar_event.owner_id} = ${owner.owner_id} ;;
  relationship: one_to_many
}
 
}