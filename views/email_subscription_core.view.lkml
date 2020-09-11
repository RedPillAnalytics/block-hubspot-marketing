include: "//@{CONFIG_PROJECT_NAME}/email_subscription.view.lkml" 
        
        
view: email_subscription {
  extends: [email_subscription_config]
}

###################################################
        
view: email_subscription_core {
  sql_table_name: @{DATASET_NAME}.EMAIL_SUBSCRIPTION ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: portal_id {
    type: number
    sql: ${TABLE}.portal_id ;;
    hidden: yes
    description: "An ID referencing the HubSpot account associated with the item. This will correspond to your account."
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
