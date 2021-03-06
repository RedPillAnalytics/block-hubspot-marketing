connection: "@{CONNECTION_NAME}"

include: "/views/*.view.lkml"
include: "*.explore.lkml"
include: "*.dashboard.lookml"
include: "//@{CONFIG_PROJECT_NAME}/*.view.lkml"
include: "//@{CONFIG_PROJECT_NAME}/*.model.lkml"
include: "//@{CONFIG_PROJECT_NAME}/*.dashboard"

explore: contact {
  extends: [contact_core]
}

explore: owner {
  extends: [owner_core]
}
