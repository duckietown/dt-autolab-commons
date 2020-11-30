# Reference Frame Type
# Ranges are split this way:
#   reserved:   1-9
#   duckietown: 10-29
#   watchtower: 30-39
#   duckiebot:  40-49
uint8 ENTITY_TYPE_UNKNOWN = 0
uint8 ENTITY_TYPE_WORLD = 1
uint8 ENTITY_TYPE_MAP_ORIGIN = 10
uint8 ENTITY_TYPE_GROUND_TAG = 11
uint8 ENTITY_TYPE_WATCHTOWER_CAMERA = 30
uint8 ENTITY_TYPE_DUCKIEBOT_FOOTPRINT = 40
uint8 ENTITY_TYPE_DUCKIEBOT_TAG = 41

time     time
uint8    type
string   name
string   robot