# # ==========================================
# # TUPLE VARIABLE
# # Understand:
# # Fixed movement settings
# # ==========================================

# variable "car_status" {
#   type        = tuple([string, string, string, string])
#   default     = ["left-side", "right-side", "up-side", "down-side"]
#   description = "Fixed directional sequence"
# }


# # ==========================================
# # SET VARIABLE
# # Understand:
# # Unique movement directions
# # ==========================================

# variable "unique_directions" {
#   type        = set(string)
#   default     = ["left-side", "right-side", "up-side", "down-side"]
#   description = "Unique car movement directions"
# }