string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" LIBXL_BUILD_SHARED)
string(COMPARE EQUAL "${VCPKG_CRT_LINKAGE}" "dynamic" LIBXL_CRT_SHARED)

vcpkg_download_distfile(ARCHIVE
    URLS ""
    FILENAME "libxl-4.0.3.tar.gz"
    SKIP_SHA512
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
    NO_REMOVE_ONE_LEVEL
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DLIBXL_SHARED=${LIBXL_BUILD_SHARED}
        -DMD=${LIBXL_CRT_SHARED}
)

vcpkg_cmake_install()

file(RENAME ${CURRENT_PACKAGES_DIR}/include ${CURRENT_PACKAGES_DIR}/libxl)
file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/include)
file(RENAME ${CURRENT_PACKAGES_DIR}/libxl ${CURRENT_PACKAGES_DIR}/include/libxl)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

file(INSTALL
    ${SOURCE_PATH}/changelog.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright
)
