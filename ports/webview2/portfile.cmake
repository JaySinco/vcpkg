set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_download_distfile(ARCHIVE
    URLS "https://www.nuget.org/api/v2/package/Microsoft.Web.WebView2/1.0.992.28"
    FILENAME "microsoft.web.webview2.1.0.992.28.nupkg"
    SHA512 ac41fbc607c0a4a792c20f4479dca66a007f56c9e551edeb3aa3c39c034763decbf74b2125dd9c2fb9ed3033c8f781fc17ef72847d68593261039cf16e8172bc
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    NO_REMOVE_ONE_LEVEL
    ARCHIVE ${ARCHIVE}
)

file(COPY ${SOURCE_PATH}/build/native/include/ DESTINATION ${CURRENT_PACKAGES_DIR}/include/)
file(COPY ${SOURCE_PATH}/build/native/x64/WebView2Loader.dll.lib DESTINATION ${CURRENT_PACKAGES_DIR}/lib/)
file(COPY ${SOURCE_PATH}/build/native/x64/WebView2Loader.dll DESTINATION ${CURRENT_PACKAGES_DIR}/bin/)
