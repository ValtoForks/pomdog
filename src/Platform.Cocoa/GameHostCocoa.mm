﻿//
//  Copyright (C) 2013-2015 mogemimi.
//  Distributed under the MIT License. See LICENSE.md or
//  http://enginetrouble.net/pomdog/license for details.
//

#include "GameHostCocoa.hpp"
#include "GameWindowCocoa.hpp"
#include "OpenGLContextCocoa.hpp"
#include "KeyboardCocoa.hpp"
#include "MouseCocoa.hpp"
#include "../RenderSystem.GL4/GraphicsContextGL4.hpp"
#include "../RenderSystem.GL4/GraphicsDeviceGL4.hpp"
#include "Pomdog/Application/Game.hpp"
#include "Pomdog/Application/GameClock.hpp"
#include "Pomdog/Audio/AudioEngine.hpp"
#include "Pomdog/Content/AssetManager.hpp"
#include "Pomdog/Event/Event.hpp"
#include "Pomdog/Event/ScopedConnection.hpp"
#include "Pomdog/Graphics/GraphicsContext.hpp"
#include "Pomdog/Graphics/GraphicsDevice.hpp"
#include "Pomdog/Graphics/PresentationParameters.hpp"
#include "Pomdog/Graphics/Viewport.hpp"
#include "Pomdog/Input/KeyState.hpp"
#include "Pomdog/Logging/Log.hpp"
#include "Pomdog/Utility/Assert.hpp"
#include "Pomdog/Utility/StringFormat.hpp"
#include <OpenGL/OpenGL.h>
#include <utility>
#include <vector>
#include <mutex>
#include <thread>

namespace Pomdog {
namespace Details {
namespace Cocoa {
namespace {

//-----------------------------------------------------------------------
#pragma mark - OpenGL Helper Functions
//-----------------------------------------------------------------------
static NSOpenGLPixelFormat* CreatePixelFormat(PresentationParameters const& presentationParameters)
{
	std::vector<NSOpenGLPixelFormatAttribute> attributes =
	{
		NSOpenGLPFAOpenGLProfile, NSOpenGLProfileVersion3_2Core,
		NSOpenGLPFADoubleBuffer,
		NSOpenGLPFAAccelerated,
		NSOpenGLPFANoRecovery,
		NSOpenGLPFAAllowOfflineRenderers,
	};

	///@todo Not implemented
//	if (presentationParameters.MultiSampleCount > 0) {
//		attributes.push_back(NSOpenGLPFAMultisample);
//		attributes.push_back(NSOpenGLPFASampleBuffers);
//		attributes.push_back(1);
//		attributes.push_back(NSOpenGLPFASamples);
//		attributes.push_back(presentationParameters.MultiSampleCount);
//	}

	switch (presentationParameters.SurfaceFormat) {
	case SurfaceFormat::R8G8B8A8_UNorm:
		attributes.push_back(NSOpenGLPFAColorSize);
		attributes.push_back(24);
		attributes.push_back(NSOpenGLPFAAlphaSize);
		attributes.push_back(8);
		break;
	case SurfaceFormat::R16G16B16A16_Float:
		attributes.push_back(NSOpenGLPFAColorSize);
		attributes.push_back(48);
		attributes.push_back(NSOpenGLPFAAlphaSize);
		attributes.push_back(16);
		break;
	case SurfaceFormat::R32G32B32A32_Float:
		attributes.push_back(NSOpenGLPFAColorSize);
		attributes.push_back(96);
		attributes.push_back(NSOpenGLPFAAlphaSize);
		attributes.push_back(32);
		break;
	default:
		attributes.push_back(NSOpenGLPFAColorSize);
		attributes.push_back(24);
		attributes.push_back(NSOpenGLPFAAlphaSize);
		attributes.push_back(8);
		break;
	}

	switch (presentationParameters.DepthFormat) {
	case DepthFormat::Depth16:
		attributes.push_back(NSOpenGLPFADepthSize);
		attributes.push_back(16);
		break;
	case DepthFormat::Depth24Stencil8:
		attributes.push_back(NSOpenGLPFADepthSize);
		attributes.push_back(24);
		attributes.push_back(NSOpenGLPFAStencilSize);
		attributes.push_back(8);
		break;
	case DepthFormat::Depth32:
		attributes.push_back(NSOpenGLPFADepthSize);
		attributes.push_back(32);
		break;
	case DepthFormat::None:
		break;
	}

	attributes.push_back(0);
	return [[NSOpenGLPixelFormat alloc] initWithAttributes:attributes.data()];
}
//-----------------------------------------------------------------------
static std::shared_ptr<CocoaOpenGLContext> CreateOpenGLContext(
	PresentationParameters const& presentationParameters)
{
	auto pixelFormat = CreatePixelFormat(presentationParameters);
	return std::make_shared<CocoaOpenGLContext>(pixelFormat);
}
//-----------------------------------------------------------------------
static std::shared_ptr<GraphicsContext> CreateGraphicsContext(
	std::shared_ptr<CocoaOpenGLContext> const& openGLContext,
	std::weak_ptr<GameWindow> && gameWindow,
	PresentationParameters const& presentationParameters,
	std::shared_ptr<GraphicsDevice> const& graphicsDevice)
{
	POMDOG_ASSERT(openGLContext);
	POMDOG_ASSERT(!gameWindow.expired());
	using RenderSystem::GL4::GraphicsContextGL4;

	auto nativeContext = std::make_unique<GraphicsContextGL4>(openGLContext, std::move(gameWindow));
	return std::make_shared<GraphicsContext>(std::move(nativeContext), presentationParameters, graphicsDevice);
}

}// unnamed namespace
//-----------------------------------------------------------------------
#pragma mark - GameHostCocoa::Impl
//-----------------------------------------------------------------------
class GameHostCocoa::Impl final {
public:
	Impl(std::shared_ptr<GameWindowCocoa> const& window,
		std::shared_ptr<SystemEventDispatcher> const& dipatcher,
		PresentationParameters const& presentationParameters);

	~Impl() = default;

	void Run(Game & game);

	void Exit();

	std::shared_ptr<Pomdog::GameWindow> Window();

	std::shared_ptr<Pomdog::GameClock> Clock(std::shared_ptr<GameHost> && gameHost);

	std::shared_ptr<Pomdog::GraphicsContext> GraphicsContext();

	std::shared_ptr<Pomdog::GraphicsDevice> GraphicsDevice();

	std::shared_ptr<Pomdog::AssetManager> AssetManager(std::shared_ptr<GameHost> && gameHost);

	std::shared_ptr<Pomdog::AudioEngine> AudioEngine();

	std::shared_ptr<Pomdog::Keyboard> Keyboard();

	std::shared_ptr<Pomdog::Mouse> Mouse();

private:
	void RenderFrame(Game & game);

	void DoEvents();

	void ProcessSystemEvents(Event const& event);

	void ClientSizeChanged();

private:
	GameClock clock;
	std::mutex renderMutex;
	std::atomic_bool viewLiveResizing;

	//std::weak_ptr<Game> game;
	std::shared_ptr<GameWindowCocoa> gameWindow;

	std::shared_ptr<SystemEventDispatcher> systemEventDispatcher;
	ScopedConnection systemEventConnection;

	std::shared_ptr<CocoaOpenGLContext> openGLContext;
	std::shared_ptr<Pomdog::GraphicsContext> graphicsContext;
	std::shared_ptr<Pomdog::GraphicsDevice> graphicsDevice;
	std::shared_ptr<Pomdog::AudioEngine> audioEngine;
	std::unique_ptr<Pomdog::AssetManager> assetManager;

	std::shared_ptr<KeyboardCocoa> keyboard;
	std::shared_ptr<MouseCocoa> mouse;

	DurationSeconds presentationInterval;

	bool exitRequest;
};
//-----------------------------------------------------------------------
GameHostCocoa::Impl::Impl(std::shared_ptr<GameWindowCocoa> const& window,
	std::shared_ptr<SystemEventDispatcher> const& eventDispatcher,
	PresentationParameters const& presentationParameters)
	: viewLiveResizing(false)
	, gameWindow(window)
	, systemEventDispatcher(eventDispatcher)
	, presentationInterval(DurationSeconds(1) / 60)
	, exitRequest(false)
{
	openGLContext = CreateOpenGLContext(presentationParameters);

	using Details::RenderSystem::GL4::GraphicsDeviceGL4;
	graphicsDevice = std::make_shared<Pomdog::GraphicsDevice>(std::make_unique<GraphicsDeviceGL4>());

	graphicsContext = CreateGraphicsContext(openGLContext, gameWindow, presentationParameters, graphicsDevice);

	audioEngine = std::make_shared<Pomdog::AudioEngine>();

	POMDOG_ASSERT(gameWindow);
	gameWindow->ResetGLContext(openGLContext);

	POMDOG_ASSERT(systemEventDispatcher);
	systemEventConnection = systemEventDispatcher->Connect([this](Event const& event){
		ProcessSystemEvents(event);
	});

	keyboard = std::make_shared<KeyboardCocoa>();
	mouse = std::make_shared<MouseCocoa>();
	gameWindow->BindToDelegate(mouse);

	{
		NSString* path = [[NSBundle mainBundle] resourcePath];
		std::string rootDirectory = [[path stringByAppendingPathComponent: @"Content"] UTF8String];
		Details::AssetLoaderContext loaderContext{rootDirectory, graphicsDevice};

		assetManager = std::make_unique<Pomdog::AssetManager>(std::move(loaderContext));
	}

	POMDOG_ASSERT(presentationParameters.PresentationInterval > 0);
	presentationInterval = DurationSeconds(1) / presentationParameters.PresentationInterval;
}
//-----------------------------------------------------------------------
void GameHostCocoa::Impl::Run(Game & game)
{
	//openGLContext->Lock();
	openGLContext->MakeCurrent();
	game.Initialize();
	//openGLContext->Unlock();

	if (!game.CompleteInitialize()) {
		return;
	}

	gameWindow->SetRenderCallbackOnLiveResizing([&] {
		std::lock_guard<std::mutex> lock(renderMutex);
		ClientSizeChanged();
		RenderFrame(game);
	});

	while (!exitRequest)
	{
		std::lock_guard<std::mutex> lock(renderMutex);

		clock.Tick();
		DoEvents();
		game.Update();

		if (!viewLiveResizing.load()) {
			RenderFrame(game);
		}

		auto elapsedTime = clock.ElapsedTime();

		if (elapsedTime < presentationInterval) {
			lock.~lock_guard();
			auto sleepTime = (presentationInterval - elapsedTime);
			std::this_thread::sleep_for(sleepTime);
		}
	}

	gameWindow->SetRenderCallbackOnLiveResizing();

	gameWindow->Close();
	//DoEvents();
}
//-----------------------------------------------------------------------
void GameHostCocoa::Impl::Exit()
{
	exitRequest = true;
}
//-----------------------------------------------------------------------
void GameHostCocoa::Impl::RenderFrame(Game & game)
{
	POMDOG_ASSERT(gameWindow);

	bool skipRender = (!gameWindow
		|| gameWindow->IsMinimized()
		|| [NSApp isHidden] == YES);

	if (skipRender) {
		return;
	}

	openGLContext->Lock();
	openGLContext->MakeCurrent();

	game.Draw();

	openGLContext->Unlock();
}
//-----------------------------------------------------------------------
void GameHostCocoa::Impl::DoEvents()
{
	systemEventDispatcher->Tick();
}
//-----------------------------------------------------------------------
void GameHostCocoa::Impl::ProcessSystemEvents(Event const& event)
{
	if (event.Is<WindowShouldCloseEvent>())
	{
		Log::Internal("WindowShouldCloseEvent");
		this->Exit();
	}
	else if (event.Is<WindowWillCloseEvent>())
	{
		Log::Internal("WindowWillCloseEvent");
		///@todo Not implemented
	}
	else if (event.Is<ViewWillStartLiveResizeEvent>())
	{
		viewLiveResizing = true;

		auto rect = gameWindow->ClientBounds();
		Log::Internal(StringFormat("ViewWillStartLiveResizeEvent: {w: %d, h: %d}",
			rect.Width, rect.Height));
	}
	else if (event.Is<ViewDidEndLiveResizeEvent>())
	{
		viewLiveResizing = false;

		auto rect = gameWindow->ClientBounds();
		Log::Internal(StringFormat("ViewDidEndLiveResizeEvent: {w: %d, h: %d}",
			rect.Width, rect.Height));
	}
	else if (auto keyDownEvent = event.As<InputKeyDownEvent>())
	{
		//Log::Internal(StringFormat("KeyDown: %d", static_cast<int>(keyDownEvent->Key)));

		POMDOG_ASSERT(keyboard);
		keyboard->SetKey(keyDownEvent->Key, KeyState::Down);
	}
	else if (auto keyUpEvent = event.As<InputKeyUpEvent>())
	{
		//Log::Internal(StringFormat("KeyUp: %d", static_cast<int>(keyUpEvent->Key)));

		POMDOG_ASSERT(keyboard);
		keyboard->SetKey(keyUpEvent->Key, KeyState::Up);
	}
}
//-----------------------------------------------------------------------
void GameHostCocoa::Impl::ClientSizeChanged()
{
	openGLContext->Lock();
	openGLContext->MakeCurrent();
	{
		POMDOG_ASSERT(openGLContext->NativeOpenGLContext() != nil);
		[openGLContext->NativeOpenGLContext() update];

		auto bounds = gameWindow->ClientBounds();
		gameWindow->ClientSizeChanged(bounds.Width, bounds.Height);
	}
	openGLContext->Unlock();
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::GameWindow> GameHostCocoa::Impl::Window()
{
	return gameWindow;
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::GameClock> GameHostCocoa::Impl::Clock(std::shared_ptr<GameHost> && gameHost)
{
	std::shared_ptr<Pomdog::GameClock> sharedClock(gameHost, &clock);
	return std::move(sharedClock);
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::GraphicsContext> GameHostCocoa::Impl::GraphicsContext()
{
	return graphicsContext;
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::GraphicsDevice> GameHostCocoa::Impl::GraphicsDevice()
{
	return graphicsDevice;
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::AudioEngine> GameHostCocoa::Impl::AudioEngine()
{
	return audioEngine;
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::AssetManager> GameHostCocoa::Impl::AssetManager(std::shared_ptr<GameHost> && gameHost)
{
	std::shared_ptr<Pomdog::AssetManager> sharedAssetManager(gameHost, assetManager.get());
	return std::move(sharedAssetManager);
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::Keyboard> GameHostCocoa::Impl::Keyboard()
{
	return keyboard;
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::Mouse> GameHostCocoa::Impl::Mouse()
{
	return mouse;
}
//-----------------------------------------------------------------------
#pragma mark - GameHostCocoa
//-----------------------------------------------------------------------
GameHostCocoa::GameHostCocoa(std::shared_ptr<GameWindowCocoa> const& window,
	std::shared_ptr<SystemEventDispatcher> const& eventDispatcher,
	PresentationParameters const& presentationParameters)
	: impl(std::make_unique<Impl>(window, eventDispatcher, presentationParameters))
{}
//-----------------------------------------------------------------------
GameHostCocoa::~GameHostCocoa() = default;
//-----------------------------------------------------------------------
void GameHostCocoa::Run(Game & game)
{
	POMDOG_ASSERT(impl);
	impl->Run(game);
}
//-----------------------------------------------------------------------
void GameHostCocoa::Exit()
{
	POMDOG_ASSERT(impl);
	impl->Exit();
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::GameWindow> GameHostCocoa::Window()
{
	POMDOG_ASSERT(impl);
	return impl->Window();
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::GameClock> GameHostCocoa::Clock()
{
	POMDOG_ASSERT(impl);
	return impl->Clock(shared_from_this());
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::GraphicsContext> GameHostCocoa::GraphicsContext()
{
	POMDOG_ASSERT(impl);
	return impl->GraphicsContext();
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::GraphicsDevice> GameHostCocoa::GraphicsDevice()
{
	POMDOG_ASSERT(impl);
	return impl->GraphicsDevice();
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::AudioEngine> GameHostCocoa::AudioEngine()
{
	POMDOG_ASSERT(impl);
	return impl->AudioEngine();
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::AssetManager> GameHostCocoa::AssetManager()
{
	POMDOG_ASSERT(impl);
	return impl->AssetManager(shared_from_this());
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::Keyboard> GameHostCocoa::Keyboard()
{
	POMDOG_ASSERT(impl);
	return impl->Keyboard();
}
//-----------------------------------------------------------------------
std::shared_ptr<Pomdog::Mouse> GameHostCocoa::Mouse()
{
	POMDOG_ASSERT(impl);
	return impl->Mouse();
}
//-----------------------------------------------------------------------
}// namespace Cocoa
}// namespace Details
}// namespace Pomdog