@ECHO OFF

%~dp0vcpkg.exe format-manifest --all
%~dp0vcpkg.exe x-add-version --all
