include: "//@{CONFIG_PROJECT_NAME}/email_event_print.view.lkml" 
        
        
view: email_event_print {
  extends: [email_event_print_config]
}

###################################################
        
view: email_event_print_core {
  sql_table_name: @{DATASET_NAME}.EMAIL_EVENT_PRINT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
    group_label: "Printed Event"
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
    description: "A JSON object representing the browser which serviced the event. Its comprised of the properties: 'name', 'family', 'producer', 'producer_url', 'type', 'url', 'version'."
    group_label: "Printed Event"
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
    group_label: "Printed Event"
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
    description: "A JSON object representing the location where the event occurred. It's comprised of the properties: 'city', 'state', 'country'."
    group_label: "Printed Event"
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
    description: "The user agent responsible for the event, e.g. “Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36”"
    group_label: "Printed Event"
  }

  measure: count {
    label: "Printed Count"
    type: count
    drill_fields: [id]
  }
}
