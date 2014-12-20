{
  'includes': ['common.gypi'],
  'make_global_settings': [
    ['CXX','/usr/bin/clang++'],
    ['LINK','/usr/bin/clang++'],
  ],
  'conditions': [
    ['OS == "win"', {
      'variables': {
        'renderer%': 'direct3d11',
        'audio%': 'XAudio2',
        'input_devices%': ['DirectInput'],
      },
    }],
    ['OS == "mac"', {
      'variables': {
        'renderer%': 'opengl',
        'audio%': 'OpenAL',
        'input_devices%': [],
      },
    }],
    ['OS == "linux" or OS == "freebsd" or OS == "openbsd"', {
      'variables': {
        'renderer%': 'opengl',
        'audio%': 'OpenAL',
        'input_devices%': [],
      },
    }],
  ],
  'variables': {
    'pomdog_library_testable_sources': [
      '../include/Pomdog/Application/DurationSeconds.hpp',
      '../include/Pomdog/Audio/AudioChannels.hpp',
      '../include/Pomdog/Audio/AudioEmitter.hpp',
      '../include/Pomdog/Audio/AudioListener.hpp',
      '../include/Pomdog/Audio/SoundState.hpp',
      '../include/Pomdog/Basic/Export.hpp',
      '../include/Pomdog/Basic/Platform.hpp',
      '../include/Pomdog/Basic/Version.hpp',
      '../include/Pomdog/Event/Event.hpp',
      '../include/Pomdog/Event/EventConnection.hpp',
      '../include/Pomdog/Event/EventHandler.hpp',
      '../include/Pomdog/Event/EventQueue.hpp',
      '../include/Pomdog/Event/ScopedConnection.hpp',
      '../include/Pomdog/Event/Signal.hpp',
      '../include/Pomdog/Event/detail/EventArguments.hpp',
      '../include/Pomdog/Event/detail/ForwardDeclarations.hpp',
      '../include/Pomdog/Event/detail/SignalBody.hpp',
      '../include/Pomdog/Gameplay/Component.hpp',
      '../include/Pomdog/Gameplay/GameObject.hpp',
      '../include/Pomdog/Gameplay/GameObjectContext.hpp',
      '../include/Pomdog/Gameplay/GameObjectID.hpp',
      '../include/Pomdog/Gameplay/GameWorld.hpp',
      '../include/Pomdog/Gameplay/detail/ComponentTypeIndex.hpp',
      '../include/Pomdog/Gameplay/detail/GameComponent.hpp',
      '../include/Pomdog/Graphics/Blend.hpp',
      '../include/Pomdog/Graphics/BlendDescription.hpp',
      '../include/Pomdog/Graphics/BlendFunction.hpp',
      '../include/Pomdog/Graphics/BufferUsage.hpp',
      '../include/Pomdog/Graphics/ClearOptions.hpp',
      '../include/Pomdog/Graphics/ComparisonFunction.hpp',
      '../include/Pomdog/Graphics/CullMode.hpp',
      '../include/Pomdog/Graphics/CustomVertex.hpp',
      '../include/Pomdog/Graphics/DepthFormat.hpp',
      '../include/Pomdog/Graphics/DepthStencilDescription.hpp',
      '../include/Pomdog/Graphics/DepthStencilOperation.hpp',
      '../include/Pomdog/Graphics/EffectAnnotation.hpp',
      '../include/Pomdog/Graphics/EffectConstantDescription.hpp',
      '../include/Pomdog/Graphics/EffectVariableClass.hpp',
      '../include/Pomdog/Graphics/EffectVariableType.hpp',
      '../include/Pomdog/Graphics/EffectVariable.hpp',
      '../include/Pomdog/Graphics/FillMode.hpp',
      '../include/Pomdog/Graphics/IndexElementSize.hpp',
      '../include/Pomdog/Graphics/PrimitiveTopology.hpp',
      '../include/Pomdog/Graphics/RasterizerDescription.hpp',
      '../include/Pomdog/Graphics/SamplerDescription.hpp',
      '../include/Pomdog/Graphics/SurfaceFormat.hpp',
      '../include/Pomdog/Graphics/StencilOperation.hpp',
      '../include/Pomdog/Graphics/TextureAddressMode.hpp',
      '../include/Pomdog/Graphics/TextureFilter.hpp',
      '../include/Pomdog/Graphics/VertexBufferBinding.hpp',
      '../include/Pomdog/Graphics/VertexDeclaration.hpp',
      '../include/Pomdog/Graphics/VertexElement.hpp',
      '../include/Pomdog/Graphics/VertexElementFormat.hpp',
      '../include/Pomdog/Graphics/Viewport.hpp',
      '../include/Pomdog/Graphics/detail/ForwardDeclarations.hpp',
      '../include/Pomdog/Graphics/detail/VertexElementHelper.hpp',
      '../include/Pomdog/Input/ButtonState.hpp',
      '../include/Pomdog/Input/GamepadButtons.hpp',
      '../include/Pomdog/Input/GamepadCapabilities.hpp',
      '../include/Pomdog/Input/GamepadDPad.hpp',
      '../include/Pomdog/Input/GamepadState.hpp',
      '../include/Pomdog/Input/GamepadThumbSticks.hpp',
      '../include/Pomdog/Input/GamepadType.hpp',
      '../include/Pomdog/Input/KeyboardState.hpp',
      '../include/Pomdog/Input/KeyState.hpp',
      '../include/Pomdog/Input/Keys.hpp',
      '../include/Pomdog/Input/MouseState.hpp',
      '../include/Pomdog/Input/PlayerIndex.hpp',
      '../include/Pomdog/Input/TouchLocation.hpp',
      '../include/Pomdog/Input/TouchLocationState.hpp',
      '../include/Pomdog/Logging/Log.hpp',
      '../include/Pomdog/Logging/LogChannel.hpp',
      '../include/Pomdog/Logging/LogEntry.hpp',
      '../include/Pomdog/Logging/LogLevel.hpp',
      '../include/Pomdog/Logging/LogStream.hpp',
      '../include/Pomdog/Math/Color.hpp',
      '../include/Pomdog/Math/ContainmentType.hpp',
      '../include/Pomdog/Math/Degree.hpp',
      '../include/Pomdog/Math/MathHelper.hpp',
      '../include/Pomdog/Math/Matrix2x2.hpp',
      '../include/Pomdog/Math/Matrix3x2.hpp',
      '../include/Pomdog/Math/Matrix3x3.hpp',
      '../include/Pomdog/Math/Matrix4x4.hpp',
      '../include/Pomdog/Math/Point2D.hpp',
      '../include/Pomdog/Math/Point3D.hpp',
      '../include/Pomdog/Math/Quaternion.hpp',
      '../include/Pomdog/Math/Radian.hpp',
      '../include/Pomdog/Math/Rectangle.hpp',
      '../include/Pomdog/Math/Vector2.hpp',
      '../include/Pomdog/Math/Vector3.hpp',
      '../include/Pomdog/Math/Vector4.hpp',
      '../include/Pomdog/Math/detail/Coordinate2D.hpp',
      '../include/Pomdog/Math/detail/Coordinate2DImplementation.hpp',
      '../include/Pomdog/Math/detail/Coordinate3D.hpp',
      '../include/Pomdog/Math/detail/Coordinate3DImplementation.hpp',
      '../include/Pomdog/Math/detail/FloatingPointMatrix2x2.hpp',
      '../include/Pomdog/Math/detail/FloatingPointMatrix3x2.hpp',
      '../include/Pomdog/Math/detail/FloatingPointMatrix3x3.hpp',
      '../include/Pomdog/Math/detail/FloatingPointMatrix4x4.hpp',
      '../include/Pomdog/Math/detail/FloatingPointQuaternion.hpp',
      '../include/Pomdog/Math/detail/FloatingPointVector2.hpp',
      '../include/Pomdog/Math/detail/FloatingPointVector3.hpp',
      '../include/Pomdog/Math/detail/FloatingPointVector4.hpp',
      '../include/Pomdog/Math/detail/ForwardDeclarations.hpp',
      '../include/Pomdog/Math/detail/TaggedArithmetic.hpp',
      '../include/Pomdog/Utility/Assert.hpp',
      '../include/Pomdog/Utility/Exception.hpp',
      '../include/Pomdog/Utility/Optional.hpp',
      '../include/Pomdog/Utility/StringFormat.hpp',
      '../include/Pomdog/Utility/detail/Any.hpp',
      '../include/Pomdog/Utility/detail/CRC32.hpp',
      '../include/Pomdog/Utility/detail/Tagged.hpp',
      '../src/Event/EventConnection.cpp',
      '../src/Event/EventHandler.cpp',
      '../src/Event/EventQueue.cpp',
      '../src/Event/ScopedConnection.cpp',
      '../src/Gameplay/GameObject.cpp',
      '../src/Gameplay/GameWorld.cpp',
      '../src/Graphics/ClearOptions.cpp',
      '../src/Graphics/VertexBufferBinding.cpp',
      '../src/Graphics/VertexDeclaration.cpp',
      '../src/Graphics/VertexElementHelper.cpp',
      '../src/Graphics/Viewport.cpp',
      '../src/Input/KeyboardState.cpp',
      '../src/Logging/Log.cpp',
      '../src/Logging/LogChannel.cpp',
      '../src/Logging/LogStream.cpp',
      '../src/Math/Color.cpp',
      '../src/Math/MathHelper.cpp',
      '../src/Math/Rectangle.cpp',
      '../src/Math/detail/FloatingPointMatrix2x2.cpp',
      '../src/Math/detail/FloatingPointMatrix3x2.cpp',
      '../src/Math/detail/FloatingPointMatrix3x3.cpp',
      '../src/Math/detail/FloatingPointMatrix4x4.cpp',
      '../src/Math/detail/FloatingPointQuaternion.cpp',
      '../src/Math/detail/FloatingPointVector2.cpp',
      '../src/Math/detail/FloatingPointVector3.cpp',
      '../src/Math/detail/FloatingPointVector4.cpp',
      '../src/Utility/CRC32.cpp',
      '../src/Utility/Noncopyable.hpp',
      '../src/Utility/PathHelper.cpp',
      '../src/Utility/PathHelper.hpp',
      '../src/Utility/ScopeGuard.hpp',
      '../src/Utility/StringFormat.cpp',
    ],
    'pomdog_library_application_sources': [
      '../include/Pomdog/Application/Game.hpp',
      '../include/Pomdog/Application/GameClock.hpp',
      '../include/Pomdog/Application/GameHost.hpp',
      '../include/Pomdog/Application/GameWindow.hpp',
      '../include/Pomdog/Application/Timer.hpp',
      '../include/Pomdog/Audio/AudioClip.hpp',
      '../include/Pomdog/Audio/AudioEngine.hpp',
      '../include/Pomdog/Audio/SoundEffect.hpp',
      '../include/Pomdog/Audio/detail/ForwardDeclarations.hpp',
      '../include/Pomdog/Content/AssetManager.hpp',
      '../include/Pomdog/Content/detail/AssetDictionary.hpp',
      '../include/Pomdog/Content/detail/AssetLoaderContext.hpp',
      '../include/Pomdog/Graphics/BlendState.hpp',
      '../include/Pomdog/Graphics/ConstantBufferBinding.hpp',
      '../include/Pomdog/Graphics/DepthStencilState.hpp',
      '../include/Pomdog/Graphics/EffectParameter.hpp',
      '../include/Pomdog/Graphics/EffectPass.hpp',
      '../include/Pomdog/Graphics/EffectReflection.hpp',
      '../include/Pomdog/Graphics/GraphicsContext.hpp',
      '../include/Pomdog/Graphics/GraphicsDevice.hpp',
      '../include/Pomdog/Graphics/IndexBuffer.hpp',
      '../include/Pomdog/Graphics/InputLayout.hpp',
      '../include/Pomdog/Graphics/RasterizerState.hpp',
      '../include/Pomdog/Graphics/RenderTarget2D.hpp',
      '../include/Pomdog/Graphics/SamplerState.hpp',
      '../include/Pomdog/Graphics/Texture.hpp',
      '../include/Pomdog/Graphics/Texture2D.hpp',
      '../include/Pomdog/Graphics/VertexBuffer.hpp',
      '../include/Pomdog/Graphics/detail/BuiltinShaderPool.hpp',
      '../include/Pomdog/Graphics/detail/EffectBinaryParameter.hpp',
      '../include/Pomdog/Graphics/detail/ShaderBytecode.hpp',
      '../include/Pomdog/Input/Gamepad.hpp',
      '../include/Pomdog/Input/Keyboard.hpp',
      '../include/Pomdog/Input/Mouse.hpp',
      '../src/Application/GameClock.cpp',
      '../src/Application/SubsystemScheduler.hpp',
      '../src/Application/SystemEventDispatcher.hpp',
      '../src/Application/Timer.cpp',
      '../src/Application/TimeSource.hpp',
      '../src/Audio/AudioClip.cpp',
      '../src/Audio/AudioEngine.cpp',
      '../src/Audio/SoundEffect.cpp',
      '../src/Content/AssetDictionary.cpp',
      '../src/Content/AssetLoaderContext.cpp',
      '../src/Content/AssetManager.cpp',
      '../src/Content/AssetReaders/AudioClipReader.cpp',
      '../src/Content/AssetReaders/AudioClipReader.hpp',
      '../src/Content/AssetReaders/EffectPassReader.cpp',
      '../src/Content/AssetReaders/EffectPassReader.hpp',
      '../src/Content/AssetReaders/Texture2DReader.cpp',
      '../src/Content/AssetReaders/Texture2DReader.hpp',
      '../src/Content/Utility/BinaryReader.hpp',
      '../src/Content/Utility/DDSTextureReader.cpp',
      '../src/Content/Utility/DDSTextureReader.hpp',
      '../src/Content/Utility/MakeFourCC.hpp',
      '../src/Content/Utility/MSWaveAudioLoader.cpp',
      '../src/Content/Utility/MSWaveAudioLoader.hpp',
      '../src/Content/Utility/PNGTextureReader.cpp',
      '../src/Content/Utility/PNGTextureReader.hpp',
      '../src/Graphics/BlendState.cpp',
      '../src/Graphics/ConstantBufferBinding.cpp',
      '../src/Graphics/DepthStencilState.cpp',
      '../src/Graphics/EffectBinaryParameter.cpp',
      '../src/Graphics/EffectParameter.cpp',
      '../src/Graphics/EffectPass.cpp',
      '../src/Graphics/EffectReflection.cpp',
      '../src/Graphics/GraphicsContext.cpp',
      '../src/Graphics/GraphicsDevice.cpp',
      '../src/Graphics/IndexBuffer.cpp',
      '../src/Graphics/InputLayout.cpp',
      '../src/Graphics/RasterizerState.cpp',
      '../src/Graphics/RenderTarget2D.cpp',
      '../src/Graphics/SamplerState.cpp',
      '../src/Graphics/Texture2D.cpp',
      '../src/Graphics/VertexBuffer.cpp',
      '../src/InputSystem/InputDeviceCreator.hpp',
      '../src/InputSystem/InputDeviceFactory.cpp',
      '../src/InputSystem/InputDeviceFactory.hpp',
      '../src/InputSystem/KeyboardCreator.hpp',
      '../src/InputSystem/MouseCreator.hpp',
      '../src/RenderSystem/GraphicsCapabilities.hpp',
      '../src/RenderSystem/NativeBlendState.hpp',
      '../src/RenderSystem/NativeConstantBuffer.hpp',
      '../src/RenderSystem/NativeConstantLayout.hpp',
      '../src/RenderSystem/NativeDepthStencilState.hpp',
      '../src/RenderSystem/NativeEffectPass.hpp',
      '../src/RenderSystem/NativeEffectReflection.hpp',
      '../src/RenderSystem/NativeGraphicsContext.hpp',
      '../src/RenderSystem/NativeGraphicsDevice.hpp',
      '../src/RenderSystem/NativeIndexBuffer.hpp',
      '../src/RenderSystem/NativeInputLayout.hpp',
      '../src/RenderSystem/NativeRasterizerState.hpp',
      '../src/RenderSystem/NativeRenderTarget2D.hpp',
      '../src/RenderSystem/NativeSamplerState.hpp',
      '../src/RenderSystem/NativeTexture2D.hpp',
      '../src/RenderSystem/NativeVertexBuffer.hpp',
      '../src/RenderSystem/PresentationParameters.hpp',
    ],
    'pomdog_library_opengl4_sources': [
      '../src/RenderSystem.GL4/BlendStateGL4.cpp',
      '../src/RenderSystem.GL4/BlendStateGL4.hpp',
      '../src/RenderSystem.GL4/ConstantBufferGL4.cpp',
      '../src/RenderSystem.GL4/ConstantBufferGL4.hpp',
      '../src/RenderSystem.GL4/ConstantLayoutGL4.cpp',
      '../src/RenderSystem.GL4/ConstantLayoutGL4.hpp',
      '../src/RenderSystem.GL4/DepthStencilStateGL4.cpp',
      '../src/RenderSystem.GL4/DepthStencilStateGL4.hpp',
      '../src/RenderSystem.GL4/EffectPassGL4.cpp',
      '../src/RenderSystem.GL4/EffectPassGL4.hpp',
      '../src/RenderSystem.GL4/EffectReflectionGL4.cpp',
      '../src/RenderSystem.GL4/EffectReflectionGL4.hpp',
      '../src/RenderSystem.GL4/ErrorChecker.cpp',
      '../src/RenderSystem.GL4/ErrorChecker.hpp',
      '../src/RenderSystem.GL4/GraphicsContextGL4.cpp',
      '../src/RenderSystem.GL4/GraphicsContextGL4.hpp',
      '../src/RenderSystem.GL4/GraphicsDeviceGL4.cpp',
      '../src/RenderSystem.GL4/GraphicsDeviceGL4.hpp',
      '../src/RenderSystem.GL4/IndexBufferGL4.cpp',
      '../src/RenderSystem.GL4/IndexBufferGL4.hpp',
      '../src/RenderSystem.GL4/InputLayoutGL4.cpp',
      '../src/RenderSystem.GL4/InputLayoutGL4.hpp',
      '../src/RenderSystem.GL4/OpenGLContext.hpp',
      '../src/RenderSystem.GL4/OpenGLPrerequisites.hpp',
      '../src/RenderSystem.GL4/RasterizerStateGL4.cpp',
      '../src/RenderSystem.GL4/RasterizerStateGL4.hpp',
      '../src/RenderSystem.GL4/RenderTarget2DGL4.cpp',
      '../src/RenderSystem.GL4/RenderTarget2DGL4.hpp',
      '../src/RenderSystem.GL4/SamplerStateGL4.cpp',
      '../src/RenderSystem.GL4/SamplerStateGL4.hpp',
      '../src/RenderSystem.GL4/Texture2DGL4.cpp',
      '../src/RenderSystem.GL4/Texture2DGL4.hpp',
      '../src/RenderSystem.GL4/TypesafeGL4.hpp',
      '../src/RenderSystem.GL4/TypesafeHelperGL4.hpp',
      '../src/RenderSystem.GL4/VertexBufferGL4.cpp',
      '../src/RenderSystem.GL4/VertexBufferGL4.hpp',
    ],
    'pomdog_library_openal_sources': [
      '../src/SoundSystem.OpenAL/AudioClipAL.cpp',
      '../src/SoundSystem.OpenAL/AudioClipAL.hpp',
      '../src/SoundSystem.OpenAL/AudioEngineAL.cpp',
      '../src/SoundSystem.OpenAL/AudioEngineAL.hpp',
      '../src/SoundSystem.OpenAL/ContextOpenAL.cpp',
      '../src/SoundSystem.OpenAL/ContextOpenAL.hpp',
      '../src/SoundSystem.OpenAL/ErrorCheckerAL.cpp',
      '../src/SoundSystem.OpenAL/ErrorCheckerAL.hpp',
      '../src/SoundSystem.OpenAL/PrerequisitesOpenAL.hpp',
      '../src/SoundSystem.OpenAL/SoundEffectAL.cpp',
      '../src/SoundSystem.OpenAL/SoundEffectAL.hpp',
    ],
    'pomdog_library_cocoa_sources': [
      '../include/Pomdog/Platform/Cocoa/BootstrapperCocoa.hpp',
      '../src/Platform.Cocoa/BootstrapperCocoa.mm',
      '../src/Platform.Cocoa/CocoaGameHost.hpp',
      '../src/Platform.Cocoa/CocoaGameHost.mm',
      '../src/Platform.Cocoa/CocoaGameViewDelegate.hpp',
      '../src/Platform.Cocoa/CocoaGameViewDelegate.mm',
      '../src/Platform.Cocoa/CocoaGameWindow.hpp',
      '../src/Platform.Cocoa/CocoaGameWindow.mm',
      '../src/Platform.Cocoa/CocoaOpenGLContext.hpp',
      '../src/Platform.Cocoa/CocoaOpenGLContext.mm',
      '../src/Platform.Cocoa/CocoaOpenGLView.hpp',
      '../src/Platform.Cocoa/CocoaOpenGLView.mm',
      '../src/Platform.Cocoa/CocoaWindowDelegate.hpp',
      '../src/Platform.Cocoa/CocoaWindowDelegate.mm',
      '../src/Platform.Cocoa/KeyboardCocoa.hpp',
      '../src/Platform.Cocoa/KeyboardCocoa.cpp',
      '../src/Platform.Cocoa/MouseCocoa.hpp',
      '../src/Platform.Cocoa/MouseCocoa.cpp',
      '../src/Platform.Cocoa/TimeSourceCocoa.cpp',
      '../src/Platform.Cocoa/TimeSourceCocoa.hpp',
    ],
    'pomdog_library_direct3d11_sources': [
      '../src/RenderSystem.Direct3D11/BlendStateDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/BlendStateDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/ConstantBufferDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/ConstantBufferDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/ConstantLayoutDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/ConstantLayoutDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/DepthStencilStateDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/DepthStencilStateDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/DXGIFormatHelper.cpp',
      '../src/RenderSystem.Direct3D11/DXGIFormatHelper.hpp',
      '../src/RenderSystem.Direct3D11/EffectPassDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/EffectPassDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/EffectReflectionDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/EffectReflectionDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/GraphicsContextDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/GraphicsContextDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/GraphicsDeviceDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/GraphicsDeviceDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/HardwareBufferHelper.cpp',
      '../src/RenderSystem.Direct3D11/HardwareBufferHelper.hpp',
      '../src/RenderSystem.Direct3D11/IndexBufferDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/IndexBufferDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/InputLayoutDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/InputLayoutDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/PrerequisitesDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/RasterizerStateDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/RasterizerStateDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/RenderTarget2DDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/RenderTarget2DDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/SamplerStateDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/SamplerStateDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/ShaderCompiling.cpp',
      '../src/RenderSystem.Direct3D11/ShaderCompiling.hpp',
      '../src/RenderSystem.Direct3D11/Texture2DDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/Texture2DDirect3D11.hpp',
      '../src/RenderSystem.Direct3D11/VertexBufferDirect3D11.cpp',
      '../src/RenderSystem.Direct3D11/VertexBufferDirect3D11.hpp',
    ],
    'pomdog_library_xaudio2_sources': [
      '../src/SoundSystem.XAudio2/AudioClipXAudio2.cpp',
      '../src/SoundSystem.XAudio2/AudioClipXAudio2.hpp',
      '../src/SoundSystem.XAudio2/AudioEngineXAudio2.cpp',
      '../src/SoundSystem.XAudio2/AudioEngineXAudio2.hpp',
      '../src/SoundSystem.XAudio2/PrerequisitesXAudio2.hpp',
      '../src/SoundSystem.XAudio2/SoundEffectXAudio2.cpp',
      '../src/SoundSystem.XAudio2/SoundEffectXAudio2.hpp',
    ],
    'pomdog_library_directinput_sources': [
      '../src/InputSystem.DirectInput/DeviceContextDirectInput.cpp',
      '../src/InputSystem.DirectInput/DeviceContextDirectInput.hpp',
      '../src/InputSystem.DirectInput/KeyboardCreatorDirectInput.cpp',
      '../src/InputSystem.DirectInput/KeyboardCreatorDirectInput.hpp',
      '../src/InputSystem.DirectInput/KeyboardDirectInput.cpp',
      '../src/InputSystem.DirectInput/KeyboardDirectInput.hpp',
      '../src/InputSystem.DirectInput/MouseCreatorDirectInput.cpp',
      '../src/InputSystem.DirectInput/MouseCreatorDirectInput.hpp',
      '../src/InputSystem.DirectInput/MouseDirectInput.cpp',
      '../src/InputSystem.DirectInput/MouseDirectInput.hpp',
      '../src/InputSystem.DirectInput/PrerequisitesDirectInput.hpp',
    ],
    'pomdog_library_win32_sources': [
      '../include/Pomdog/Platform/Win32/BootstrapperWin32.hpp',
      '../include/Pomdog/Platform/Win32/BootstrapSettingsWin32.hpp',
      '../include/Pomdog/Platform/Win32/PrerequisitesWin32.hpp',
      '../src/Platform.Win32/BootstrapperWin32.cpp',
      '../src/Platform.Win32/GameHostWin32.cpp',
      '../src/Platform.Win32/GameHostWin32.hpp',
      '../src/Platform.Win32/GameWindowWin32.cpp',
      '../src/Platform.Win32/GameWindowWin32.hpp',
      '../src/Platform.Win32/TimeSourceWin32.cpp',
      '../src/Platform.Win32/TimeSourceWin32.hpp',
    ],
  },
  'target_defaults': {
    'dependencies': [
      '../third-party/libpng/libpng.gyp:libpng_static',
    ],
    'include_dirs': [
      '../include',
      '../third-party/libpng',
    ],
    'sources': [
      '<@(pomdog_library_testable_sources)',
      '<@(pomdog_library_application_sources)',
      '../include/Pomdog/Pomdog.hpp',
    ],
    'msbuild_settings': {
      'ClCompile': {
        'WarningLevel': 'Level4', # /W4
        'TreatWarningAsError': 'true', # /WX
      },
    },
    'xcode_settings': {
      'GCC_VERSION': 'com.apple.compilers.llvm.clang.1_0',
      'CLANG_CXX_LANGUAGE_STANDARD': 'c++14',
      'MACOSX_DEPLOYMENT_TARGET': '10.9', # OS X Deployment Target: 10.9
      'CLANG_CXX_LIBRARY': 'libc++', # libc++ requires OS X 10.7 or later
      # Warnings:
      'CLANG_WARN_EMPTY_BODY': 'YES',
      'GCC_WARN_64_TO_32_BIT_CONVERSION': 'YES',
      'GCC_WARN_ABOUT_DEPRECATED_FUNCTIONS': 'YES',
      'GCC_WARN_ABOUT_MISSING_FIELD_INITIALIZERS': 'YES',
      'GCC_WARN_ABOUT_MISSING_NEWLINE': 'YES',
      'GCC_WARN_ABOUT_RETURN_TYPE': 'YES',
      'GCC_WARN_CHECK_SWITCH_STATEMENTS': 'YES',
      'GCC_WARN_HIDDEN_VIRTUAL_FUNCTIONS': 'YES',
      #'GCC_WARN_INITIALIZER_NOT_FULLY_BRACKETED': 'YES',
      'GCC_WARN_MISSING_PARENTHESES': 'YES',
      'GCC_WARN_NON_VIRTUAL_DESTRUCTOR': 'YES',
      'GCC_WARN_SHADOW': 'YES',
      'GCC_WARN_SIGN_COMPARE': 'YES',
      'GCC_WARN_TYPECHECK_CALLS_TO_PRINTF': 'YES',
      'GCC_WARN_UNINITIALIZED_AUTOS': 'YES',
      'GCC_WARN_UNKNOWN_PRAGMAS': 'YES',
      'GCC_WARN_UNUSED_FUNCTION': 'YES',
      'GCC_WARN_UNUSED_LABEL': 'YES',
      'GCC_WARN_UNUSED_VALUE': 'YES',
      'GCC_WARN_UNUSED_VARIABLE': 'YES',
      'GCC_TREAT_WARNINGS_AS_ERRORS': 'YES',
      'WARNING_CFLAGS': [
        '-Wall',
      ],
      # Symbols:
      'CLANG_ENABLE_OBJC_ARC': 'YES',
      'GCC_INLINES_ARE_PRIVATE_EXTERN': 'YES', # '-fvisibility-inlines-hidden'
      'GCC_SYMBOLS_PRIVATE_EXTERN': 'YES', # '-fvisibility=hidden'
    },
    'conditions': [
      ['renderer == "direct3d11"', {
        'sources': [
          '<@(pomdog_library_direct3d11_sources)',
        ],
        'link_settings': {
          'libraries': [
            '-ldxgi.lib',
            '-ld3d11.lib',
            '-ld3dcompiler.lib',
            '-ldxguid.lib', # using _IID_ID3D11ShaderReflection
          ],
        },
      }], # OS == "direct3d11"
      ['renderer == "opengl"', {
        'sources': [
          '<@(pomdog_library_opengl4_sources)',
        ],
      }], # renderer == "opengl"
      ['audio == "OpenAL"', {
        'sources': [
          '<@(pomdog_library_openal_sources)',
        ],
      }], # audio == "OpenAL"
      ['audio == "XAudio2"', {
        'sources': [
          '<@(pomdog_library_xaudio2_sources)',
        ],
        'link_settings': {
          'libraries': [
            '-lxaudio2.lib',
          ],
        },
      }], # audio == "XAudio2"
      ['"DirectInput" in input_devices', {
        'sources': [
          '<@(pomdog_library_directinput_sources)',
        ],
        'link_settings': {
          'libraries': [
            '-ldinput8.lib',
            '-ldxguid.lib',
          ],
        },
      }],
      ['OS == "mac"', {
        'sources': [
          '<@(pomdog_library_cocoa_sources)',
        ],
        'link_settings': {
          'libraries': [
            '$(SDKROOT)/System/Library/Frameworks/Cocoa.framework',
            '$(SDKROOT)/System/Library/Frameworks/OpenGL.framework',
            '$(SDKROOT)/System/Library/Frameworks/AudioToolBox.framework',
            '$(SDKROOT)/System/Library/Frameworks/OpenAL.framework',
          ],
        },
      }], # OS == "mac"
      ['OS == "win"', {
        'sources': [
          '<@(pomdog_library_win32_sources)',
        ],
        'link_settings': {
          'libraries': [
            '-lkernel32.lib',
            '-luser32.lib',
            '-lgdi32.lib',
            '-lole32.lib',
            '-lwinmm.lib',
            #'-lws2_32.lib',
            #'-lwinspool.lib',
            #'-lcomdlg32.lib',
            #'-ladvapi32.lib',
            #'-lshell32.lib',
            #'-loleaut32.lib',
            #'-luuid.lib',
            #'-lodbc32.lib',
            #'-lodbccp32.lib',
          ],
        },
      }], # OS == "win"
    ],
  },
  'targets': [
    {
      'target_name': 'pomdog-testable',
      'product_name': 'pomdog-testable',
      'type': 'static_library',
      'dependencies': [
      ],
      'include_dirs': [
        '../include',
      ],
      'sources': [
        '<@(pomdog_library_testable_sources)',
      ],
    },
    {
      'target_name': 'pomdog-static',
      'product_name': 'pomdog',
      'type': 'static_library',
      'xcode_settings': {
        'SKIP_INSTALL': 'YES',
      },
    },
    {
      'target_name': 'pomdog-shared',
      'product_name': 'Pomdog',
      'type': 'shared_library',
      'msvs_guid': 'A8F27BAE-660F-42B4-BC27-D5A435EF94BF',
      'mac_bundle': 1,
      'defines': ['POMDOG_BUILDING_LIBRARY_EXPORTS=1'],
      'xcode_settings': {
        'INFOPLIST_FILE': '../src/Platform.Cocoa/Xcode/Pomdog-Info.plist',
        'DYLIB_INSTALL_NAME_BASE': '@executable_path/../../..',
      },
    },
  ],# "targets"
}
