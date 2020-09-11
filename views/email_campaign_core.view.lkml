include: "//@{CONFIG_PROJECT_NAME}/email_campaign.view.lkml" 
        
        
view: email_campaign {
  extends: [email_campaign_config]
}

###################################################
        
view: email_campaign_core {
  sql_table_name: @{DATASET_NAME}.EMAIL_CAMPAIGN ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: app_id {
    type: number
    sql: ${TABLE}.app_id ;;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}.app_name ;;
  }

  dimension: content_id {
    type: number
    sql: ${TABLE}.content_id ;;
    hidden: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;

    link: {
      label: "Campaign Lookup Dashboard"
      url: "/dashboards/hubspot-marketing::campaign_lookup?Campaign Name={{ value }}"
    }
  }

  dimension: num_included {
    type: number
    sql: ${TABLE}.num_included ;;
  }

  dimension: num_queued {
    type: number
    sql: ${TABLE}.num_queued ;;
  }

  dimension: sub_type {
    type: string
    sql: ${TABLE}.sub_type ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, app_name, name, email_event.count]
  }
}
