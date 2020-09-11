include: "//@{CONFIG_PROJECT_NAME}/contact_list.view.lkml" 
        
        
view: contact_list {
  extends: [contact_list_config]
}

###################################################
        
view: contact_list_core {
  sql_table_name: @{DATASET_NAME}.CONTACT_LIST ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: deleteable {
    type: yesno
    sql: ${TABLE}.deleteable ;;
  }

  dimension: dynamic {
    type: yesno
    sql: ${TABLE}.dynamic ;;
  }

  dimension: metadata_error {
    type: string
    sql: ${TABLE}.metadata_error ;;
  }

  dimension: metadata_last_processing_state_change_at {
    type: string
    sql: ${TABLE}.metadata_last_processing_state_change_at ;;
  }

  dimension: metadata_last_size_change_at {
    type: string
    sql: ${TABLE}.metadata_last_size_change_at ;;
  }

  dimension: metadata_processing {
    type: string
    sql: ${TABLE}.metadata_processing ;;
  }

  dimension: metadata_size {
    type: number
    sql: ${TABLE}.metadata_size ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: offset {
    type: string
    sql: ${TABLE}.offset ;;
  }

  dimension: portal_id {
    type: number
    sql: ${TABLE}.portal_id ;;
    hidden: yes
  }

  dimension: updated_at {
    type: string
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, contact_list_member.count]
  }
}
