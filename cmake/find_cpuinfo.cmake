if (NOT ARCH_ARM)
    option (USE_INTERNAL_CPUINFO_LIBRARY "Set to FALSE to use system cpuinfo library instead of bundled" ${NOT_UNBUNDLED})
endif ()

if (NOT USE_INTERNAL_CPUINFO_LIBRARY)
    find_library (CPUINFO_LIBRARY cpuinfo)
    find_path (CPUINFO_INCLUDE_DIR NAMES cpuinfo.h PATHS ${CPUINFO_INCLUDE_PATHS})
elseif (NOT MISSING_INTERNAL_CPUINFO_LIBRARY)
    set (CPUINFO_INCLUDE_DIR ${ClickHouse_SOURCE_DIR}/contrib/libcpuinfo/include)
    set (USE_INTERNAL_CPUINFO_LIBRARY 1)
    set (CPUINFO_LIBRARY cpuinfo)
endif ()

message (STATUS "Using cpuinfo: ${CPUINFO_INCLUDE_DIR} : ${CPUINFO_LIBRARY}")
