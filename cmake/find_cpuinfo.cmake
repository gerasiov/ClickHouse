if (NOT ARCH_ARM)
    option (USE_INTERNAL_CPUINFO_LIBRARY "Set to FALSE to use system cpuinfo library instead of bundled" ${NOT_UNBUNDLED})
endif ()

if (NOT USE_INTERNAL_CPUINFO_LIBRARY)
    find_library (CPUINFO_LIBRARY cpuinfo)
    find_path (CPUINFO_INCLUDE_DIR NAMES cpuinfo.h PATHS ${CPUINFO_INCLUDE_PATHS})
endif ()

if (CPUINFO_LIBRARY)
    set(USE_CPUINFO 1)
else()
    set(USE_CPUINFO 0)
endif ()

message (STATUS "Using cpuinfo: ${CPUINFO_INCLUDE_DIR} : ${CPUINFO_LIBRARY}")
