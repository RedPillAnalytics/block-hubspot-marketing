include: "//@{CONFIG_PROJECT_NAME}/email_event_suppressed.view.lkml" 
        
        
view: email_event_suppressed {
  extends: [email_event_suppressed_config]
}

###################################################
        
view: email_event_suppressed_core {
  sql_table_name: @{DATASET_NAME}.EMAIL_EVENT_SUPPRESSED ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
    group_label: "Suppressed Event"
  }

  dimension: bcc {
    type: string
    sql: ${TABLE}.bcc ;;
    description: "The 'bcc' field of the email message."
    group_label: "Suppressed Event"
  }

  dimension: cc {
    type: string
    sql: ${TABLE}.cc ;;
    description: "The 'cc' field of the email message."
    group_label: "Suppressed Event"
  }

  dimension: email_campaign_group_id {
    type: number
    sql: ${TABLE}.email_campaign_group_id ;;
    group_label: "Suppressed Event"
  }

  dimension: from {
    type: string
    sql: ${TABLE}.``from`` ;;
    description: "The 'from' field of the email message."
    group_label: "Suppressed Event"
  }

  dimension: reply_to {
    type: string
    sql: ${TABLE}.reply_to ;;
    description: "The 'reply-to' field of the email message."
    group_label: "Suppressed Event"
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
    description: "The subject line of the email message."
    group_label: "Suppressed Event"
  }

  measure: count {
    label: "Suppressed Count"
    type: count
    drill_fields: [id]
  }
}
