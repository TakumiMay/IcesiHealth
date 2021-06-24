resource "aws_dynamodb_table" "table-1" {
  name           = var.db_table1_name
  hash_key       = var.db_table1_hash_key

  attribute {
    name = var.db_table1_attribute1
    type = var.db_attribute_type_N
  }

  attribute {
    name = var.db_table1_attribute2
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table1_attribute3
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table1_attribute4
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table1_attribute5
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table1_attribute6
    type = var.db_attribute_type_S
  }

  tags = {
    Name        = var.db_table1_name
    Environment = var.db_table1_environment
    responsible = var.tag_responsible
  }
}

resource "aws_dynamodb_table" "table-2" {
  name           = var.db_table2_name
  hash_key       = var.db_table2_hash_key

  attribute {
    name = var.db_table2_attribute1
    type = var.db_attribute_type_N
  }

  attribute {
    name = var.db_table2_attribute2
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table2_attribute3
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table2_attribute4
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table2_attribute5
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table2_attribute6
    type = var.db_attribute_type_S
  }
  
  attribute {
    name = var.db_table2_attribute7
    type = var.db_attribute_type_S
  }

  tags = {
    Name        = var.db_table2_name
    Environment = var.db_table2_environment
    responsible = var.tag_responsible
  }
}

resource "aws_dynamodb_table" "table-3" {
  name           = var.db_table3_name
  hash_key       = var.db_table3_hash_key

  attribute {
    name = var.db_table3_attribute1
    type = var.db_attribute_type_N
  }

  attribute {
    name = var.db_table3_attribute2
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table3_attribute3
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table3_attribute4
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table3_attribute5
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table3_attribute6
    type = var.db_attribute_type_S
  }
  
  attribute {
    name = var.db_table3_attribute7
    type = var.db_attribute_type_S
  }
  
  attribute {
    name = var.db_table3_attribute8
    type = var.db_attribute_type_S
  }
  
  attribute {
    name = var.db_table3_attribute9
    type = var.db_attribute_type_S
  }

  tags = {
    Name        = var.db_table3_name
    Environment = var.db_table3_environment
    responsible = var.tag_responsible
  }
}

resource "aws_dynamodb_table" "table-4" {
  name           = var.db_table4_name
  hash_key       = var.db_table4_hash_key

  attribute {
    name = var.db_table4_attribute1
    type = var.db_attribute_type_N
  }

  attribute {
    name = var.db_table4_attribute2
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table4_attribute3
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table4_attribute4
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table4_attribute5
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table4_attribute6
    type = var.db_attribute_type_S
  }
  
  attribute {
    name = var.db_table4_attribute7
    type = var.db_attribute_type_S
  }
  
  attribute {
    name = var.db_table4_attribute8
    type = var.db_attribute_type_S
  }

  tags = {
    Name        = var.db_table4_name
    Environment = var.db_table4_environment
    responsible = var.tag_responsible
  }
}

resource "aws_dynamodb_table" "table-5" {
  name           = var.db_table5_name
  hash_key       = var.db_table5_hash_key

  attribute {
    name = var.db_table5_attribute1
    type = var.db_attribute_type_N
  }

  attribute {
    name = var.db_table5_attribute2
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table5_attribute3
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table5_attribute4
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table5_attribute5
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table5_attribute6
    type = var.db_attribute_type_S
  }
  
  attribute {
    name = var.db_table5_attribute7
    type = var.db_attribute_type_S
  }
  
  attribute {
    name = var.db_table5_attribute8
    type = var.db_attribute_type_S
  }
  
  attribute {
    name = var.db_table5_attribute9
    type = var.db_attribute_type_S
  }
  
  attribute {
    name = var.db_table5_attribute10
    type = var.db_attribute_type_S
  }
  
  attribute {
    name = var.db_table5_attribute11
    type = var.db_attribute_type_S
  }
  
  attribute {
    name = var.db_table5_attribute12
    type = var.db_attribute_type_S
  }

  tags = {
    Name        = var.db_table5_name
    Environment = var.db_table5_environment
    responsible = var.tag_responsible
  }
}

resource "aws_dynamodb_table" "table-6" {
  name           = var.db_table6_name
  hash_key       = var.db_table6_hash_key

  attribute {
    name = var.db_table6_attribute1
    type = var.db_attribute_type_N
  }

  attribute {
    name = var.db_table6_attribute2
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table6_attribute3
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table6_attribute4
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table6_attribute5
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table6_attribute6
    type = var.db_attribute_type_S
  }

  tags = {
    Name        = var.db_table6_name
    Environment = var.db_table6_environment
    responsible = var.tag_responsible
  }
}

resource "aws_dynamodb_table" "table-7" {
  name           = var.db_table7_name
  hash_key       = var.db_table7_hash_key

  attribute {
    name = var.db_table7_attribute1
    type = var.db_attribute_type_N
  }

  attribute {
    name = var.db_table7_attribute2
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table7_attribute3
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table7_attribute4
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table7_attribute5
    type = var.db_attribute_type_S
  }

  attribute {
    name = var.db_table7_attribute6
    type = var.db_attribute_type_S
  }

  tags = {
    Name        = var.db_table7_name
    Environment = var.db_table7_environment
    responsible = var.tag_responsible
  }
}
