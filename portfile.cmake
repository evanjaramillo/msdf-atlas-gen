vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlumsky/msdf-atlas-gen
    REF 2ede254314a2512252a225fa6c975948d6af559a
    SHA512 c6e78ee2689eeb72dff38e4482c0ee360d0a7125d8cb210314adee8f10fd85476a4469d6e78637b9cc213f8b96afbdf13d38673125b702abc71fdf2c200ab57f
    HEAD_REF master
)
vcpkg_cmake_configure(
        SOURCE_PATH ${SOURCE_PATH}
        OPTIONS
        -DMSDF_ATLAS_BUILD_STANDALONE=OFF
        -DMSDF_ATLAS_NO_ARTERY_FONT=ON
        -DMSDF_ATLAS_MSDFGEN_EXTERNAL=ON
        -DMSDF_ATLAS_INSTALL=ON
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
