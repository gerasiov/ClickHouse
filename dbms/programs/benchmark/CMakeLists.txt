add_library (clickhouse-benchmark-lib ${LINK_MODE} Benchmark.cpp)
target_link_libraries (clickhouse-benchmark-lib PRIVATE dbms clickhouse-client-lib ${Boost_PROGRAM_OPTIONS_LIBRARY})
target_include_directories (clickhouse-benchmark-lib SYSTEM PRIVATE ${PCG_RANDOM_INCLUDE_DIR})

if (CLICKHOUSE_SPLIT_BINARY)
    add_executable (clickhouse-benchmark clickhouse-benchmark.cpp)
    target_link_libraries (clickhouse-benchmark PRIVATE clickhouse-benchmark-lib clickhouse_aggregate_functions)
    install (TARGETS clickhouse-benchmark ${CLICKHOUSE_ALL_TARGETS} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT clickhouse-benchmark)
endif ()
