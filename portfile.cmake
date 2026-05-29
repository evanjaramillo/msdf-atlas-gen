
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlumsky/msdf-atlas-gen
    REF f6a1bc9f76cdaee40a4392e4b4c151cdc959bbb9
    SHA512 0
    HEAD_REF master
)


vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake)

file(
  INSTALL "${SOURCE_PATH}/LICENSE.txt"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright
)

file(
    COPY "${CURRENT_PACKAGES_DIR}/share/${PORT}/${PORT}"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share"
)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/${PORT}/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
