include: "//@{CONFIG_PROJECT_NAME}/email_event_open.view.lkml"


view: email_event_open {
  extends: [email_event_open_config]
}

###################################################

view: email_event_open_core {
  sql_table_name: @{DATASET_NAME}.EMAIL_EVENT_OPEN ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
    group_label: "Opened Event"
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
    description: "A JSON object representing the browser which serviced the event. Its comprised of the properties: 'name', 'family', 'producer', 'producer_url', 'type', 'url', 'version'."
    group_label: "Opened Event"
  }

  dimension: duration {
    type: string
    sql: ${TABLE}.duration ;;
    description: "If provided and nonzero, the approximate number of milliseconds the user had opened the email."
    group_label: "Opened Event"
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
    group_label: "Opened Event"
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
    description: "A JSON object representing the location where the event occurred. It's comprised of the properties: 'city', 'state', 'country'."
    group_label: "Opened Event"
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
    description: "The user agent responsible for the event, e.g. “Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36”"
    group_label: "Opened Event"
  }

  measure: count {
    label: "Opened Count"
    description: "The recipient opened the message."
    type: number
    sql: ${email_event.total_recip_openers} ;;
    drill_fields: [id]
  }

  measure: opened_pct {
    label: "Opened Percent"
    description: "Percent of sent emails that were opened."
    type: number
    sql: ${email_event.open_ratio} ;;
    drill_fields: [id]
    value_format_name: percent_2
  }
}