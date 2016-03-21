cmake_minimum_required(VERSION 3.2)

project(PomdogTest CXX)
set(PRODUCT_NAME PomdogTest)
set(POMDOG_DIRECTORY_UNITTEST ../../test/FrameworkTest)

set(SOURCE_FILES
  ${POMDOG_DIRECTORY_UNITTEST}/main.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Application/GameClockTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Application/TimerTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Content/PathHelperTest.cpp
  # ${POMDOG_DIRECTORY_UNITTEST}/Async/SchedulerTest.cpp
  # ${POMDOG_DIRECTORY_UNITTEST}/Async/TaskTest.cpp

  # TODO:
  # ${POMDOG_DIRECTORY_UNITTEST}/Experimental/Gameplay/EntityIDTest.cpp
  # ${POMDOG_DIRECTORY_UNITTEST}/Experimental/Gameplay/EntityTest.cpp
  # ${POMDOG_DIRECTORY_UNITTEST}/Experimental/Gameplay/EntityManagerTest.cpp

  ${POMDOG_DIRECTORY_UNITTEST}/Graphics/InputLayoutHelperTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Input/KeyboardStateTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Input/KeysTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Input/MouseStateTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Logging/LogChannelTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Logging/LogTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/BoundingBoxTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/BoundingBox2DTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/BoundingCircleTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/BoundingSphereTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/ColorTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/MathHelperTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/Matrix2x2Test.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/Matrix3x2Test.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/Matrix3x3Test.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/Matrix4x4Test.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/Point2DTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/Point3DTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/QuaternionTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/RayTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/RectangleTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/Vector2Test.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/Vector3Test.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Math/Vector4Test.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Signals/ConnectionTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Signals/ConnectionListTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Signals/EventQueueTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Signals/EventTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Signals/HelpersTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Signals/ScopedConnectionTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Signals/SignalTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Utility/AnyTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Utility/CRC32Test.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Utility/OptionalTest.cpp
  ${POMDOG_DIRECTORY_UNITTEST}/Utility/StringHelperTest.cpp
)

include_directories(
  ../../include
  ../../experimental
  ../../dependencies/iutest/include
)

add_executable(${PRODUCT_NAME} ${SOURCE_FILES})
target_link_libraries(${PRODUCT_NAME} pomdog)

