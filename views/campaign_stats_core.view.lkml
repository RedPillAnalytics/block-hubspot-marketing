include: "//@{CONFIG_PROJECT_NAME}/campaign_stats.view.lkml"


view: campaign_stats {
  extends: [campaign_stats_config]
}

###################################################

view: campaign_stats_core {
  derived_table: {
    explore_source: contact {
      column: created {
        field: email_event.created_raw
      }

      column: campaign_id {
        field: email_campaign.id
      }

      column: opened_count {
        field: email_event.total_recip_openers
      }

      column: delivered_count {
        field: email_event.total_recip_delivered
      }

      column: sent_count {
        field: email_event.total_recip_sent
      }

      column: conversions {
        field: contact_form_submission.conversions
      }

      filters: {
        field: email_event.created_date
        value: "1 years"
      }
    }
    sql_trigger_value: SELECT CURRENT_DATE() ;;
  }

  dimension: id {
    type: string
    sql: CAST(${campaign_id} AS STRING) || ' ' || CAST(${created_date} AS STRING) ;;
    primary_key: yes
  }

  dimension: campaign_id {
    type: string
    hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: sent_count {
    hidden: yes
  }

  dimension: delivered_count {
    hidden: yes
  }

  dimension: opened_count {
    hidden: yes
  }

  dimension: conversions {
    hidden: yes
  }

  dimension_group: created {
    description: "The timestamp (in milliseconds since epoch) when this event was created."
    type: time
    hidden: yes
    timeframes: [date, month, raw]
    datatype: epoch
  }

  measure: average_delivery_rate {
    type: number
    description: "Percent of sent emails that were successfully delivered."
    sql: SAFE_DIVIDE(SUM(${delivered_count}), SUM(${sent_count})) ;;
    value_format_name: percent_2
  }

  measure: average_open_rate {
    type: number
    description: "Percent of sent emails that were opened."
    sql: SAFE_DIVIDE(SUM(${opened_count}), SUM(${sent_count})) ;;
    value_format_name: percent_2
  }

  measure: average_conversion_rate {
    description: "Percent of sent emails that lead to a conversion."
    type: number
    sql: SAFE_DIVIDE(SUM(${conversions}), SUM(${sent_count})) ;;
    value_format_name: percent_2
  }

  measure: average_number_of_sent_emails {
    type: average
    description: "Average number of sent emails for all campaigns."
    sql: (${sent_count}) ;;
    value_format_name: decimal_0
  }
}