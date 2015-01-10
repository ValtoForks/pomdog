﻿//
//  Copyright (C) 2013-2015 mogemimi.
//  Distributed under the MIT License. See LICENSE.md or
//  http://enginetrouble.net/pomdog/license for details.
//

#ifndef POMDOG_SRC_GAMEWINDOWCOCOA_BA8D88CA_87F8_46A5_8F32_7FA2C73F58B1_HPP
#define POMDOG_SRC_GAMEWINDOWCOCOA_BA8D88CA_87F8_46A5_8F32_7FA2C73F58B1_HPP

#if (_MSC_VER > 1000)
#pragma once
#endif

#include "../Application/SystemEventDispatcher.hpp"
#include "Pomdog/Application/GameWindow.hpp"
#include "Pomdog/Math/Rectangle.hpp"
#import <Cocoa/Cocoa.h>

@class NSWindow;
@class CocoaOpenGLView;
@class CocoaWindowDelegate;
@class CocoaGameViewDelegate;

namespace Pomdog {
namespace Details {
namespace Cocoa {

class CocoaOpenGLContext;
class MouseCocoa;

class GameWindowCocoa final: public GameWindow {
public:
	GameWindowCocoa(NSWindow* window, std::shared_ptr<SystemEventDispatcher> const& eventDispatcher);
	~GameWindowCocoa();

	///@copydoc GameWindow
	bool AllowPlayerResizing() const override;

	///@copydoc GameWindow
	void AllowPlayerResizing(bool allowResizing) override;

	///@copydoc GameWindow
	std::string Title() const override;

	///@copydoc GameWindow
	void Title(std::string const& title) override;

	///@copydoc GameWindow
	Rectangle ClientBounds() const override;

	///@copydoc GameWindow
	void ClientBounds(Rectangle const& clientBounds) override;
	
	///@copydoc GameWindow
	bool IsMouseCursorVisible() const override;

	///@copydoc GameWindow
	void IsMouseCursorVisible(bool visible) override;

	///@copydoc GameWindow
	void SetMouseCursor(MouseCursor cursor) override;

	///@~English
	/// @return true if the window is minimized, false otherwise.
	///@~Japanese
	/// @brief ウィンドウが最小化状態かどうかを取得します。
	/// @return ウィンドウが最小化のときは true を、それ以外は false を返します。
	bool IsMinimized() const;
	
	///@~Japanese
	/// @brief ウィンドウを閉じます。
	void Close();

	void ResetGLContext(std::shared_ptr<CocoaOpenGLContext> const& context);

	void ResetGLContext();
	
	void SetRenderCallbackOnLiveResizing(std::function<void()> const& callback);
	
	void SetRenderCallbackOnLiveResizing();
	
	void BindToDelegate(std::shared_ptr<MouseCocoa> mouse);

private:
	std::shared_ptr<CocoaOpenGLContext> openGLContext;
	NSWindow* nativeWindow;
	CocoaOpenGLView* openGLView;
	CocoaWindowDelegate* windowDelegate;
	CocoaGameViewDelegate* viewDelegate;
	bool isMouseCursorVisible;
};

}// namespace Cocoa
}// namespace Details
}// namespace Pomdog

#endif // !defined(POMDOG_SRC_GAMEWINDOWCOCOA_BA8D88CA_87F8_46A5_8F32_7FA2C73F58B1_HPP)