#!/bin/bash

# source original Duckietown entrypoint
source /entrypoint.sh

# constants
CONFIG_DIR=/data/config/autolab
TAG_ID_FILE=${CONFIG_DIR}/tag_id
MAP_NAME_FILE=${CONFIG_DIR}/map_name

echo "==> Autolab Entrypoint"

# if anything weird happens from now on, STOP
set -e

debug(){
  if [ "${DEBUG}" = "1" ]; then
    echo "DEBUG: $1";
  fi
}

configure_autolab(){
  # tag_id
  if [ ${#TAG_ID} -le 0 ]; then
      if [ -f "${TAG_ID_FILE}" ]; then
          TAG_ID=$(cat "${TAG_ID_FILE}")
          if [[ "${TAG_ID}" -le 0 ]]; then
              echo "WARNING: tag_id file has an invalid value, '${TAG_ID}'."
              export TAG_ID="__NOTSET__"
          else
              debug "TAG_ID[${TAG_ID_FILE}]: '${TAG_ID}'"
              export TAG_ID
          fi
      else
          echo "WARNING: tag_id file does not exist."
          export TAG_ID="__NOTSET__"
      fi
  else
      echo "INFO: TAG_ID is externally set to '${TAG_ID}'."
  fi

  # map_name
  if [ ${#MAP_NAME} -le 0 ]; then
      if [ "${TYPE}" = "duckietown" ]; then
          # robots of type `duckietown` belong to themselves
          export MAP_NAME="${VEHICLE_NAME}"
      else
          # any other robot type can declare a map name in a file
          if [ -f "${MAP_NAME_FILE}" ]; then
              MAP_NAME=$(cat "${MAP_NAME_FILE}")
              if [ ${#MAP_NAME} -le 0 ]; then
                  export MAP_NAME="__NOTSET__"
              else
                  debug "MAP_NAME[${MAP_NAME_FILE}]: '${MAP_NAME}'"
                  export MAP_NAME
              fi
          else
              echo "WARNING: map_name file does not exist."
              export MAP_NAME="__NOTSET__"
          fi
      fi
  else
      echo "INFO: MAP_NAME is externally set to '${MAP_NAME}'."
  fi
}

# configure
debug "=> Setting up autolab configuration..."
configure_autolab
debug "<= Done!\n"

# mark this file as sourced
DT_AUTOLAB_ENTRYPOINT_SOURCED=1
export DT_AUTOLAB_ENTRYPOINT_SOURCED

# if anything weird happens from now on, CONTINUE
set +e

echo "<== Autolab Entrypoint"

# reuse DT_LAUNCHER as CMD if the var is set and the first argument is `--`
if [ ${#DT_LAUNCHER} -gt 0 ] && [ "$1" == "--" ]; then
  shift
  exec bash -c "dt-launcher-$DT_LAUNCHER $*"
else
  exec "$@"
fi
