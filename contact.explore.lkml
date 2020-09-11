explore: contact_core {
  extension: required
  join: contact_list_member {
  sql_on: ${contact.id} = ${contact_list_member.contact_id} ;;
  relationship: many_to_one
}

join: contact_list {
  sql_on: ${contact_list_member.contact_list_id} = ${contact_list.id} ;;
  relationship: one_to_many
}

join: contact_property_history {
  sql_on: ${contact.id} = ${contact_property_history.contact_id} ;;
  relationship: one_to_many
}

join: contact_form_submission {
  sql_on: ${contact.id} = ${contact_form_submission.contact_id} ;;
  relationship: one_to_many
}

join: form {
  sql_on: ${contact_form_submission.form_id} = ${form.guid} ;;
  relationship: many_to_one
}

join: email_event {
  sql_on: ${contact.email} = CAST(${email_event.recipient} AS STRING) ;;
  relationship: one_to_many
}

join: sequences {
  fields: [touch_sequence]
  sql_on: CAST(${email_event.recipient} AS STRING) = ${sequences.email} AND
    ${email_event.created_raw} =  ${sequences.sent_on_raw} ;;
  relationship: one_to_one
}

join: email_campaign {
  sql_on: ${email_event.email_campaign_id} = ${email_campaign.id} ;;
  relationship: many_to_one
}

join: campaign_stats {
  sql_on: ${email_event.created_raw} = ${campaign_stats.created_raw} ;;
  relationship: one_to_one
  type: full_outer
}

join: email_subscription_change {
  sql_on: ${email_event.id} = ${email_subscription_change.caused_by_event_id} ;;
  relationship: one_to_one
}

join: email_subscription {
  sql_on: ${email_subscription_change.subscription_id} = ${email_subscription.id} ;;
  relationship: many_to_one
}

join: email_event_sent {
  sql_on: ${email_event.id} = ${email_event_sent.id} ;;
  view_label: "Email Event Attributes"
  relationship: one_to_one
}

join: email_event_suppressed {
  sql_on: ${email_event.id} = ${email_event_suppressed.id} ;;
  view_label: "Email Event Attributes"
  relationship: one_to_one
}

join: email_event_click {
  sql_on: ${email_event.id} = ${email_event_click.id} ;;
  view_label: "Email Event Attributes"
  relationship: one_to_one
}

join: email_event_dropped {
  sql_on: ${email_event.id} = ${email_event_dropped.id} ;;
  view_label: "Email Event Attributes"
  relationship: one_to_one
}

join: email_event_open {
  sql_on: ${email_event.id} = ${email_event_open.id} ;;
  view_label: "Email Event Attributes"
  relationship: one_to_one
}

join: email_event_delivered {
  sql_on: ${email_event.id} = ${email_event_delivered.id} ;;
  view_label: "Email Event Attributes"
  relationship: one_to_one
}

join: email_event_forward {
  sql_on: ${email_event.id} = ${email_event_forward.id} ;;
  view_label: "Email Event Attributes"
  relationship: one_to_one
}

join: email_event_deferred {
  sql_on: ${email_event.id} = ${email_event_deferred.id} ;;
  view_label: "Email Event Attributes"
  relationship: one_to_one
}

join: email_event_print {
  sql_on: ${email_event.id} = ${email_event_print.id} ;;
  view_label: "Email Event Attributes"
  relationship: one_to_one
}

join: email_event_bounce {
  sql_on: ${email_event.id} = ${email_event_bounce.id} ;;
  view_label: "Email Event Attributes"
  relationship: one_to_one
}

join: email_event_spam_report {
  sql_on: ${email_event.id} = ${email_event_spam_report.id} ;;
  view_label: "Email Event Attributes"
  relationship: one_to_one
}

join: email_event_status_change {
  sql_on: ${email_event.id} = ${email_event_status_change.id} ;;
  view_label: "Email Event Attributes"
  relationship: one_to_one
}

}
