include: "//@{CONFIG_PROJECT_NAME}/email_event_spam_report.view.lkml" 
        
        
view: email_event_spam_report {
  extends: [email_event_spam_report_config]
}

###################################################
        
view: email_event_spam_report_core {
  sql_table_name: @{DATASET_NAME}.EMAIL_EVENT_SPAM_REPORT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
    group_label: "Spam Report Event"
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
    group_label: "Spam Report Event"
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
    description: "The user agent responsible for the event, e.g. “Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36"
    group_label: "Spam Report Event"
  }

  measure: count {
    label: "Reported as Spam Count"
    description: "The recipient flagged the message as spam."
    type: count
    drill_fields: [id]
  }
}
