set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO python/cpython
    REF v3.8.10
    SHA512 c940eb8b225f2c38558ca9a7c4237910c96bcac64eb9ada310f9a0175faed7d8650d142ee99ee4e16ff0bc883fe0587aed685aa05982b06c67793374932815e9
    HEAD_REF master
)

vcpkg_download_distfile(ARCHIVE
    URLS "cmd.exe /c PCbuild/get_externals.bat"
    FILENAME "python-cpython-v3.8.10-externals.zip"
    SKIP_SHA512
)

file(ARCHIVE_EXTRACT
    INPUT ${ARCHIVE}
    DESTINATION ${SOURCE_PATH}
)

vcpkg_execute_build_process(
    COMMAND cmd.exe /c build.bat -p x64
    WORKING_DIRECTORY ${SOURCE_PATH}/PCbuild
    LOGNAME pc-build-${TARGET_TRIPLET}
)

file(COPY ${SOURCE_PATH}/Include/ DESTINATION ${CURRENT_PACKAGES_DIR}/include/python3/)
file(COPY ${SOURCE_PATH}/PC/pyconfig.h DESTINATION ${CURRENT_PACKAGES_DIR}/include/python3/)
file(COPY ${SOURCE_PATH}/PCbuild/amd64/python38.lib DESTINATION ${CURRENT_PACKAGES_DIR}/lib/)
file(COPY ${SOURCE_PATH}/PCbuild/amd64/python38.dll DESTINATION ${CURRENT_PACKAGES_DIR}/bin/)

file(COPY ${SOURCE_PATH}/PCbuild/amd64/
    DESTINATION ${CURRENT_PACKAGES_DIR}/extras/python3/Lib/
    FILES_MATCHING PATTERN *.pyd
)
file(COPY ${SOURCE_PATH}/PCbuild/amd64/
    DESTINATION ${CURRENT_PACKAGES_DIR}/extras/python3/Lib/
    FILES_MATCHING PATTERN *.dll
)
file(COPY ${SOURCE_PATH}/PCbuild/amd64/python.exe DESTINATION ${CURRENT_PACKAGES_DIR}/extras/python3/)
file(REMOVE ${CURRENT_PACKAGES_DIR}/extras/python3/Lib/vcruntime140.dll)
file(REMOVE ${CURRENT_PACKAGES_DIR}/extras/python3/Lib/vcruntime140_1.dll)
file(REMOVE ${CURRENT_PACKAGES_DIR}/extras/python3/Lib/python3.dll)
file(RENAME ${CURRENT_PACKAGES_DIR}/extras/python3/Lib/python38.dll
    ${CURRENT_PACKAGES_DIR}/extras/python3/python38.dll
)

vcpkg_find_acquire_program(7Z)
vcpkg_execute_build_process(
    COMMAND ${7Z} a ${CURRENT_PACKAGES_DIR}/extras/python3/python38.zip ./Lib/* -x!__pycache__
    WORKING_DIRECTORY ${SOURCE_PATH}
    LOGNAME 7z-lib-${TARGET_TRIPLET}
)
