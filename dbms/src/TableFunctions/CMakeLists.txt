include(${ClickHouse_SOURCE_DIR}/cmake/dbms_glob_sources.cmake)
add_headers_and_sources(clickhouse_table_functions .)

list(REMOVE_ITEM clickhouse_table_functions_sources ITableFunction.cpp TableFunctionFactory.cpp)
list(REMOVE_ITEM clickhouse_table_functions_headers ITableFunction.h TableFunctionFactory.h)

add_library(clickhouse_table_functions ${LINK_MODE} ${clickhouse_table_functions_sources})
target_link_libraries(clickhouse_table_functions PRIVATE ${Poco_Foundation_LIBRARY} ${CITYHASH_LIBRARIES} ${MYSQLXX_LIBRARY})

target_include_directories (clickhouse_table_functions SYSTEM BEFORE PUBLIC ${DBMS_INCLUDE_DIR} ${COMMON_INCLUDE_DIR})
