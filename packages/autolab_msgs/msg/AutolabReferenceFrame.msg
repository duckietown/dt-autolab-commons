# Reference Frame Type
# Ranges are split this way:
#   reserved:   1-20
#   watchtower: 20-29
#   duckiebot:  30-39
uint8 ENTITY_TYPE_UNKNOWN = 0
uint8 ENTITY_TYPE_WORLD = 1
uint8 ENTITY_TYPE_GROUND_TAG = 2
uint8 ENTITY_TYPE_WATCHTOWER_CAMERA = 20
uint8 ENTITY_TYPE_DUCKIEBOT_FOOTPRINT = 30
uint8 ENTITY_TYPE_DUCKIEBOT_TAG = 31

time     time
uint8    type
string   name
string   robot