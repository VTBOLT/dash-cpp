cmake_minimum_required(VERSION 3.21.1)

option(LINK_INSIGHT "Link Qt Insight Tracker library" ON)
option(BUILD_QDS_COMPONENTS "Build design studio components" ON)

project(Bolt_DashApp LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Core Gui Qml Quick)

if (Qt6_VERSION VERSION_GREATER_EQUAL 6.3)
    qt_standard_project_setup()
endif()

qt_add_executable(Bolt_DashApp src/main.cpp
    backend.h backend.cpp
    can.cpp
    can.h
    web.h
    web.cpp
    gpsprocessing.cpp gpsprocessing.h
    src/includes/source/NMEAParser.cpp
    src/includes/source/GPSService.cpp
    src/includes/source/GPSFix.cpp
    src/includes/source/NMEACommand.cpp
    src/includes/source/NumberConversion.cpp
    nmea_decoder.cpp nmea_decoder.h

)

qt_add_resources(Bolt_DashApp "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf
)

target_include_directories(Bolt_DashApp PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src/includes/headers)

target_link_libraries(Bolt_DashApp PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    pigpio
)

find_library(PIGPIO_LIBRARY pigpio)
if (PIGPIO_LIBRARY)
    target_link_libraries(Bolt_DashApp PRIVATE ${PIGPIO_LIBRARY})
endif()

find_library(GPS_LIBRARY gps)
if (GPS_LIBRARY)
    target_link_libraries(Bolt_DashApp PRIVATE ${GPS_LIBRARY})
endif()

# if (BUILD_QDS_COMPONENTS)
#     include(${CMAKE_CURRENT_SOURCE_DIR}/qmlcomponents)
# endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/qmlmodules)

if (LINK_INSIGHT)
    include(${CMAKE_CURRENT_SOURCE_DIR}/insight)
endif ()

include(GNUInstallDirs)
install(TARGETS Bolt_DashApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
