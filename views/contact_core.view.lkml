include: "//@{CONFIG_PROJECT_NAME}/contact.view.lkml"


view: contact {
  extends: [contact_config]
}

###################################################

view: contact_core {
  sql_table_name: @{DATASET_NAME}.CONTACT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_address ;;
    description: "The contact's street address, including apartment or unit #"
  }

  dimension: annual_revenue {
    group_label: "Company Info"
    type: number
    sql: ${TABLE}.property_annualrevenue ;;
    description: "Annual company revenue"
  }

  dimension: city {
    group_label: "Demographics"
    type: string
    sql: ${TABLE}.property_city ;;
    description: "A contact's city of residence"
  }

  dimension: company {
    group_label: "Company Info"
    type: string
    sql: ${TABLE}.property_company ;;
    description: "The name of the contact's company. This is separate from the Name property of the contact's associated company and can be set independently. Learn more about the difference between Company name and Associated company."
  }

  dimension: company_size {
    group_label: "Company Info"
    type: number
    sql: ${TABLE}.property_company_size ;;
    description: "The number of company employees"
  }

  dimension: country {
    group_label: "Demographics"
    type: string
    sql: ${TABLE}.property_country ;;
    description: "The contact's country of residence. This might be set via import, form, or integration"
  }

  dimension: currently_in_work_flow {
    type: yesno
    sql: ${TABLE}.property_currentlyinworkflow ;;
    description: "Indicates if the contact is currently enrolled in any workflow."
  }

  dimension: date_of_birth {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_date_of_birth ;;
    description: "The date of birth as provided through a lead ad form, set by the ads tool"
  }

  dimension: degree {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_degree ;;
    description: "The degree as provided through a lead ad form, set by the ads tool"
  }

  dimension: email {
    group_label: "Contact Methods"
    type: string
    sql: ${TABLE}.property_email ;;
    description: "The contact's primary email address."
  }

  dimension: engagements_last_meeting_booked_campaign {
    group_label: "UTM Parameters"
    type: string
    sql: ${TABLE}.property_engagements_last_meeting_booked_campaign ;;
    description: "This UTM parameter shows which marketing campaign (e.g. a specific email) referred the contact to the meetings tool for their most recent booking. This property is only populated when you add tracking parameters to your meeting link."
  }

  dimension: engagements_last_meeting_booked_medium {
    group_label: "UTM Parameters"
    type: string
    sql: ${TABLE}.property_engagements_last_meeting_booked_medium ;;
    description: "This UTM parameter shows which channel (e.g. email) referred the contact to the meetings tool for their most recent booking. This property is only populated when you add tracking parameters to your meeting link."
  }

  dimension: engagements_last_meeting_booked_source {
    group_label: "UTM Parameters"
    type: string
    sql: ${TABLE}.property_engagements_last_meeting_booked_source ;;
    description: "This UTM parameter shows which site (e.g. Twitter) referred the contact to the meetings tool for their most recent booking. This property is only populated when you add tracking parameters to your meeting link."
  }

  dimension: fax {
    group_label: "Contact Methods"
    type: string
    sql: ${TABLE}.property_fax ;;
    description: "The contact's primary fax number"
  }

  dimension: field_of_study {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_field_of_study ;;
    description: "The field of study as provided through a lead ad form, set by the ads tool."
  }

  dimension: first_name {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_firstname ;;
    description: "The contact's first name."
  }

  dimension: full_name {
    group_label: "Personal Info"
    type: string
    sql: CONCAT(${first_name}, ' ', ${last_name}) ;;
    description: "The contact's full name."
    required_fields: [id]
  }

  dimension: gender {
    group_label: "Demographics"
    type: string
    sql: ${TABLE}.property_gender ;;
    description: "The gender as provided through a lead ad form, set by the ads tool"
  }

  dimension: graduation_date {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_graduation_date ;;
    description: "The graduation date of education as provided through a lead ad form, set by the ads tool."
  }

  dimension: all_accessible_team_ids {
    hidden: yes
    type: string
    sql: ${TABLE}.property_hs_all_accessible_team_ids ;;
    description: ""
  }

  dimension: all_owner_ids {
    hidden: yes
    type: string
    sql: ${TABLE}.property_hs_all_owner_ids ;;
    description: ""
  }

  dimension: all_team_ids {
    hidden: yes
    type: string
    sql: ${TABLE}.property_hs_all_team_ids ;;
    description: ""
  }

  dimension: average_page_views {
    hidden: yes
    group_label: "Hubspot Analytics"
    type: number
    sql: ${TABLE}.property_hs_analytics_average_page_views ;;
    description: "The average number of pages the contact sees. This is automatically set by HubSpot for each contact."
  }

  dimension: first_referrer {
    group_label: "Hubspot Analytics"
    type: string
    sql: ${TABLE}.property_hs_analytics_first_referrer ;;
    description: "The first website that referred the contact to your website. This is automatically set by HubSpot for each contact."
  }

  dimension: first_timestamp {
    group_label: "Hubspot Analytics"
    type: string
    sql: ${TABLE}.property_hs_analytics_first_timestamp ;;
    description: "The time and date when the contact first interacted with your business (website visit, form submission, manual contact creation or import). This is automatically set by HubSpot for each contact."
  }

  dimension: first_touch_converting_campaign {
    group_label: "Hubspot Analytics"
    type: number
    sql: ${TABLE}.property_hs_analytics_first_touch_converting_campaign ;;
    description: " the name based on the campaign ID responsible for the first touch creation of this contact. When using this property in other HubSpot tools (e.g., filters, lists), use the campaign ID instead."
  }

  dimension: first_url {
    group_label: "Hubspot Analytics"
    type: string
    sql: ${TABLE}.property_hs_analytics_first_url ;;
    description: "The first page the contact saw on your website. This is automatically set by HubSpot for each contact."
  }

  dimension: last_referrer {
    group_label: "Hubspot Analytics"
    type: string
    sql: ${TABLE}.property_hs_analytics_last_referrer ;;
    description: "The last website that referred the contact to your website. This is automatically set by HubSpot for each contact. This analytics property looks at the last page viewed, so this site can be internal or external."
  }

  dimension: last_touch_converting_campaign {
    group_label: "Hubspot Analytics"
    type: number
    sql: ${TABLE}.property_hs_analytics_last_touch_converting_campaign ;;
    description: "The name based on the campaign ID responsible for the last touch creation of this contact. When using this property in other HubSpot tools (e.g., filters, lists), use the campaign ID instead."
  }

  dimension: last_url {
    group_label: "Hubspot Analytics"
    type: string
    sql: ${TABLE}.property_hs_analytics_last_url ;;
    description: "The last page the contact saw on your website. This is automatically set by HubSpot for each contact."
  }

  dimension: num_event_completions {
    hidden: yes
    group_label: "Hubspot Analytics"
    type: number
    sql: ${TABLE}.property_hs_analytics_num_event_completions ;;
    description: "The sum of all events the contact has experienced. This is automatically set by HubSpot for each contact."
  }

  dimension: num_page_views {
    hidden: yes
    group_label: "Hubspot Analytics"
    type: number
    sql: ${TABLE}.property_hs_analytics_num_page_views ;;
    description: "The sum of all pages the contact has seen on your website. This is automatically set by HubSpot for each contact."
  }

  dimension: num_visits {
    hidden: yes
    group_label: "Hubspot Analytics"
    type: number
    sql: ${TABLE}.property_hs_analytics_num_visits ;;
    description: ""
  }

  dimension: revenue {
    group_label: "Hubspot Analytics"
    type: number
    sql: ${TABLE}.property_hs_analytics_revenue ;;
    description: "Event revenue can be set on a contact using HubSpot's events tool."
  }

  dimension: source {
    group_label: "Hubspot Analytics"
    type: string
    sql: ${TABLE}.property_hs_analytics_source ;;
    description: "The first known source through which the contact found your website. This is automatically set by HubSpot. The property options are not editable, but an individual's Original source value can be manually changed to any of the options."
  }

  dimension: source_data_1 {
    group_label: "Hubspot Analytics"
    type: string
    sql: ${TABLE}.property_hs_analytics_source_data_1 ;;
    description: "additional information about the source through which the contact first found your website; view some example values. This is automatically set by HubSpot and cannot be manually changed for a contact. Formerly labeled as Original source data 1."
  }

  dimension: source_data_2 {
    group_label: "Hubspot Analytics"
    type: string
    sql: ${TABLE}.property_hs_analytics_source_data_2 ;;
    description: "additional information about the source through which the contact first found your website; view some example values. This is automatically set by HubSpot and cannot be changed for a contact. Formerly labeled as Original source data 2."
  }

  dimension: avatar_filemanager_key {
    hidden: yes
    type: string
    sql: ${TABLE}.property_hs_avatar_filemanager_key ;;
    description: ""
  }

  dimension: buying_role {
    group_label: "Sales Lifecycle"
    type: string
    sql: ${TABLE}.property_hs_buying_role ;;
    description: ""
  }

  dimension: content_membership_notes {
    group_label: "Content Membership"
    type: string
    sql: ${TABLE}.property_hs_content_membership_notes ;;
    description: "The notes relating to the contact's content membership."
  }

  dimension: content_membership_registration_domain_sent_to {
    group_label: "Content Membership"
    type: string
    sql: ${TABLE}.property_hs_content_membership_registration_domain_sent_to ;;
    description: "The domain to which the registration invitation email for content membership was sent to."
  }

  dimension: content_membership_status {
    group_label: "Content Membership"
    type: yesno
    sql: ${TABLE}.property_hs_content_membership_status ;;
    description: "The status of the contact's content membership."
  }

  dimension: conversations_visitor_email {
    group_label: "Email Settings"
    type: string
    sql: ${TABLE}.property_hs_conversations_visitor_email ;;
    description: ""
  }

  dimension: email_last_email_name {
    group_label: "Email Settings"
    type: string
    sql: ${TABLE}.property_hs_email_last_email_name ;;
    description: "The name of the last marketing email sent."
  }

  dimension: email_optout {
    group_label: "Email Settings"
    type: yesno
    sql: ${TABLE}.property_hs_email_optout ;;
    description: "Indicates that the current email address has opted out from emails of the specified type."
  }

  dimension: email_optout_7720336 {
    group_label: "Email Settings"
    type: yesno
    sql: ${TABLE}.property_hs_email_optout_7720336 ;;
    description: ""
  }

  dimension: email_quarantined {
    group_label: "Email Settings"
    type: yesno
    sql: ${TABLE}.property_hs_email_quarantined ;;
    description: "indicates that the current email address has been quarantined for anti-abuse reasons. HubSpot will not send any marketing emails to quarantined email addresses."
  }

  dimension: email_quarantined_reason {
    group_label: "Email Settings"
    type: string
    sql: ${TABLE}.property_hs_email_quarantined_reason ;;
    description: ""
  }

  dimension: email_confirmation_status {
    group_label: "Email Settings"
    type: yesno
    sql: ${TABLE}.property_hs_emailconfirmationstatus ;;
    description: "The status of the contact's eligibility to receive email."
  }

  dimension: facebook_id {
    group_label: "Social Media"
    type: string
    sql: ${TABLE}.property_hs_facebookid ;;
    description: ""
  }

  dimension: feedback_last_nps_follow_up {
    group_label: "Feedback"
    type: string
    sql: ${TABLE}.property_hs_feedback_last_nps_follow_up ;;
    description: ""
  }

  dimension: feedback_last_nps_rating {
    group_label: "Feedback"
    type: string
    sql: ${TABLE}.property_hs_feedback_last_nps_rating ;;
    description: "The last NPS survey rating that this contact gave."
  }

  dimension: google_click_id {
    group_label: "Social Media"
    type: string
    sql: ${TABLE}.property_hs_google_click_id ;;
    description: ""
  }

  dimension: google_plus_id {
    group_label: "Social Media"
    type: string
    sql: ${TABLE}.property_hs_googleplusid ;;
    description: ""
  }

  dimension: ip_timezone {
    group_label: "IP Info"
    type: string
    sql: ${TABLE}.property_hs_ip_timezone ;;
    description: "The timezone reported by a contact's IP address. This is automatically set by HubSpot and can be used for segmentation and reporting. This property is used to determine a contact's time zone for the time zone send email feature. "
  }

  dimension: language {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_hs_language ;;
    description: "The contact's preferred language for communications. This might be set via import, form, or integration."
  }

  dimension: lead_status {
    group_label: "Sales Lifecycle"
    type: string
    sql: ${TABLE}.property_hs_lead_status ;;
    description: "A contact and company property that indicates where a contact or company is within a buying cycle as a lead."
  }

  dimension: legal_basis {
    type: string
    sql: ${TABLE}.property_hs_legal_basis ;;
    description: "Under the General Data Protection Regulation (GDPR), companies need a lawful reason to use and process contact data and must keep records of consent and evidence of other lawful purposes of processing."
  }

  dimension: linkedin_id {
    group_label: "Social Media"
    type: string
    sql: ${TABLE}.property_hs_linkedinid ;;
    description: ""
  }

  dimension: marketable_reason_id {
    group_label: "Marketable"
    type: string
    sql: ${TABLE}.property_hs_marketable_reason_id ;;
    description: ""
  }

  dimension: marketable_reason_type {
    group_label: "Marketable"
    type: string
    sql: ${TABLE}.property_hs_marketable_reason_type ;;
    description: ""
  }

  dimension: marketable_status {
    group_label: "Marketable"
    type: string
    sql: ${TABLE}.property_hs_marketable_status ;;
    description: ""
  }

  dimension: marketable_until_renewal {
    group_label: "Marketable"
    type: string
    sql: ${TABLE}.property_hs_marketable_until_renewal ;;
    description: ""
  }

  dimension: merged_object_ids {
    hidden: yes
    type: string
    sql: ${TABLE}.property_hs_merged_object_ids ;;
    description: ""
  }

  dimension: persona {
    type: string
    sql: ${TABLE}.property_hs_persona ;;
    description: "The contact's persona. Personas are fictional, generalized characters that encompass the various needs, goals, and observed behavior patterns among your customers."
  }

  dimension: predictive_contact_score_v_2 {
    group_label: "Hubspot Predictive Fields"
    type: number
    sql: ${TABLE}.property_hs_predictivecontactscore_v_2 ;;
    description: "The probability that a contact will become a customer within the next 90 days. This score is based on demographic information in standard contact properties and interactions logged in the contact timeline such as tracked email clicks and meetings booked."
  }

  dimension: predictive_contact_score_bucket {
    group_label: "Hubspot Predictive Fields"
    type: string
    sql: ${TABLE}.property_hs_predictivecontactscorebucket ;;
    description: ""
  }

  dimension: predictive_scoring_tier {
    group_label: "Hubspot Predictive Fields"
    type: string
    sql: ${TABLE}.property_hs_predictivescoringtier ;;
    description: "A ranking system of contacts evenly assigned into four tiers. Contacts in tier one are more likely to become customers than contacts in tier four."
  }

  dimension: social_facebook_clicks {
    group_label: "Social Media"
    type: number
    sql: ${TABLE}.property_hs_social_facebook_clicks ;;
    description: ""
  }

  dimension: social_google_plus_clicks {
    group_label: "Social Media"
    type: number
    sql: ${TABLE}.property_hs_social_google_plus_clicks ;;
    description: ""
  }

  dimension: social_linkedin_clicks {
    group_label: "Social Media"
    type: number
    sql: ${TABLE}.property_hs_social_linkedin_clicks ;;
    description: ""
  }

  dimension: social_num_broadcast_clicks {
    group_label: "Social Media"
    type: number
    sql: ${TABLE}.property_hs_social_num_broadcast_clicks ;;
    description: ""
  }

  dimension: social_twitter_clicks {
    group_label: "Social Media"
    type: number
    sql: ${TABLE}.property_hs_social_twitter_clicks ;;
    description: ""
  }

  dimension: twitter_id {
    group_label: "Social Media"
    type: string
    sql: ${TABLE}.property_hs_twitterid ;;
    description: ""
  }

  dimension: hubspot_owner_assigneddate {
    group_label: "Owner"
    type: string
    sql: ${TABLE}.property_hubspot_owner_assigneddate ;;
    description: "The most recent date that a contact owner was assigned to a contact. This is set automatically by HubSpot and can be used for segmentation and reporting."
  }

  dimension: hubspot_owner_id {
    group_label: "Owner"
    type: number
    sql: ${TABLE}.property_hubspot_owner_id ;;
    description: "The owner of a contact. This can be any HubSpot user or Salesforce integration user and can be set manually or via Workflows. You can assign additional users to a contact record by creating a custom HubSpot user field type property."
  }

  dimension: hubspot_team_id {
    group_label: "Owner"
    type: number
    sql: ${TABLE}.property_hubspot_team_id ;;
    description: "The team assigned to the contact owner for the contact."
  }

  dimension: industry {
    group_label: "Company Info"
    type: string
    sql: ${TABLE}.property_industry ;;
    description: "The contact's industry."
  }

  dimension: ip_city {
    group_label: "IP Info"
    type: string
    sql: ${TABLE}.property_ip_city ;;
    description: "The city reported by the contact's IP address when they fill out a form. This is automatically set by HubSpot and can be used for segmentation and reporting."
  }

  dimension: ip_country {
    group_label: "IP Info"
    type: string
    sql: ${TABLE}.property_ip_country ;;
    description: "The country reported by the contact's IP address when they fill out a form. This is automatically set by HubSpot and can be used for segmentation and reporting."
  }

  dimension: ip_country_code {
    group_label: "IP Info"
    type: number
    sql: ${TABLE}.property_ip_country_code ;;
    description: " the country code reported by a contact's IP address. This is automatically set by HubSpot and can be used for segmentation and reporting."
  }

  dimension: ip_latlon {
    group_label: "IP Info"
    type: number
    sql: ${TABLE}.property_ip_latlon ;;
    description: ""
  }

  dimension: ip_state {
    group_label: "IP Info"
    type: string
    sql: ${TABLE}.property_ip_state ;;
    description: "The state or region reported by a contact's IP address. This is automatically set by HubSpot and can be used for segmentation and reporting."
  }

  dimension: ip_state_code {
    group_label: "IP Info"
    type: number
    sql: ${TABLE}.property_ip_state_code ;;
    description: "The state code or region code reported by a contact's IP address. This is automatically set by HubSpot and can be used for segmentation and reporting."
  }

  dimension: ip_zipcode {
    group_label: "IP Info"
    type: string
    sql: ${TABLE}.property_ip_zipcode ;;
    description: ""
  }

  dimension: job_function {
    group_label: "Company Info"
    type: string
    sql: ${TABLE}.property_job_function ;;
    description: "The job function as provided through a lead ad form, set by the ads tool."
  }

  dimension: job_title {
    group_label: "Company Info"
    type: string
    sql: ${TABLE}.property_jobtitle ;;
    description: "The contact's job title."
  }

  dimension: last_name {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_lastname ;;
    description: "The contact's last name."
  }

  dimension: lifecycle_stage {
    group_label: "Sales Lifecycle"
    type: string
    sql: ${TABLE}.property_lifecyclestage ;;
    description: "A property used to indicate at what point the contact is within the marketing/sales process. It can be set through imports, forms, workflows, or manually on a per contact basis."
  }

  dimension: linkedin_bio {
    group_label: "Social Media"
    type: string
    sql: ${TABLE}.property_linkedinbio ;;
    description: ""
  }

  dimension: marital_status {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_marital_status ;;
    description: "The marital status as provided through a lead ad form, set by the ads tool."
  }

  dimension: message {
    type: string
    sql: ${TABLE}.property_message ;;
    description: "A default property to be used for any message or comments a contact may want to leave on a form."
  }

  dimension: military_status {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_military_status ;;
    description: "The military status as provided through a lead ad form, set by the ads tool."
  }

  dimension: mobilephone {
    group_label: "Contact Methods"
    type: string
    sql: ${TABLE}.property_mobilephone ;;
    description: "The contact's mobile phone number."
  }

  dimension: num_associated_deals {
    group_label: "Sales Lifecycle"
    type: number
    sql: ${TABLE}.property_num_associated_deals ;;
    description: "The total number of all associated deals."
  }

  dimension: num_employees {
    group_label: "Company Info"
    type: number
    sql: ${TABLE}.property_numemployees ;;
    description: "The number of company employees."
  }

  dimension: owner_email {
    group_label: "Owner"
    type: string
    sql: ${TABLE}.property_owneremail ;;
    description: ""
  }

  dimension: owner_name {
    group_label: "Owner"
    type: string
    sql: ${TABLE}.property_ownername ;;
    description: ""
  }

  dimension: phone {
    group_label: "Contact Methods"
    type: string
    sql: ${TABLE}.property_phone ;;
    description: "The contact's primary phone number."
  }

  dimension: photo {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_photo ;;
    description: ""
  }

  dimension: relationship_status {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_relationship_status ;;
    description: "The relationship status as provided through a lead ad form, set by the ads tool."
  }

  dimension: salutation {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_salutation ;;
    description: "The title used to address the contact."
  }

  dimension: school {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_school ;;
    description: "The school as provided through a lead ad form, set by the ads tool."
  }

  dimension: seniority {
    group_label: "Company Info"
    type: string
    sql: ${TABLE}.property_seniority ;;
    description: "The seniority in the company as provided through a lead ad form, set by the ads tool."
  }

  dimension: start_date {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_start_date ;;
    description: "The start date of education as provided through a lead ad form, set by the ads tool."
  }

  dimension: state {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_state ;;
    description: "The contact's state of residence."
  }

  dimension: twitter_bio {
    group_label: "Social Media"
    type: string
    sql: ${TABLE}.property_twitterbio ;;
    description: ""
  }

  dimension: twitter_handle {
    group_label: "Social Media"
    type: string
    sql: ${TABLE}.property_twitterhandle ;;
    description: ""
  }

  dimension: twitter_profile_photo {
    group_label: "Social Media"
    type: string
    sql: ${TABLE}.property_twitterprofilephoto ;;
    description: ""
  }

  dimension: website {
    group_label: "Company Info"
    type: string
    sql: ${TABLE}.property_website ;;
    description: "The contact's company website."
  }

  dimension: work_email {
    group_label: "Contact Methods"
    type: string
    sql: ${TABLE}.property_work_email ;;
    description: "The work email as provided through a lead ad form, set by the ads tool."
  }

  dimension: zip {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}.property_zip ;;
    description: "The contact's zip code."
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql:  ${TABLE}.property_createdate ;;
    description: "The date that a contact was created in your HubSpot account"
  }

  dimension_group: first_deal_created_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql:  ${TABLE}.property_first_deal_created_date ;;
    description: "The create date of the first deal a contact is associated to."
  }

  dimension_group: lifecycle_stage_lead_date {
    group_label: "Sales Lifecycle"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql:  ${TABLE}.property_hs_lifecyclestage_lead_date ;;
    description: "The date that a contact's lifecycle stage changed to Lead. This is automatically set by HubSpot for each contact."
  }

  dimension_group: lifecycle_stage_opportunity_date {
    group_label: "Sales Lifecycle"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql:  ${TABLE}.property_hs_lifecyclestage_opportunity_date ;;
    description: "The date that a contact's lifecycle stage changed to Opportunity. This is automatically set by HubSpot for each contact."
  }

  dimension_group: last_modified_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql:  ${TABLE}.property_lastmodifieddate ;;
    description: "The last date and time that a property related to this contact was modified."
  }

  measure: count {
    type: count
    drill_fields: [contact_drills*]
  }

  measure: count_last_touch {
    type: sum
    sql: ${last_touch_converting_campaign} ;;
    drill_fields: [contact_drills*]
  }

  measure: average_page_views_m {
    label: "Average Page Views"
    type: average
    sql: ${average_page_views} ;;
  }

  measure: total_page_views {
    type: sum
    sql: ${num_page_views} ;;
  }

  measure: total_events_completed {
    type: sum
    sql: ${num_event_completions} ;;
  }

  measure: total_visits {
    type: sum
    sql: ${num_visits} ;;
  }

  set: contact_drills {
    fields: [id, first_name, last_name, email_last_email_name, owner_name]
  }
}
