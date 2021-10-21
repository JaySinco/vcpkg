set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_download_distfile(ARCHIVE
    URLS "https://mujoco.org/download/mujoco210-windows-x86_64.zip"
    FILENAME "mujoco210-windows-x86_64.zip"
    SHA512 f1fd6a5ed40128d53508a5f86ec8a1710ddc1a80cc67efc925d0a2cf501b4b5b2c72d1b841427531893ab56897f51e30daeedaaec1874838976fff0564d7d8ed
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
)

file(COPY ${SOURCE_PATH}/bin/mujoco210.dll DESTINATION ${CURRENT_PACKAGES_DIR}/bin/)
file(COPY ${SOURCE_PATH}/bin/mujoco210.lib DESTINATION ${CURRENT_PACKAGES_DIR}/lib/)
file(COPY ${SOURCE_PATH}/include/
    DESTINATION ${CURRENT_PACKAGES_DIR}/include/mujoco/
    PATTERN "glfw3.h" EXCLUDE
    PATTERN "uitools.[ch]" EXCLUDE
)
