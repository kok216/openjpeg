SET(CMAKE_MODULE_PATH "${OPENJPEG_SOURCE_DIR}/CMake")
FIND_PACKAGE(FreeImage REQUIRED)
ADD_DEFINITIONS ( -DFREEIMAGE_LIB )
