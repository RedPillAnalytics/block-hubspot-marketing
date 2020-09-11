include: "//@{CONFIG_PROJECT_NAME}/email_event_delivered.view.lkml"


view: email_event_delivered {
  extends: [email_event_delivered_config]
}

###################################################

view: email_event_delivered_core {
  sql_table_name: @{DATASET_NAME}.EMAIL_EVENT_DELIVERED ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
    group_label: "Delivered Event"
  }

  dimension: response {
    type: string
    sql: ${TABLE}.response ;;
    description: "The full response from the recipient's email server."
    group_label: "Delivered Event"
  }

  dimension: smtp_id {
    type: number
    sql: ${TABLE}.smtp_id ;;
    hidden: yes
    description: "An ID attached to the message by HubSpot."
    group_label: "Delivered Event"
  }

  measure: count {
    label: "Delivered Count"
    description: " The recipient's email server has accepted the message and the message has been successfully delivered to the recipient."
    type: number
    drill_fields: [id]
    sql: ${email_event.total_recip_delivered} ;;
  }

  measure: delivered_pct {
    label: "Delivered Percent"
    description: "Percent of sent emails that were successfully delivered."
    type: number
    sql: ${email_event.delivered_ratio} ;;
    drill_fields: [id]
    value_format_name: percent_2
  }
}