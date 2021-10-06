combine_osha<- function(df.open_complaints, df.closed_complaints){
  
  # PART 1: Open complaints
  # Create an object open_complaints from the OSHA open_complaints spreadsheet.
  open_complaints <- df.open_complaints %>%
    # Format the data set -- take out the first two rows because they aren't row headings.
    remove_empty() %>%
    slice(-1) %>%
    # Bring row headings to the first line of the data set.
    row_to_names(1) %>%
    clean_names() %>%
    # Create a new column to check the status of the complaint -- open or closed.
    mutate(complaint_status = "open_complaint")
  
  #--#--#--#--#
  
  # PART 2: Closed complaints
  # Create an object closed_complaints from the OSHA closed_complaints spreadsheet.
  closed_complaints <- df.closed_complaints %>%
    # Same as part 1 -- take out the first two rows because they aren't row headings.
    remove_empty() %>%
    slice(-1) %>%
    # Bring row headings to the first line of the data set.
    row_to_names(1) %>%
    clean_names() %>%
    # Create a new column to check the status of the complaint -- open or closed.
    mutate(complaint_status = "closed_complaint")
  
  #--#--#--#--#
  
  #PART 3: Creating a key of osha offices to states from the closed complaints information
  
  ##get number of cases for each rid-site_state grouping
  rid_by_state= closed_complaints %>% group_by(rid, site_state) %>% summarise(number_of_cases = n())
  
  ##isolate the rid's that appear in more than one state
  rid_by_state_morethanone = rid_by_state %>% ungroup() %>% group_by(rid) %>% filter(n() > 1)
  #only keep the rid-state pairing for the rid-state pair that had the majority number of cases
  top_rid_from_morethanone = rid_by_state_morethanone %>% group_by(rid) %>% top_n(1,number_of_cases )
  #a list of the rid's that only have one state
  rid_by_state_onlyone = rid_by_state %>% ungroup() %>% group_by(rid) %>% filter(n() == 1)
  
  #combine the list of rid's that only have 1 state, to the rid list that assigned the rid with multiple states to the state that had the most comlaints, 
  rid_state_key = bind_rows(top_rid_from_morethanone, rid_by_state_onlyone) %>% select(-number_of_cases) %>% rename(rid_state_key = site_state)
  
  #--#--#--#--#
  
  
  # PART 4: Join open and closed complaints
  # Create a new object "complaints." This will be our main dataset.
  federal_osha_complaints <- closed_complaints %>%
    # Use bind_rows to join the two datasets
    bind_rows(open_complaints) %>%
    # Because Excel stores dates in a different format, we convert it to a number.
    mutate(upa_receipt_date = as.numeric(upa_receipt_date)) %>%
    # Then, we use the "excel_numeric_to_date" function to return an actual date
    mutate(upa_receipt_date = excel_numeric_to_date(upa_receipt_date)) %>%
    # We also need to separate the number of alleged hazards and number of employees exposed into two columns.
    separate(number_alleged_hazards_emp_exposed, sep = "/", into = c("number_alleged_hazards","number_employees_exposed"))%>%
    # Next, we take out the spaces after alleged hazards using str_trim.
    mutate(number_alleged_hazards = str_trim(number_alleged_hazards, side = "right")) %>%
    # These columns are stored as characters, so we convert them to numbers.
    mutate(number_alleged_hazards = as.numeric(number_alleged_hazards)) %>%
    mutate(number_employees_exposed = as.numeric(number_employees_exposed)) %>% 
    # In this step, we separate the two NAICS codes into two columns: primary_site_naics_1 and primary_site_naics_2
    separate(primary_site_naics, sep = "/", into = c("primary_site_naics_1","primary_site_naics_2"))%>%
    # Next, we take out the spaces before and after the codes using str_trim.
    mutate(primary_site_naics_1 = str_trim(primary_site_naics_1, side = "both"))%>%
    mutate(primary_site_naics_2 = str_trim(primary_site_naics_2, side = "both"))%>%
    # If/else statement: if primary_site_naics_1 equals primary_site_naics_2, return true in another column, else, return false.
    mutate(naics_check = case_when(
      primary_site_naics_1 == primary_site_naics_2 ~ "true", 
      TRUE ~ "false"
      # primary_site_naics_1 != primary_site_naics_2 ~ "false"
    )) %>% 
    #breaking apart the RID to interpret: first two numbers are OSHA office region, if the 3rd digit is 5 it is a state_plan office, else its a federal plan office
    mutate(osha_office_region = substr(rid, 1,2), office_type_number = substr(rid, 3,3), office_type = ifelse(office_type_number == "5", "state_plan_office", "federal_plan_office") ) %>% 
    #make a column to identify if an inspection occured
    mutate(inspection_occured = ifelse(is.na(insp_number) == FALSE,'yes', 'no')) %>% 
    #add the rid_state_key so that both open and closed complaints can be identified by state
    left_join(rid_state_key, by = "rid") %>% 
    #for rid_stae key, use the site_stae if its a closed_complaint, and use the "guessed" if it was an open complaints
    mutate(rid_state_key = case_when(complaint_status == "closed_complaint" ~ site_state,
                                     complaint_status == "open_complaint" ~ rid_state_key)) 
  
  
  return(federal_osha_complaints)
  
}