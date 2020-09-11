include: "//@{CONFIG_PROJECT_NAME}/contact_list_member.view.lkml" 
        
        
view: contact_list_member {
  extends: [contact_list_member_config]
}

###################################################
        
view: contact_list_member_core {
  sql_table_name: @{DATASET_NAME}.CONTACT_LIST_MEMBER ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${contact_id} AS STRING), CAST(${contact_list_id} AS STRING)) ;;
  }

  dimension: added_at {
    type: string
    sql: ${TABLE}.added_at ;;
  }

  dimension: contact_id {
    type: number
    hidden: yes
    sql: ${TABLE}.contact_id ;;
  }

  dimension: contact_list_id {
    type: number
    hidden: yes
    sql: ${TABLE}.contact_list_id ;;
  }

  measure: count {
    type: count
    drill_fields: [contact_list.name, contact_list.id, contact.id]
  }
}
