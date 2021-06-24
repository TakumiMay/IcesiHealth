#######################
## General variables ##
#######################

variable "db_attribute_type_N" {
  type        = string
  default     = "N"
  description = "This is the number attribute type"
}

variable "db_attribute_type_S" {
  type        = string
  default     = "S"
  description = "This is the string attribute type"
}

######################
## Table1 variables ##
######################

variable "db_table1_name" {
  type        = string
  default     = "allergies"
  description = "This is the table name"
}

variable "db_table1_hash_key" {
  type        = string
  default     = "numEntry"
  description = "This is the partition key"
}

variable "db_table1_environment" {
  type        = string
  default     = "production"
  description = "This is the environment tag"
}

variable "db_table1_attribute1" {
  type        = string
  default     = "numEntry"
  description = "This is the position data"
}

variable "db_table1_attribute2" {
  type        = string
  default     = "id"
  description = "This is the allergy id"
}

variable "db_table1_attribute3" {
  type        = string
  default     = "patient_id"
  description = "This is the patient id"
}

variable "db_table1_attribute4" {
  type        = string
  default     = "allergy_start"
  description = "This is the date of allergy start"
}

variable "db_table1_attribute5" {
  type        = string
  default     = "allergy_stop"
  description = "This is the date allergy stop"
}

variable "db_table1_attribute6" {
  type        = string
  default     = "description"
  description = "This is the description about allergy"
}

######################
## Table2 variables ##
######################

variable "db_table2_name" {
  type        = string
  default     = "appointments"
  description = "This is the table name"
}

variable "db_table2_hash_key" {
  type        = string
  default     = "numEntry"
  description = "This is the partition key"
}

variable "db_table2_environment" {
  type        = string
  default     = "production"
  description = "This is the environment tag"
}

variable "db_table2_attribute1" {
  type        = string
  default     = "numEntry"
  description = "This is the position data"
}

variable "db_table2_attribute2" {
  type        = string
  default     = "id"
  description = "This is the id"
}

variable "db_table2_attribute3" {
  type        = string
  default     = "appointment_id"
  description = "This is the appointment id"
}

variable "db_table2_attribute4" {
  type        = string
  default     = "date"
  description = "This is the date of appointment"
}

variable "db_table2_attribute5" {
  type        = string
  default     = "time"
  description = "This is the appointment hour"
}

variable "db_table2_attribute6" {
  type        = string
  default     = "patient_id"
  description = "This is the patient id"
}

variable "db_table2_attribute7" {
  type        = string
  default     = "provider_id"
  description = "This is the provider id"
}

######################
## Table3 variables ##
######################

variable "db_table3_name" {
  type        = string
  default     = "observations"
  description = "This is the table name"
}

variable "db_table3_hash_key" {
  type        = string
  default     = "numEntry"
  description = "This is the partition key"
}

variable "db_table3_environment" {
  type        = string
  default     = "production"
  description = "This is the environment tag"
}

variable "db_table3_attribute1" {
  type        = string
  default     = "numEntry"
  description = "This is the position data"
}

variable "db_table3_attribute2" {
  type        = string
  default     = "id"
  description = "This is the observation id"
}

variable "db_table3_attribute3" {
  type        = string
  default     = "date"
  description = "This is the observation date"
}

variable "db_table3_attribute4" {
  type        = string
  default     = "code"
  description = "This is the observation code"
}

variable "db_table3_attribute5" {
  type        = string
  default     = "description"
  description = "This is the description about observation"
}

variable "db_table3_attribute6" {
  type        = string
  default     = "numeric_value"
  description = "This the numeric value of observation"
}

variable "db_table3_attribute7" {
  type        = string
  default     = "character_value"
  description = "This the character value of observation"
}

variable "db_table3_attribute8" {
  type        = string
  default     = "units"
  description = "This the units of observation"
}

variable "db_table3_attribute9" {
  type        = string
  default     = "patient_id"
  description = "This the patient id"
}

######################
## Table4 variables ##
######################

variable "db_table4_name" {
  type        = string
  default     = "organizations"
  description = "This is the table name"
}

variable "db_table4_hash_key" {
  type        = string
  default     = "numEntry"
  description = "This is the partition key"
}

variable "db_table4_environment" {
  type        = string
  default     = "production"
  description = "This is the environment tag"
}

variable "db_table4_attribute1" {
  type        = string
  default     = "numEntry"
  description = "This is the position data"
}

variable "db_table4_attribute2" {
  type        = string
  default     = "id"
  description = "This is the id"
}

variable "db_table4_attribute3" {
  type        = string
  default     = "organitation_id"
  description = "This is the organitation id"
}

variable "db_table4_attribute4" {
  type        = string
  default     = "name"
  description = "This is the organitation name"
}

variable "db_table4_attribute5" {
  type        = string
  default     = "address"
  description = "This is the organitation address"
}

variable "db_table4_attribute6" {
  type        = string
  default     = "city"
  description = "This is the organitation city"
}

variable "db_table4_attribute7" {
  type        = string
  default     = "state"
  description = "This is the organitation state"
}

variable "db_table4_attribute8" {
  type        = string
  default     = "postcode"
  description = "This is the organitation postcode"
}

######################
## Table5 variables ##
######################

variable "db_table5_name" {
  type        = string
  default     = "patients"
  description = "This is the table name"
}

variable "db_table5_hash_key" {
  type        = string
  default     = "numEntry"
  description = "This is the partition key"
}

variable "db_table5_environment" {
  type        = string
  default     = "production"
  description = "This is the environment tag"
}

variable "db_table5_attribute1" {
  type        = string
  default     = "numEntry"
  description = "This is the position data"
}

variable "db_table5_attribute2" {
  type        = string
  default     = "id"
  description = "This is the id"
}

variable "db_table5_attribute3" {
  type        = string
  default     = "patient_id"
  description = "This is the patient id"
}

variable "db_table5_attribute4" {
  type        = string
  default     = "first_name"
  description = "This is the patient first name"
}

variable "db_table5_attribute5" {
  type        = string
  default     = "last_name"
  description = "This is the patient last name"
}

variable "db_table5_attribute6" {
  type        = string
  default     = "birthdate"
  description = "This is the patient birthdate"
}

variable "db_table5_attribute7" {
  type        = string
  default     = "gender"
  description = "This is the patient gender"
}

variable "db_table5_attribute8" {
  type        = string
  default     = "address"
  description = "This is the patient address"
}

variable "db_table5_attribute9" {
  type        = string
  default     = "city"
  description = "This is the patient city"
}

variable "db_table5_attribute10" {
  type        = string
  default     = "postcode"
  description = "This is the patient postcode"
}

variable "db_table5_attribute11" {
  type        = string
  default     = "user_id"
  description = "This is the patient user_id"
}

variable "db_table5_attribute12" {
  type        = string
  default     = "password"
  description = "This is the patient password"
}

######################
## Table6 variables ##
######################

variable "db_table6_name" {
  type        = string
  default     = "prescriptions"
  description = "This is the table name"
}

variable "db_table6_hash_key" {
  type        = string
  default     = "numEntry"
  description = "This is the partition key"
}

variable "db_table6_environment" {
  type        = string
  default     = "production"
  description = "This is the environment tag"
}

variable "db_table6_attribute1" {
  type        = string
  default     = "numEntry"
  description = "This is the position data"
}

variable "db_table6_attribute2" {
  type        = string
  default     = "id"
  description = "This is the prescription id"
}

variable "db_table6_attribute3" {
  type        = string
  default     = "medication_id"
  description = "This is the medication id"
}

variable "db_table6_attribute4" {
  type        = string
  default     = "drug_name"
  description = "This is the drug name"
}

variable "db_table6_attribute5" {
  type        = string
  default     = "patient_id"
  description = "This is the patient id"
}

variable "db_table6_attribute6" {
  type        = string
  default     = "reason"
  description = "This is the reason about prescription"
}

######################
## Table7 variables ##
######################

variable "db_table7_name" {
  type        = string
  default     = "providers"
  description = "This is the table name"
}

variable "db_table7_hash_key" {
  type        = string
  default     = "numEntry"
  description = "This is the partition key"
}

variable "db_table7_environment" {
  type        = string
  default     = "production"
  description = "This is the environment tag"
}

variable "db_table7_attribute1" {
  type        = string
  default     = "numEntry"
  description = "This is the position data"
}

variable "db_table7_attribute2" {
  type        = string
  default     = "id"
  description = "This is the id"
}

variable "db_table7_attribute3" {
  type        = string
  default     = "provider_id"
  description = "This is the provider id"
}

variable "db_table7_attribute4" {
  type        = string
  default     = "organization_id"
  description = "This is the organization id"
}

variable "db_table7_attribute5" {
  type        = string
  default     = "name"
  description = "This is the provider name"
}

variable "db_table7_attribute6" {
  type        = string
  default     = "speciality"
  description = "This is the provider speciality"
}

