include: "//@{CONFIG_PROJECT_NAME}/sequences.view.lkml"


view: sequences {
  extends: [sequences_config]
}

###################################################

view: sequences_inner {
  derived_table: {
    sql: SELECT
          contact.property_email  AS email,
          email_event.created AS email_date
        FROM @{DATASET_NAME}.CONTACT  AS contact
        LEFT JOIN @{DATASET_NAME}.EMAIL_EVENT  AS email_event ON contact.property_email = CAST(email_event.recipient AS STRING)
        GROUP BY 1,2 ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: email {
    type: number
    sql: ${TABLE}.email ;;
    hidden: yes
  }

  dimension: email_date {
    hidden: yes
    type: string
    sql: ${TABLE}.email_date ;;
  }

  set: detail {
    fields: [email, email_date]
  }
}


view: sequences_core {
  derived_table: {
    persist_for: "24 hours"
    sql:
      SELECT
        inner_table.email  AS email,
        inner_table.email_date as sent_on,
        RANK()  OVER (PARTITION BY email ORDER BY email_date) AS touch_sequence
      FROM ${sequences_inner.SQL_TABLE_NAME} as inner_table
      ORDER BY 1 DESC, 2 ASC ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: CAST(${TABLE}.contact_id AS STRING) || ' ' || CAST(${TABLE}.sent_on as STRING) ;;
  }

  dimension: email {
    hidden: yes
    type: number
    sql: ${TABLE}.email ;;
  }

  dimension: touch_sequence {
    view_label: "Contact"
    type: number
    sql: ${TABLE}.touch_sequence ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: sent_on {
    hidden: yes
    type: time
    sql: ${TABLE}.sent_on ;;
    timeframes: [date, raw]
  }

  set: detail {
    fields: [email, sent_on_date, touch_sequence]
  }
}
