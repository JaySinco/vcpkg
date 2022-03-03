set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_download_distfile(ARCHIVE
    URLS "https://download.pytorch.org/libtorch/lts/1.8/cu111/libtorch-win-shared-with-deps-1.8.2%2Bcu111.zip"
    FILENAME "libtorch-win-shared-with-deps-1.8.2+cu111.zip"
    SHA512 46706c278c0fb16118fdea42d433837d7b345c4d248f2b076b0c5b41e05688706047e71969c898f9936b90ceaddae670002932aefeebd6f54b4a40f1748f4789
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
)

file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/etc/libtorch)
file(RENAME ${SOURCE_PATH}/include/ ${CURRENT_PACKAGES_DIR}/etc/libtorch/include/)
file(RENAME ${SOURCE_PATH}/lib/ ${CURRENT_PACKAGES_DIR}/etc/libtorch/lib/)
file(RENAME ${SOURCE_PATH}/share/ ${CURRENT_PACKAGES_DIR}/etc/libtorch/share/)
