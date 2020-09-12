project_name: "hubspot_demo"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "hubspot_demo"
  export: override_required
}

constant: CONNECTION_NAME {
  value: "snowflake-demo"
  export: override_required
}

constant: DATASET_NAME {
  value: "HUBSPOT"
  export: override_required
}

################ Dependencies ################


local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: CONFIG_PROJECT_NAME {
    value: "hubspot_demo"
  }

  override_constant: CONNECTION_NAME {
    value: "snowflake-demo"
  }

  override_constant: DATASET_NAME {
    value: "@{DATASET_NAME}"
  }
}
