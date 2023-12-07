# - Config file for the DGtal package
# It defines the following variables
#  DGTAL_INCLUDE_DIRS - include directories for DGtal
#  DGTAL_LIBRARY_DIRS - library directories for DGtal (normally not used!)
#  DGTAL_LIBRARIES    - libraries to link against
#  DGTAL_VERSION      - version of the DGtal library


set(DGTAL_VERSION "1.4.beta")

include(CMakeFindDependencyMacro)

get_filename_component(DGTAL_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${DGTAL_CMAKE_DIR}/Modules")

#### Required dependencies  ####
find_dependency(Boost REQUIRED
  # NO_HINTS (no Boost_DIR or Boost_DIR-NOTFOUND)
  )
find_dependency(ZLIB REQUIRED
  # NO_HINTS (no ZLIB_DIR or ZLIB_DIR-NOTFOUND)
  )

set(WITH_EIGEN 1)
#include(eigen)
set(DGtalLibDependencies ${DGtalLibDependencies} Eigen3::Eigen)


if(0) #if GMP_FOUND_DGTAL
  find_package(GMP REQUIRED
    # NO_HINTS (no GMP_DIR or GMP_DIR-NOTFOUND)
    )
  set(WITH_GMP 1)
endif()


if(0) #if ITK_FOUND_DGTAL
  set(WITH_ITK 1)
  find_dependency(ITK REQUIRED
    # NO_HINTS (no ITK_DIR or ITK_DIR-NOTFOUND)
    )
    include(${ITK_USE_FILE})
endif()

if(0) #if CAIRO_FOUND_DGTAL
  find_package(Cairo REQUIRED
    # NO_HINTS (no Cairo_DIR or Cairo_DIR-NOTFOUND)
    )
  set(WITH_CAIRO 1)
endif()

if(0) #if HDF5_FOUND_DGTAL
  find_dependency(HDF5 REQUIRED HL C
    # NO_HINTS (no HDF5_DIR or HDF5_DIR-NOTFOUND)
    )
  set(WITH_HDF5 1)
endif()

if (0) #if QGLVIEWER_FOUND_DGTAL
  find_package(QGLVIEWER REQUIRED
    # NO_HINTS (no QGLVIEWER_DIR or QGLVIEWER_DIR-NOTFOUND)
    )
  set(WITH_VISU3D_QGLVIEWER 1)
endif (0)

#-- We force the Qt rediscovering
if (0) #if QT5_FOUND_DGTAL
  find_dependency(Qt5 COMPONENTS Widgets OpenGL Xml REQUIRED
    # NO_HINTS (no Qt5_DIR or Qt5_DIR-NOTFOUND)
    )
  set(WITH_QT5 1)
endif (0)

if(0) #if OPENMP_FOUND_DGTAL
  if(APPLE)
    message("-- Setting OpenMP flags on MacOs. Assuming `brew install libomp`")
    if(CMAKE_C_COMPILER_ID MATCHES "Clang\$")
     IF(EXISTS "/opt/homebrew/")
      message(STATUS "Using M1/Homebrew C paths")
      set(OpenMP_C_FLAGS "-Xpreprocessor -fopenmp  -I/opt/homebrew/include" CACHE INTERNAL "OpenMP flags for #Xcode toolchain.")
      set(OpenMP_C_LIB_NAMES "omp" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
      set(OpenMP_omp_LIBRARY "/opt/homebrew/lib/libomp.dylib" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
      else()
      set(OpenMP_C_FLAGS "-Xpreprocessor -fopenmp -I/usr/local/opt/libomp/include" CACHE INTERNAL "OpenMP flags for Xcode toolchain.")
      set(OpenMP_C_LIB_NAMES "omp" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
      set(OpenMP_omp_LIBRARY "/usr/local/opt/libomp/lib/libomp.dylib" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
     endif()
    endif()
   if(CMAKE_CXX_COMPILER_ID MATCHES "Clang\$")
    IF(EXISTS "/opt/homebrew/")
      message(STATUS "Using M1/Homebrew C++ paths")
      set(OpenMP_CXX_FLAGS "-Xpreprocessor -fopenmp  -I/opt/homebrew/include"  CACHE INTERNAL "OpenMP flags for Xcode toolchain.")
      set(OpenMP_CXX_LIB_NAMES "omp" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
      set(OpenMP_omp_LIBRARY "/opt/homebrew/lib/libomp.dylib" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
    else()
      set(OpenMP_CXX_FLAGS "-Xpreprocessor -fopenmp -I/usr/local/opt/libomp/include" CACHE INTERNAL "OpenMP flags for Xcode toolchain.")
      set(OpenMP_CXX_LIB_NAMES "omp" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
      set(OpenMP_omp_LIBRARY "/usr/local/opt/libomp/lib/libomp.dylib" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
     endif()
    endif()
  endif()
  find_dependency(OpenMP REQUIRED
         # NO_HINTS (no OpenMP_DIR or OpenMP_DIR-NOTFOUND)
         )
  set(WITH_OPENMP 1)
endif()




if(0) #if CGAL_FOUND_DGTAL
  find_dependency(CGAL COMPONENTS Core
    # NO_HINTS (no CGAL_DIR or CGAL_DIR-NOTFOUND)
    )
  set(WITH_CGAL 1)
endif()

if(0) #if FFTW3_FOUND_DGTAL
  find_package(FFTW3 REQUIRED
    # NO_HINTS (no FFTW3_DIR or FFTW3_DIR-NOTFOUND)
    )
  set(WITH_FFTW3 1)
endif()

if(NOT TARGET DGtal)
  # Our imported targets, including dependencies
  include ("${DGTAL_CMAKE_DIR}/DGtalLibraryDepends.cmake")
endif()

set(DGTAL_LIBRARIES DGtal Eigen3::Eigen)
get_target_property(DGTAL_INCLUDE_DIRS DGtal INTERFACE_INCLUDE_DIRECTORIES)





# MacOS

# - Config file for the DGtal package
# It defines the following variables
#  DGTAL_INCLUDE_DIRS - include directories for DGtal
#  DGTAL_LIBRARY_DIRS - library directories for DGtal (normally not used!)
#  DGTAL_LIBRARIES    - libraries to link against
#  DGTAL_VERSION      - version of the DGtal library


set(DGTAL_VERSION "1.4.beta")

include(CMakeFindDependencyMacro)

get_filename_component(DGTAL_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${DGTAL_CMAKE_DIR}/Modules")

#### Required dependencies  ####
find_dependency(Boost REQUIRED
  HINTS "/opt/homebrew/lib/cmake/Boost-1.82.0"
  )
find_dependency(ZLIB REQUIRED
  # NO_HINTS (no ZLIB_DIR or ZLIB_DIR-NOTFOUND)
  )

set(WITH_EIGEN 1)
#include(eigen)
set(DGtalLibDependencies ${DGtalLibDependencies} Eigen3::Eigen)


if(0) #if GMP_FOUND_DGTAL
  find_package(GMP REQUIRED
    # NO_HINTS (no GMP_DIR or GMP_DIR-NOTFOUND)
    )
  set(WITH_GMP 1)
endif()


if(0) #if ITK_FOUND_DGTAL
  set(WITH_ITK 1)
  find_dependency(ITK REQUIRED
    # NO_HINTS (no ITK_DIR or ITK_DIR-NOTFOUND)
    )
    include(${ITK_USE_FILE})
endif()

if(0) #if CAIRO_FOUND_DGTAL
  find_package(Cairo REQUIRED
    # NO_HINTS (no Cairo_DIR or Cairo_DIR-NOTFOUND)
    )
  set(WITH_CAIRO 1)
endif()

if(0) #if HDF5_FOUND_DGTAL
  find_dependency(HDF5 REQUIRED HL C
    # NO_HINTS (no HDF5_DIR or HDF5_DIR-NOTFOUND)
    )
  set(WITH_HDF5 1)
endif()

if (0) #if QGLVIEWER_FOUND_DGTAL
  find_package(QGLVIEWER REQUIRED
    # NO_HINTS (no QGLVIEWER_DIR or QGLVIEWER_DIR-NOTFOUND)
    )
  set(WITH_VISU3D_QGLVIEWER 1)
endif (0)

#-- We force the Qt rediscovering
if (0) #if QT5_FOUND_DGTAL
  find_dependency(Qt5 COMPONENTS Widgets OpenGL Xml REQUIRED
    # NO_HINTS (no Qt5_DIR or Qt5_DIR-NOTFOUND)
    )
  set(WITH_QT5 1)
endif (0)

if(0) #if OPENMP_FOUND_DGTAL
  if(APPLE)
    message("-- Setting OpenMP flags on MacOs. Assuming `brew install libomp`")
    if(CMAKE_C_COMPILER_ID MATCHES "Clang\$")
     IF(EXISTS "/opt/homebrew/")
      message(STATUS "Using M1/Homebrew C paths")
      set(OpenMP_C_FLAGS "-Xpreprocessor -fopenmp  -I/opt/homebrew/include" CACHE INTERNAL "OpenMP flags for #Xcode toolchain.")
      set(OpenMP_C_LIB_NAMES "omp" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
      set(OpenMP_omp_LIBRARY "/opt/homebrew/lib/libomp.dylib" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
      else()
      set(OpenMP_C_FLAGS "-Xpreprocessor -fopenmp -I/usr/local/opt/libomp/include" CACHE INTERNAL "OpenMP flags for Xcode toolchain.")
      set(OpenMP_C_LIB_NAMES "omp" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
      set(OpenMP_omp_LIBRARY "/usr/local/opt/libomp/lib/libomp.dylib" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
     endif()
    endif()
   if(CMAKE_CXX_COMPILER_ID MATCHES "Clang\$")
    IF(EXISTS "/opt/homebrew/")
      message(STATUS "Using M1/Homebrew C++ paths")
      set(OpenMP_CXX_FLAGS "-Xpreprocessor -fopenmp  -I/opt/homebrew/include"  CACHE INTERNAL "OpenMP flags for Xcode toolchain.")
      set(OpenMP_CXX_LIB_NAMES "omp" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
      set(OpenMP_omp_LIBRARY "/opt/homebrew/lib/libomp.dylib" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
    else()
      set(OpenMP_CXX_FLAGS "-Xpreprocessor -fopenmp -I/usr/local/opt/libomp/include" CACHE INTERNAL "OpenMP flags for Xcode toolchain.")
      set(OpenMP_CXX_LIB_NAMES "omp" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
      set(OpenMP_omp_LIBRARY "/usr/local/opt/libomp/lib/libomp.dylib" CACHE INTERNAL "OpenMP lib name for Xcode toolchain.")
     endif()
    endif()
  endif()
  find_dependency(OpenMP REQUIRED
         # NO_HINTS (no OpenMP_DIR or OpenMP_DIR-NOTFOUND)
         )
  set(WITH_OPENMP 1)
endif()




if(0) #if CGAL_FOUND_DGTAL
  find_dependency(CGAL COMPONENTS Core
    # NO_HINTS (no CGAL_DIR or CGAL_DIR-NOTFOUND)
    )
  set(WITH_CGAL 1)
endif()

if(0) #if FFTW3_FOUND_DGTAL
  find_package(FFTW3 REQUIRED
    # NO_HINTS (no FFTW3_DIR or FFTW3_DIR-NOTFOUND)
    )
  set(WITH_FFTW3 1)
endif()

if(NOT TARGET DGtal)
  # Our imported targets, including dependencies
  include ("${DGTAL_CMAKE_DIR}/DGtalLibraryDepends.cmake")
endif()

set(DGTAL_LIBRARIES DGtal Eigen3::Eigen)
get_target_property(DGTAL_INCLUDE_DIRS DGtal INTERFACE_INCLUDE_DIRECTORIES)
