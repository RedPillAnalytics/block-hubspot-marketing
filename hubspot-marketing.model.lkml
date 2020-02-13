connection: "brick-layer"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: contact {
  join: email_event {
    sql_on: ${contact.id} = ${email_event.recipient} ;;
  }
  join: email_campaign {
    sql_on: ${email_event.email_campaign_id} = ${email_campaign.id} ;;
  }
}

explore: calendar_event {
  join: owner {
    sql_on: ${calendar_event.owner_id} = ${owner.owner_id} ;;
  }
}