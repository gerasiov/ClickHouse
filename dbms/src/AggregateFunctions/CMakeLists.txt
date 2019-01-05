include(${ClickHouse_SOURCE_DIR}/cmake/dbms_glob_sources.cmake)
add_headers_and_sources(clickhouse_aggregate_functions .)

list(REMOVE_ITEM clickhouse_aggregate_functions_sources
    AggregateFunctionFactory.cpp
    AggregateFunctionCombinatorFactory.cpp
    AggregateFunctionState.cpp
    parseAggregateFunctionParameters.cpp
    FactoryHelpers.cpp
)

list(REMOVE_ITEM clickhouse_aggregate_functions_headers
    IAggregateFunction.h
    IAggregateFunctionCombinator.h
    AggregateFunctionFactory.h
    AggregateFunctionCombinatorFactory.h
    AggregateFunctionState.h
    parseAggregateFunctionParameters.h
    FactoryHelpers.h
)

add_library(clickhouse_aggregate_functions ${LINK_MODE} ${clickhouse_aggregate_functions_sources})
target_include_directories (clickhouse_aggregate_functions BEFORE PRIVATE ${COMMON_INCLUDE_DIR} ${DBMS_INCLUDE_DIR} ${CITYHASH_INCLUDE_DIR} ${PCG_RANDOM_INCLUDE_DIR})
