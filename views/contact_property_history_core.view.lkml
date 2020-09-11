include: "//@{CONFIG_PROJECT_NAME}/contact_property_history.view.lkml" 
        
        
view: contact_property_history {
  extends: [contact_property_history_config]
}

###################################################
        
view: contact_property_history_core {
  sql_table_name: @{DATASET_NAME}.CONTACT_PROPERTY_HISTORY ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${contact_id} AS STRING), CAST(${timestamp} AS STRING), CAST(${name} AS STRING) ;;
  }

  dimension: contact_id {
    type: number
    hidden: yes
    sql: ${TABLE}.contact_id ;;
  }

  dimension: name {
    type: number
    sql: ${TABLE}.name ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: source_id {
    type: number
    sql: ${TABLE}.source_id ;;
    hidden: yes
  }

  dimension: source_label {
    type: string
    sql: ${TABLE}.source_label ;;
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}.source_type ;;
  }

  dimension: timestamp {
    type: number
    sql: ${TABLE}.timestamp ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [name, contact.id]
  }
}
