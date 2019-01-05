add_library (clickhouse-local-lib ${LINK_MODE} LocalServer.cpp)
target_link_libraries (clickhouse-local-lib PRIVATE clickhouse-server-lib dbms ${Boost_PROGRAM_OPTIONS_LIBRARY})

if (CLICKHOUSE_SPLIT_BINARY)
    add_executable (clickhouse-local clickhouse-local.cpp)
    target_link_libraries (clickhouse-local PRIVATE clickhouse-local-lib)
endif ()
