include: "//@{CONFIG_PROJECT_NAME}/email_event_sent.view.lkml"


view: email_event_sent {
  extends: [email_event_sent_config]
}

###################################################

view: email_event_sent_core {
  sql_table_name: @{DATASET_NAME}.EMAIL_EVENT_SENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
    group_label: "Sent Event"
  }

  dimension: bcc {
    type: string
    sql: ${TABLE}.bcc ;;
    description: "The 'bcc' field of the email message."
    group_label: "Sent Event"
  }

  dimension: cc {
    type: string
    sql: ${TABLE}.cc ;;
    description: "The 'cc' field of the email message."
    group_label: "Sent Event"
  }

  dimension: from {
    type: string
    sql: ${TABLE}.`from` ;;
    description: "The 'from' field of the email message."
    group_label: "Sent Event"
  }

  dimension: reply_to {
    type: string
    sql: ${TABLE}.reply_to ;;
    description: "The 'reply-to' field of the email message."
    group_label: "Sent Event"
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
    description: "The subject line of the email message."
    group_label: "Sent Event"
  }

  measure: count {
    label: "Sent Count"
    description: "The message was sent to and received by our delivery provider, which has queued it for further handling."
    type: number
    sql: ${email_event.total_recip_sent} ;;
    drill_fields: [id]
  }
}
