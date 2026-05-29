vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlumsky/msdf-atlas-gen
    REF 2ede254314a2512252a225fa6c975948d6af559a
    SHA512 d992258037d113fd3f44b1f5b6511993900b9572c3701aade1ad9af0e9bd7a7939f77f0c7e8a730111eaacbdd5425d5e241ad3f52129bf6639a0b128db895781
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
