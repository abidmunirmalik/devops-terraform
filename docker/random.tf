resource "random_id" "r_id" {
    byte_length = 8
}
output "random_id_generated" {
  value = random_id.r_id.id
}

resource "random_integer" "r_integer" {
    min = 1
    max = 100
}
output "random_integer_generated" {
    value = random_integer.r_integer.result
}

resource "random_password" "r_password" {
    length = 8
    special = false
}
output "random_password_generated" {
    value     = random_password.r_password.result
    sensitive = true
}

resource "random_pet" "r_pet" {}
output "random_pet_generated" {
    value = random_pet.r_pet.id
}

resource "random_shuffle" "r_shuffle" {
    input = [ "apples", "bananas", "oranges", "grapes" ]
    result_count = 1
}
output "random_shuffle_generated" {
    value = random_shuffle.r_shuffle.result
}

resource "random_string" "r_string" {
    length = 16
    special = false
}
output "random_string_generated" {
    value = random_string.r_string.result
}

resource "random_uuid" "r_uuid" {}
output "random_uuid_generated" {
    value = random_uuid.r_uuid.result
}