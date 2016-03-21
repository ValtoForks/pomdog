cmake_minimum_required(VERSION 3.2)

set(PRODUCT_NAME pomdog)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED on)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
set(CMAKE_C_FLAGS_DEBUG "-g -O0 -DDEBUG=1")
set(CMAKE_C_FLAGS_RELEASE "-Wall -O2")
set(CMAKE_BUILD_TYPE Release)

set(POMDOG_SOURCES_CORE
  ../../include/Pomdog/Application/Duration.hpp
  ../../include/Pomdog/Application/Game.hpp
  ../../include/Pomdog/Application/GameClock.hpp
  ../../include/Pomdog/Application/GameHost.hpp
  ../../include/Pomdog/Application/GameWindow.hpp
  ../../include/Pomdog/Application/MouseCursor.hpp
  ../../include/Pomdog/Application/Timer.hpp
  ../../include/Pomdog/Application/TimePoint.hpp
  # ../../include/Pomdog/Async/Helpers.hpp
  # ../../include/Pomdog/Async/ImmediateScheduler.hpp
  # ../../include/Pomdog/Async/QueuedScheduler.hpp
  # ../../include/Pomdog/Async/Scheduler.hpp
  # ../../include/Pomdog/Async/Task.hpp
  ../../include/Pomdog/Audio/AudioClip.hpp
  ../../include/Pomdog/Audio/AudioChannels.hpp
  ../../include/Pomdog/Audio/AudioEmitter.hpp
  ../../include/Pomdog/Audio/AudioEngine.hpp
  ../../include/Pomdog/Audio/AudioListener.hpp
  ../../include/Pomdog/Audio/SoundEffect.hpp
  ../../include/Pomdog/Audio/SoundState.hpp
  ../../include/Pomdog/Audio/detail/ForwardDeclarations.hpp
  ../../include/Pomdog/Basic/Export.hpp
  ../../include/Pomdog/Basic/Platform.hpp
  ../../include/Pomdog/Basic/Version.hpp
  ../../include/Pomdog/Content/AssetManager.hpp
  ../../include/Pomdog/Content/AssetBuilders/Builder.hpp
  ../../include/Pomdog/Content/AssetBuilders/PipelineStateBuilder.hpp
  ../../include/Pomdog/Content/AssetBuilders/ShaderBuilder.hpp
  ../../include/Pomdog/Content/Utility/BinaryFileStream.hpp
  ../../include/Pomdog/Content/Utility/BinaryReader.hpp
  ../../include/Pomdog/Content/Utility/MakeFourCC.hpp
  ../../include/Pomdog/Content/detail/AssetDictionary.hpp
  ../../include/Pomdog/Content/detail/AssetLoaderContext.hpp
  ../../include/Pomdog/Content/detail/AssetLoader.hpp
  ../../include/Pomdog/Content/detail/AssetLoaders/AudioClipLoader.hpp
  ../../include/Pomdog/Content/detail/AssetLoaders/Texture2DLoader.hpp
  ../../include/Pomdog/Graphics/Blend.hpp
  ../../include/Pomdog/Graphics/BlendDescription.hpp
  ../../include/Pomdog/Graphics/BlendOperation.hpp
  ../../include/Pomdog/Graphics/BufferUsage.hpp
  ../../include/Pomdog/Graphics/ClearOptions.hpp
  ../../include/Pomdog/Graphics/ComparisonFunction.hpp
  ../../include/Pomdog/Graphics/ConstantBuffer.hpp
  ../../include/Pomdog/Graphics/CullMode.hpp
  ../../include/Pomdog/Graphics/DepthFormat.hpp
  ../../include/Pomdog/Graphics/DepthStencilDescription.hpp
  ../../include/Pomdog/Graphics/DepthStencilOperation.hpp
  ../../include/Pomdog/Graphics/EffectAnnotation.hpp
  ../../include/Pomdog/Graphics/EffectConstantDescription.hpp
  ../../include/Pomdog/Graphics/EffectReflection.hpp
  ../../include/Pomdog/Graphics/EffectVariableClass.hpp
  ../../include/Pomdog/Graphics/EffectVariableType.hpp
  ../../include/Pomdog/Graphics/EffectVariable.hpp
  ../../include/Pomdog/Graphics/FillMode.hpp
  ../../include/Pomdog/Graphics/GraphicsCommandList.hpp
  ../../include/Pomdog/Graphics/GraphicsCommandQueue.hpp
  ../../include/Pomdog/Graphics/GraphicsDevice.hpp
  ../../include/Pomdog/Graphics/IndexBuffer.hpp
  ../../include/Pomdog/Graphics/IndexElementSize.hpp
  ../../include/Pomdog/Graphics/InputClassification.hpp
  ../../include/Pomdog/Graphics/InputElement.hpp
  ../../include/Pomdog/Graphics/InputElementFormat.hpp
  ../../include/Pomdog/Graphics/InputLayoutDescription.hpp
  ../../include/Pomdog/Graphics/InputLayoutHelper.hpp
  ../../include/Pomdog/Graphics/PipelineState.hpp
  ../../include/Pomdog/Graphics/PipelineStateDescription.hpp
  ../../include/Pomdog/Graphics/PresentationParameters.hpp
  ../../include/Pomdog/Graphics/PrimitiveTopology.hpp
  ../../include/Pomdog/Graphics/RasterizerDescription.hpp
  ../../include/Pomdog/Graphics/RenderTarget2D.hpp
  ../../include/Pomdog/Graphics/RenderTargetBlendDescription.hpp
  ../../include/Pomdog/Graphics/SamplerDescription.hpp
  ../../include/Pomdog/Graphics/SamplerState.hpp
  ../../include/Pomdog/Graphics/Shader.hpp
  ../../include/Pomdog/Graphics/ShaderLanguage.hpp
  ../../include/Pomdog/Graphics/ShaderPipelineStage.hpp
  ../../include/Pomdog/Graphics/SurfaceFormat.hpp
  ../../include/Pomdog/Graphics/StencilOperation.hpp
  ../../include/Pomdog/Graphics/Texture.hpp
  ../../include/Pomdog/Graphics/Texture2D.hpp
  ../../include/Pomdog/Graphics/TextureAddressMode.hpp
  ../../include/Pomdog/Graphics/TextureFilter.hpp
  ../../include/Pomdog/Graphics/VertexBuffer.hpp
  ../../include/Pomdog/Graphics/VertexBufferBinding.hpp
  ../../include/Pomdog/Graphics/Viewport.hpp
  ../../include/Pomdog/Graphics/detail/ForwardDeclarations.hpp
  ../../include/Pomdog/Graphics/detail/EffectBinaryParameter.hpp
  ../../include/Pomdog/Graphics/ShaderCompilers/GLSLCompiler.hpp
  ../../include/Pomdog/Graphics/ShaderCompilers/HLSLCompiler.hpp
  ../../include/Pomdog/Graphics/ShaderCompilers/MetalCompiler.hpp
  ../../include/Pomdog/Input/ButtonState.hpp
  ../../include/Pomdog/Input/Gamepad.hpp
  ../../include/Pomdog/Input/GamepadButtons.hpp
  ../../include/Pomdog/Input/GamepadCapabilities.hpp
  ../../include/Pomdog/Input/GamepadDPad.hpp
  ../../include/Pomdog/Input/GamepadState.hpp
  ../../include/Pomdog/Input/GamepadThumbSticks.hpp
  ../../include/Pomdog/Input/GamepadType.hpp
  ../../include/Pomdog/Input/Keyboard.hpp
  ../../include/Pomdog/Input/KeyboardState.hpp
  ../../include/Pomdog/Input/KeyState.hpp
  ../../include/Pomdog/Input/Keys.hpp
  ../../include/Pomdog/Input/Mouse.hpp
  ../../include/Pomdog/Input/MouseState.hpp
  ../../include/Pomdog/Input/PlayerIndex.hpp
  ../../include/Pomdog/Input/TouchLocation.hpp
  ../../include/Pomdog/Input/TouchLocationState.hpp
  ../../include/Pomdog/Logging/Log.hpp
  ../../include/Pomdog/Logging/LogChannel.hpp
  ../../include/Pomdog/Logging/LogEntry.hpp
  ../../include/Pomdog/Logging/LogLevel.hpp
  ../../include/Pomdog/Math/BoundingBox.hpp
  ../../include/Pomdog/Math/BoundingBox2D.hpp
  ../../include/Pomdog/Math/BoundingCircle.hpp
  ../../include/Pomdog/Math/BoundingSphere.hpp
  ../../include/Pomdog/Math/Color.hpp
  ../../include/Pomdog/Math/ContainmentType.hpp
  ../../include/Pomdog/Math/Degree.hpp
  ../../include/Pomdog/Math/MathHelper.hpp
  ../../include/Pomdog/Math/Matrix2x2.hpp
  ../../include/Pomdog/Math/Matrix3x2.hpp
  ../../include/Pomdog/Math/Matrix3x3.hpp
  ../../include/Pomdog/Math/Matrix4x4.hpp
  ../../include/Pomdog/Math/Point2D.hpp
  ../../include/Pomdog/Math/Point3D.hpp
  ../../include/Pomdog/Math/Quaternion.hpp
  ../../include/Pomdog/Math/Radian.hpp
  ../../include/Pomdog/Math/Ray.hpp
  ../../include/Pomdog/Math/Rectangle.hpp
  ../../include/Pomdog/Math/Vector2.hpp
  ../../include/Pomdog/Math/Vector3.hpp
  ../../include/Pomdog/Math/Vector4.hpp
  ../../include/Pomdog/Math/detail/Coordinate2D.hpp
  ../../include/Pomdog/Math/detail/Coordinate3D.hpp
  ../../include/Pomdog/Math/detail/FloatingPointMatrix2x2.hpp
  ../../include/Pomdog/Math/detail/FloatingPointMatrix3x2.hpp
  ../../include/Pomdog/Math/detail/FloatingPointMatrix3x3.hpp
  ../../include/Pomdog/Math/detail/FloatingPointMatrix4x4.hpp
  ../../include/Pomdog/Math/detail/FloatingPointQuaternion.hpp
  ../../include/Pomdog/Math/detail/FloatingPointVector2.hpp
  ../../include/Pomdog/Math/detail/FloatingPointVector3.hpp
  ../../include/Pomdog/Math/detail/FloatingPointVector4.hpp
  ../../include/Pomdog/Math/detail/ForwardDeclarations.hpp
  ../../include/Pomdog/Math/detail/TaggedArithmetic.hpp
  ../../include/Pomdog/Signals/Connection.hpp
  ../../include/Pomdog/Signals/ConnectionList.hpp
  ../../include/Pomdog/Signals/Event.hpp
  ../../include/Pomdog/Signals/EventQueue.hpp
  ../../include/Pomdog/Signals/Helpers.hpp
  ../../include/Pomdog/Signals/ScopedConnection.hpp
  ../../include/Pomdog/Signals/Signal.hpp
  ../../include/Pomdog/Signals/detail/EventBody.hpp
  ../../include/Pomdog/Signals/detail/ForwardDeclarations.hpp
  ../../include/Pomdog/Signals/detail/SignalBody.hpp
  ../../include/Pomdog/Utility/Any.hpp
  ../../include/Pomdog/Utility/Assert.hpp
  ../../include/Pomdog/Utility/Exception.hpp
  ../../include/Pomdog/Utility/FileSystem.hpp
  ../../include/Pomdog/Utility/Optional.hpp
  ../../include/Pomdog/Utility/PathHelper.hpp
  ../../include/Pomdog/Utility/StringHelper.hpp
  ../../include/Pomdog/Utility/detail/CRC32.hpp
  ../../include/Pomdog/Utility/detail/Tagged.hpp
  ../../src/Application/GameClock.cpp
  ../../src/Application/SubsystemScheduler.hpp
  ../../src/Application/SystemEvents.hpp
  ../../src/Application/Timer.cpp
  ../../src/Application/TimeSource.hpp
  # ../../src/Async/ImmediateScheduler.cpp
  # ../../src/Async/QueuedScheduler.cpp
  # ../../src/Async/Task.cpp
  ../../src/Audio/AudioClip.cpp
  ../../src/Audio/AudioEngine.cpp
  ../../src/Audio/SoundEffect.cpp
  ../../src/Basic/ConditionalCompilation.hpp
  ../../src/Content/AssetDictionary.cpp
  ../../src/Content/AssetLoaderContext.cpp
  ../../src/Content/AssetManager.cpp
  ../../src/Content/AssetBuilders/PipelineStateBuilder.cpp
  ../../src/Content/AssetBuilders/ShaderBuilder.cpp
  ../../src/Content/AssetLoaders/AudioClipLoader.cpp
  ../../src/Content/AssetLoaders/Texture2DLoader.cpp
  ../../src/Content/Utility/DDSTextureReader.cpp
  ../../src/Content/Utility/DDSTextureReader.hpp
  ../../src/Content/Utility/MSWaveAudioLoader.cpp
  ../../src/Content/Utility/MSWaveAudioLoader.hpp
  ../../src/Content/Utility/PNGTextureReader.cpp
  ../../src/Content/Utility/PNGTextureReader.hpp
  ../../src/Graphics/ClearOptions.cpp
  ../../src/Graphics/ConstantBuffer.cpp
  ../../src/Graphics/EffectBinaryParameter.cpp
  ../../src/Graphics/EffectReflection.cpp
  ../../src/Graphics/GraphicsCommandList.cpp
  ../../src/Graphics/GraphicsCommandQueue.cpp
  ../../src/Graphics/GraphicsDevice.cpp
  ../../src/Graphics/IndexBuffer.cpp
  ../../src/Graphics/InputLayoutHelper.cpp
  ../../src/Graphics/PipelineState.cpp
  ../../src/Graphics/RenderTarget2D.cpp
  ../../src/Graphics/SamplerState.cpp
  ../../src/Graphics/Texture2D.cpp
  ../../src/Graphics/Viewport.cpp
  ../../src/Graphics/VertexBuffer.cpp
  ../../src/Graphics/ShaderCompilers/GLSLCompiler.cpp
  ../../src/Graphics/ShaderCompilers/HLSLCompiler.cpp
  ../../src/Graphics/ShaderCompilers/MetalCompiler.cpp
  ../../src/Input/KeyboardState.cpp
  ../../src/InputSystem/InputDeviceCreator.hpp
  ../../src/InputSystem/InputDeviceFactory.cpp
  ../../src/InputSystem/InputDeviceFactory.hpp
  ../../src/Logging/Log.cpp
  ../../src/Logging/LogChannel.cpp
  ../../src/Math/BoundingBox.cpp
  ../../src/Math/BoundingBox2D.cpp
  ../../src/Math/BoundingCircle.cpp
  ../../src/Math/BoundingSphere.cpp
  ../../src/Math/Color.cpp
  ../../src/Math/MathHelper.cpp
  ../../src/Math/Ray.cpp
  ../../src/Math/Rectangle.cpp
  ../../src/Math/detail/Coordinate2D.cpp
  ../../src/Math/detail/Coordinate3D.cpp
  ../../src/Math/detail/FloatingPointMatrix2x2.cpp
  ../../src/Math/detail/FloatingPointMatrix3x2.cpp
  ../../src/Math/detail/FloatingPointMatrix3x3.cpp
  ../../src/Math/detail/FloatingPointMatrix4x4.cpp
  ../../src/Math/detail/FloatingPointQuaternion.cpp
  ../../src/Math/detail/FloatingPointVector2.cpp
  ../../src/Math/detail/FloatingPointVector3.cpp
  ../../src/Math/detail/FloatingPointVector4.cpp
  ../../src/RenderSystem/GraphicsCapabilities.hpp
  ../../src/RenderSystem/GraphicsCommandListImmediate.cpp
  ../../src/RenderSystem/GraphicsCommandListImmediate.hpp
  ../../src/RenderSystem/GraphicsCommandQueueImmediate.cpp
  ../../src/RenderSystem/GraphicsCommandQueueImmediate.hpp
  ../../src/RenderSystem/GraphicsContext.cpp
  ../../src/RenderSystem/GraphicsContext.hpp
  ../../src/RenderSystem/NativeBuffer.hpp
  ../../src/RenderSystem/NativeEffectReflection.hpp
  ../../src/RenderSystem/NativeGraphicsCommandList.hpp
  ../../src/RenderSystem/NativeGraphicsCommandQueue.hpp
  ../../src/RenderSystem/NativeGraphicsContext.hpp
  ../../src/RenderSystem/NativeGraphicsDevice.hpp
  ../../src/RenderSystem/NativePipelineState.hpp
  ../../src/RenderSystem/NativeRenderTarget2D.hpp
  ../../src/RenderSystem/NativeSamplerState.hpp
  ../../src/RenderSystem/NativeTexture2D.hpp
  ../../src/RenderSystem/ShaderBytecode.hpp
  ../../src/RenderSystem/ShaderCompileOptions.hpp
  ../../src/RenderSystem/SurfaceFormatHelper.cpp
  ../../src/RenderSystem/SurfaceFormatHelper.hpp
  ../../src/RenderSystem/TextureHelper.cpp
  ../../src/RenderSystem/TextureHelper.hpp
  ../../src/Signals/Connection.cpp
  ../../src/Signals/ConnectionList.cpp
  ../../src/Signals/EventQueue.cpp
  ../../src/Signals/ScopedConnection.cpp
  ../../src/Utility/CRC32.cpp
  ../../src/Utility/Noncopyable.hpp
  ../../src/Utility/PathHelper.cpp
  ../../src/Utility/ScopeGuard.hpp
  ../../src/Utility/StringHelper.cpp
)

set(POMDOG_SOURCES_GL4
  ../../src/RenderSystem.GL4/BlendStateGL4.cpp
  ../../src/RenderSystem.GL4/BlendStateGL4.hpp
  ../../src/RenderSystem.GL4/BufferGL4.cpp
  ../../src/RenderSystem.GL4/BufferGL4.hpp
  ../../src/RenderSystem.GL4/DepthStencilStateGL4.cpp
  ../../src/RenderSystem.GL4/DepthStencilStateGL4.hpp
  ../../src/RenderSystem.GL4/EffectReflectionGL4.cpp
  ../../src/RenderSystem.GL4/EffectReflectionGL4.hpp
  ../../src/RenderSystem.GL4/ErrorChecker.cpp
  ../../src/RenderSystem.GL4/ErrorChecker.hpp
  ../../src/RenderSystem.GL4/GraphicsContextGL4.cpp
  ../../src/RenderSystem.GL4/GraphicsContextGL4.hpp
  ../../src/RenderSystem.GL4/GraphicsDeviceGL4.cpp
  ../../src/RenderSystem.GL4/GraphicsDeviceGL4.hpp
  ../../src/RenderSystem.GL4/InputLayoutGL4.cpp
  ../../src/RenderSystem.GL4/InputLayoutGL4.hpp
  ../../src/RenderSystem.GL4/OpenGLContext.hpp
  ../../src/RenderSystem.GL4/OpenGLPrerequisites.hpp
  ../../src/RenderSystem.GL4/PipelineStateGL4.cpp
  ../../src/RenderSystem.GL4/PipelineStateGL4.hpp
  ../../src/RenderSystem.GL4/RasterizerStateGL4.cpp
  ../../src/RenderSystem.GL4/RasterizerStateGL4.hpp
  ../../src/RenderSystem.GL4/RenderTarget2DGL4.cpp
  ../../src/RenderSystem.GL4/RenderTarget2DGL4.hpp
  ../../src/RenderSystem.GL4/SamplerStateGL4.cpp
  ../../src/RenderSystem.GL4/SamplerStateGL4.hpp
  ../../src/RenderSystem.GL4/ShaderGL4.cpp
  ../../src/RenderSystem.GL4/ShaderGL4.hpp
  ../../src/RenderSystem.GL4/Texture2DGL4.cpp
  ../../src/RenderSystem.GL4/Texture2DGL4.hpp
  ../../src/RenderSystem.GL4/TypesafeGL4.hpp
  ../../src/RenderSystem.GL4/TypesafeHelperGL4.hpp
)

set(POMDOG_SOURCES_OPENAL
  ../../src/SoundSystem.OpenAL/AudioClipAL.cpp
  ../../src/SoundSystem.OpenAL/AudioClipAL.hpp
  ../../src/SoundSystem.OpenAL/AudioEngineAL.cpp
  ../../src/SoundSystem.OpenAL/AudioEngineAL.hpp
  ../../src/SoundSystem.OpenAL/ContextOpenAL.cpp
  ../../src/SoundSystem.OpenAL/ContextOpenAL.hpp
  ../../src/SoundSystem.OpenAL/ErrorCheckerAL.cpp
  ../../src/SoundSystem.OpenAL/ErrorCheckerAL.hpp
  ../../src/SoundSystem.OpenAL/PrerequisitesOpenAL.hpp
  ../../src/SoundSystem.OpenAL/SoundEffectAL.cpp
  ../../src/SoundSystem.OpenAL/SoundEffectAL.hpp
)

set(POMDOG_SOURCES_APPLE
  ../../src/Platform.Apple/FileSystemApple.mm
  ../../src/Platform.Apple/TimeSourceApple.cpp
  ../../src/Platform.Apple/TimeSourceApple.hpp
)

set(POMDOG_SOURCES_COCOA
  ../../include/Pomdog/Platform/Cocoa/Bootstrap.hpp
  ../../include/Pomdog/Platform/Cocoa/PomdogOpenGLView.hpp
  ../../src/Platform.Cocoa/Bootstrap.mm
  ../../src/Platform.Cocoa/CocoaWindowDelegate.hpp
  ../../src/Platform.Cocoa/CocoaWindowDelegate.mm
  ../../src/Platform.Cocoa/GameHostCocoa.hpp
  ../../src/Platform.Cocoa/GameHostCocoa.mm
  ../../src/Platform.Cocoa/GameWindowCocoa.hpp
  ../../src/Platform.Cocoa/GameWindowCocoa.mm
  ../../src/Platform.Cocoa/KeyboardCocoa.hpp
  ../../src/Platform.Cocoa/KeyboardCocoa.cpp
  ../../src/Platform.Cocoa/MouseCocoa.hpp
  ../../src/Platform.Cocoa/MouseCocoa.cpp
  ../../src/Platform.Cocoa/OpenGLContextCocoa.hpp
  ../../src/Platform.Cocoa/OpenGLContextCocoa.mm
  ../../src/Platform.Cocoa/PomdogOpenGLView.mm
)

set(POMDOG_SOURCES_DIRECT3D
  ../../src/RenderSystem.DXGI/DXGIFormatHelper.cpp
  ../../src/RenderSystem.DXGI/DXGIFormatHelper.hpp
  ../../src/RenderSystem.Direct3D/HLSLCompiling.cpp
  ../../src/RenderSystem.Direct3D/HLSLCompiling.hpp
  ../../src/RenderSystem.Direct3D/HLSLReflectionHelper.cpp
  ../../src/RenderSystem.Direct3D/HLSLReflectionHelper.hpp
  ../../src/RenderSystem.Direct3D/PrerequisitesDirect3D.hpp
)

set(POMDOG_SOURCES_DIRECT3D11
  ../../src/RenderSystem.Direct3D11/BufferDirect3D11.cpp
  ../../src/RenderSystem.Direct3D11/BufferDirect3D11.hpp
  ../../src/RenderSystem.Direct3D11/EffectReflectionDirect3D11.cpp
  ../../src/RenderSystem.Direct3D11/EffectReflectionDirect3D11.hpp
  ../../src/RenderSystem.Direct3D11/GraphicsContextDirect3D11.cpp
  ../../src/RenderSystem.Direct3D11/GraphicsContextDirect3D11.hpp
  ../../src/RenderSystem.Direct3D11/GraphicsDeviceDirect3D11.cpp
  ../../src/RenderSystem.Direct3D11/GraphicsDeviceDirect3D11.hpp
  ../../src/RenderSystem.Direct3D11/PipelineStateDirect3D11.cpp
  ../../src/RenderSystem.Direct3D11/PipelineStateDirect3D11.hpp
  ../../src/RenderSystem.Direct3D11/PrerequisitesDirect3D11.hpp
  ../../src/RenderSystem.Direct3D11/RenderTarget2DDirect3D11.cpp
  ../../src/RenderSystem.Direct3D11/RenderTarget2DDirect3D11.hpp
  ../../src/RenderSystem.Direct3D11/SamplerStateDirect3D11.cpp
  ../../src/RenderSystem.Direct3D11/SamplerStateDirect3D11.hpp
  ../../src/RenderSystem.Direct3D11/ShaderDirect3D11.cpp
  ../../src/RenderSystem.Direct3D11/ShaderDirect3D11.hpp
  ../../src/RenderSystem.Direct3D11/Texture2DDirect3D11.cpp
  ../../src/RenderSystem.Direct3D11/Texture2DDirect3D11.hpp
)

set(POMDOG_SOURCES_METAL
  ../../src/RenderSystem.Metal/BufferMetal.hpp
  ../../src/RenderSystem.Metal/BufferMetal.mm
  ../../src/RenderSystem.Metal/EffectReflectionMetal.hpp
  ../../src/RenderSystem.Metal/EffectReflectionMetal.mm
  ../../src/RenderSystem.Metal/GraphicsContextMetal.hpp
  ../../src/RenderSystem.Metal/GraphicsContextMetal.mm
  ../../src/RenderSystem.Metal/GraphicsDeviceMetal.hpp
  ../../src/RenderSystem.Metal/GraphicsDeviceMetal.mm
  ../../src/RenderSystem.Metal/MetalFormatHelper.hpp
  ../../src/RenderSystem.Metal/MetalFormatHelper.mm
  ../../src/RenderSystem.Metal/PipelineStateMetal.hpp
  ../../src/RenderSystem.Metal/PipelineStateMetal.mm
  ../../src/RenderSystem.Metal/RenderTarget2DMetal.hpp
  ../../src/RenderSystem.Metal/RenderTarget2DMetal.mm
  ../../src/RenderSystem.Metal/SamplerStateMetal.hpp
  ../../src/RenderSystem.Metal/SamplerStateMetal.mm
  ../../src/RenderSystem.Metal/ShaderMetal.hpp
  ../../src/RenderSystem.Metal/ShaderMetal.mm
  ../../src/RenderSystem.Metal/Texture2DMetal.hpp
  ../../src/RenderSystem.Metal/Texture2DMetal.mm
)

set(POMDOG_SOURCES_VULKAN
  ../../src/RenderSystem.Vulkan/BufferVulkan.cpp
  ../../src/RenderSystem.Vulkan/BufferVulkan.hpp
  ../../src/RenderSystem.Vulkan/EffectReflectionVulkan.cpp
  ../../src/RenderSystem.Vulkan/EffectReflectionVulkan.hpp
  ../../src/RenderSystem.Vulkan/GraphicsCommandListVulkan.cpp
  ../../src/RenderSystem.Vulkan/GraphicsCommandListVulkan.hpp
  ../../src/RenderSystem.Vulkan/GraphicsCommandQueueVulkan.cpp
  ../../src/RenderSystem.Vulkan/GraphicsCommandQueueVulkan.hpp
  ../../src/RenderSystem.Vulkan/GraphicsDeviceVulkan.cpp
  ../../src/RenderSystem.Vulkan/GraphicsDeviceVulkan.hpp
  ../../src/RenderSystem.Vulkan/PipelineStateVulkan.cpp
  ../../src/RenderSystem.Vulkan/PipelineStateVulkan.hpp
  ../../src/RenderSystem.Vulkan/RenderTexture2DVulkan.cpp
  ../../src/RenderSystem.Vulkan/RenderTexture2DVulkan.hpp
  ../../src/RenderSystem.Vulkan/SamplerStateVulkan.cpp
  ../../src/RenderSystem.Vulkan/SamplerStateVulkan.hpp
  ../../src/RenderSystem.Vulkan/ShaderVulkan.cpp
  ../../src/RenderSystem.Vulkan/ShaderVulkan.hpp
  ../../src/RenderSystem.Vulkan/Texture2DVulkan.cpp
  ../../src/RenderSystem.Vulkan/Texture2DVulkan.hpp
  ../../src/RenderSystem.Vulkan/VulkanFormatHelper.cpp
  ../../src/RenderSystem.Vulkan/VulkanFormatHelper.hpp
)

set(POMDOG_SOURCES_XAUDIO2
  ../../src/SoundSystem.XAudio2/AudioClipXAudio2.cpp
  ../../src/SoundSystem.XAudio2/AudioClipXAudio2.hpp
  ../../src/SoundSystem.XAudio2/AudioEngineXAudio2.cpp
  ../../src/SoundSystem.XAudio2/AudioEngineXAudio2.hpp
  ../../src/SoundSystem.XAudio2/PrerequisitesXAudio2.hpp
  ../../src/SoundSystem.XAudio2/SoundEffectXAudio2.cpp
  ../../src/SoundSystem.XAudio2/SoundEffectXAudio2.hpp
)

set(POMDOG_SOURCES_DIRECTINPUT
  ../../src/InputSystem.DirectInput/DeviceContextDirectInput.cpp
  ../../src/InputSystem.DirectInput/DeviceContextDirectInput.hpp
  ../../src/InputSystem.DirectInput/PrerequisitesDirectInput.hpp
)

set(POMDOG_SOURCES_WIN32
  ../../include/Pomdog/Platform/Win32/Bootstrap.hpp
  ../../include/Pomdog/Platform/Win32/BootstrapSettingsWin32.hpp
  ../../include/Pomdog/Platform/Win32/PrerequisitesWin32.hpp
  ../../src/Platform.Win32/Bootstrap.cpp
  ../../src/Platform.Win32/GameHostWin32.cpp
  ../../src/Platform.Win32/GameHostWin32.hpp
  ../../src/Platform.Win32/GameWindowWin32.cpp
  ../../src/Platform.Win32/GameWindowWin32.hpp
  ../../src/Platform.Win32/FileSystemWin32.cpp
  ../../src/Platform.Win32/KeyboardWin32.cpp
  ../../src/Platform.Win32/KeyboardWin32.hpp
  ../../src/Platform.Win32/MouseWin32.cpp
  ../../src/Platform.Win32/MouseWin32.hpp
  ../../src/Platform.Win32/TimeSourceWin32.cpp
  ../../src/Platform.Win32/TimeSourceWin32.hpp
)

set(POMDOG_SOURCES_WIN32_OPENGL
  ../../src/Platform.Win32/OpenGLContextWin32.cpp
  ../../src/Platform.Win32/OpenGLContextWin32.hpp
)

set(POMDOG_SOURCES_X11
  ../../include/Pomdog/Platform/X11/Bootstrap.hpp
  ../../src/Platform.X11/Bootstrap.cpp
  ../../src/Platform.X11/GameHostX11.cpp
  ../../src/Platform.X11/GameHostX11.hpp
  ../../src/Platform.X11/GameWindowX11.cpp
  ../../src/Platform.X11/GameWindowX11.hpp
  ../../src/Platform.X11/KeyboardX11.cpp
  ../../src/Platform.X11/KeyboardX11.hpp
  ../../src/Platform.X11/MouseX11.cpp
  ../../src/Platform.X11/MouseX11.hpp
  ../../src/Platform.X11/OpenGLContextX11.cpp
  ../../src/Platform.X11/OpenGLContextX11.hpp
  ../../src/Platform.X11/X11AtomCache.hpp
  ../../src/Platform.X11/X11Context.cpp
  ../../src/Platform.X11/X11Context.hpp
)

set(POMDOG_SOURCES_LINUX
  ../../src/Platform.Linux/FileSystemLinux.cpp
  ../../src/Platform.Linux/TimeSourceLinux.cpp
  ../../src/Platform.Linux/TimeSourceLinux.hpp
)

include_directories(
  ../../include
  ../../dependencies/libpng
  ../../dependencies/vendor/libpng
)

set(SOURCE_FILES ${POMDOG_SOURCES_CORE})

if(APPLE)
  set(POMDOG_TARGET_PLATFORM "Mac" CACHE STRING "Choose platform")
  set(POMDOG_USE_DIRECT3D11   false CACHE BOOL "Use Direct3D11")
  set(POMDOG_USE_GL4          true  CACHE BOOL "Use OpenGL4")
  set(POMDOG_USE_METAL        false CACHE BOOL "Use Metal")
  set(POMDOG_USE_VULKAN       false CACHE BOOL "Use Vulkan")
  set(POMDOG_USE_OPENAL       true  CACHE BOOL "Use OpenAL")
  set(POMDOG_USE_XAUDIO2      false CACHE BOOL "Use XAudio2")
  set(POMDOG_USE_DIRECTINPUT  false CACHE BOOL "Use DirectInput")
  set(POMDOG_USE_X11          false CACHE BOOL "Use X11")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
  set(POMDOG_TARGET_PLATFORM "Linux" CACHE STRING "Choose platform")
  set(POMDOG_USE_DIRECT3D11   false CACHE BOOL "Use Direct3D11")
  set(POMDOG_USE_GL4          true  CACHE BOOL "Use OpenGL4")
  set(POMDOG_USE_METAL        false CACHE BOOL "Use Metal")
  set(POMDOG_USE_VULKAN       false CACHE BOOL "Use Vulkan")
  set(POMDOG_USE_OPENAL       true  CACHE BOOL "Use OpenAL")
  set(POMDOG_USE_XAUDIO2      false CACHE BOOL "Use XAudio2")
  set(POMDOG_USE_DIRECTINPUT  false CACHE BOOL "Use DirectInput")
  set(POMDOG_USE_X11          true  CACHE BOOL "Use X11")
elseif(WIN32)
  set(POMDOG_TARGET_PLATFORM "Win32" CACHE STRING "Choose platform")
  set(POMDOG_USE_DIRECT3D11   true  CACHE BOOL "Use Direct3D11")
  set(POMDOG_USE_GL4          true  CACHE BOOL "Use OpenGL4")
  set(POMDOG_USE_METAL        false CACHE BOOL "Use Metal")
  set(POMDOG_USE_VULKAN       false CACHE BOOL "Use Vulkan")
  set(POMDOG_USE_OPENAL       false CACHE BOOL "Use OpenAL")
  set(POMDOG_USE_XAUDIO2      true  CACHE BOOL "Use XAudio2")
  set(POMDOG_USE_DIRECTINPUT  true  CACHE BOOL "Use DirectInput")
  set(POMDOG_USE_X11          false CACHE BOOL "Use X11")
endif()

if (POMDOG_TARGET_PLATFORM MATCHES "Linux")
  list(APPEND SOURCE_FILES ${POMDOG_SOURCES_LINUX})
elseif (POMDOG_TARGET_PLATFORM MATCHES "Mac")
  list(APPEND SOURCE_FILES ${POMDOG_SOURCES_APPLE})
  list(APPEND SOURCE_FILES ${POMDOG_SOURCES_COCOA})
elseif (POMDOG_TARGET_PLATFORM MATCHES "Win32")
  list(APPEND SOURCE_FILES ${POMDOG_SOURCES_WIN32})
  list(APPEND SOURCE_FILES ${POMDOG_SOURCES_DIRECTINPUT})
  add_definitions(-D_WIN32_WINNT=0x0602) # Windows 8 or later
  add_definitions(-DWIN32_LEAN_AND_MEAN)
  add_definitions(-DNOMINMAX)
endif()

if(POMDOG_USE_DIRECT3D11)
  list(APPEND SOURCE_FILES ${POMDOG_SOURCES_DIRECT3D})
  list(APPEND SOURCE_FILES ${POMDOG_SOURCES_DIRECT3D11})
endif()

if(POMDOG_USE_GL4)
  list(APPEND SOURCE_FILES ${POMDOG_SOURCES_GL4})
endif()

if(POMDOG_USE_GL4 AND WIN32)
  list(APPEND SOURCE_FILES ${POMDOG_SOURCES_WIN32_OPENGL})
endif()

if(POMDOG_USE_METAL)
  list(APPEND SOURCE_FILES ${POMDOG_SOURCES_METAL})
endif()

if(POMDOG_USE_VULKAN)
  list(APPEND SOURCE_FILES ${POMDOG_SOURCES_VULKAN})
endif()

if(POMDOG_USE_XAUDIO2)
  list(APPEND SOURCE_FILES ${POMDOG_SOURCES_XAUDIO2})
endif()

if(POMDOG_USE_OPENAL)
  list(APPEND SOURCE_FILES ${POMDOG_SOURCES_OPENAL})
  if(POMDOG_TARGET_PLATFORM MATCHES "Linux")
    list(APPEND LINK_LIBRARIES openal)
  endif()
endif()

if(POMDOG_USE_X11)
  list(APPEND SOURCE_FILES ${POMDOG_SOURCES_X11})
  if(POMDOG_TARGET_PLATFORM MATCHES "Linux")
    include_directories(
      /usr/X11R6/include
      ../../dependencies/vendor/glew/include
    )
    link_directories(
      /usr/X11R6/lib
    )
    add_definitions(-DGLEW_STATIC)
    list(APPEND LINK_LIBRARIES X11)
    list(APPEND LINK_LIBRARIES GL)

    # TODO: The following code causes a compiler bug when using GLEW + CMake + Clang
    # list(APPEND LINK_LIBRARIES glew_static)
    # add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/glew)
  endif()
endif()

list(APPEND LINK_LIBRARIES png)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/libpng)

add_library(${PRODUCT_NAME} STATIC ${SOURCE_FILES})
target_link_libraries(${PRODUCT_NAME} ${LINK_LIBRARIES})
