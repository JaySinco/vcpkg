set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_download_distfile(ARCHIVE
    URLS "https://download.pytorch.org/libtorch/cu111/libtorch-win-shared-with-deps-1.9.0%2Bcu111.zip"
    FILENAME "libtorch-win-shared-with-deps-1.9.0+cu111.zip"
    SHA512 e7c32bf40bfd60fc0aa7aecc14c5e6fcfc2244bd7b6a1faa13b8e307792fecc910b879ac231a17116563ad9ddfd69c289ee198739531af3a6b6691c6bacdd920
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
)

file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/etc/libtorch)
file(RENAME ${SOURCE_PATH}/include/ ${CURRENT_PACKAGES_DIR}/etc/libtorch/include/)
file(RENAME ${SOURCE_PATH}/lib/ ${CURRENT_PACKAGES_DIR}/etc/libtorch/lib/)
file(RENAME ${SOURCE_PATH}/share/ ${CURRENT_PACKAGES_DIR}/etc/libtorch/share/)
