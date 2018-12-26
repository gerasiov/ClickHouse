option (USE_INTERNAL_GTEST_LIBRARY "Set to FALSE to use system Google Test instead of bundled" ${NOT_UNBUNDLED})

if (NOT EXISTS "${ClickHouse_SOURCE_DIR}/contrib/googletest/googletest/CMakeLists.txt")
   if (USE_INTERNAL_GTEST_LIBRARY)
       message (WARNING "submodule contrib/googletest is missing. to fix try run: \n git submodule update --init --recursive")
       set (USE_INTERNAL_GTEST_LIBRARY 0)
   endif ()
   set (MISSING_INTERNAL_GTEST_LIBRARY 1)
endif ()

if (NOT USE_INTERNAL_GTEST_LIBRARY)
    set (GTEST_SRC_DIR "/usr/src/googletest")
    set (GTEST_MAIN_LIBRARIES gtest_main)
endif ()
