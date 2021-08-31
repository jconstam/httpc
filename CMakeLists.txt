cmake_minimum_required(VERSION 3.16)

set(PROJECT_NAME httpc)

project(${PROJECT_NAME} C)

set(SOURCES
    src/main.c
)

include_directories(
	src/
    osi/
)
add_executable(${PROJECT_NAME} ${SOURCES})
target_link_libraries(${PROJECT_NAME} pthread czmq)
