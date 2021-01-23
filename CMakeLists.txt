project(LibDeepSpeechJni)
cmake_minimum_required(VERSION 3.4.1)

find_package(JNI REQUIRED)
find_package(Java REQUIRED)

add_library(deepspeech-jni SHARED ${CMAKE_SOURCE_DIR}/deepspeech_wrap.cpp)

add_library(deepspeech-lib SHARED IMPORTED)
set_target_properties(deepspeech-lib PROPERTIES IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/libdeepspeech.so)

target_include_directories(deepspeech-jni PRIVATE ${JAVA_INCLUDE_PATH} ${JAVA_INCLUDE_PATH2})
target_link_libraries(deepspeech-jni deepspeech-lib ${JAVA_JVM_LIBRARY})