//
//  Copyright (C) 2013 mogemimi.
//
//  Distributed under the MIT License.
//  See accompanying file LICENSE.md or copy at
//  http://enginetrouble.net/pomdog/LICENSE.md for details.
//

#include "CocoaGameWindow.hpp"
#include <Pomdog/Utility/Exception.hpp>
#include <Pomdog/Utility/Assert.hpp>
#include <utility>

#include "CocoaOpenGLContext.hpp"
#import "CocoaOpenGLView.hpp"

namespace Pomdog {
namespace Details {
namespace Cocoa {

//-----------------------------------------------------------------------
void CocoaGameWindow::ResetGLContext(std::shared_ptr<CocoaOpenGLContext> context)
{
	POMDOG_ASSERT(context);
	
	openGLContext = std::move(context);
	
	POMDOG_ASSERT(openGLContext);
	[openGLView setOpenGLContext:openGLContext->GetNSOpenGLContext()];
}
//-----------------------------------------------------------------------
void CocoaGameWindow::ResetGLContext()
{
	openGLContext.reset();
	[openGLView clearGLContext];
}
//-----------------------------------------------------------------------
CocoaGameWindow::CocoaGameWindow(NSWindow* nativeWindow)
	: nativeWindow(nativeWindow)
	, openGLView(nil)
{
#if !__has_feature(objc_arc)
	[this->nativeWindow retain];
#endif

	NSRect frameRect = [this->nativeWindow frame];
	openGLView = [[CocoaOpenGLView alloc] initWithFrame:frameRect];
	[openGLView setHidden:NO];
	[openGLView setNeedsDisplay:YES];
	[this->nativeWindow setContentView:openGLView];
}
//-----------------------------------------------------------------------
CocoaGameWindow::~CocoaGameWindow()
{
#if !__has_feature(objc_arc)
	[this->nativeWindow release];
#endif
}
//-----------------------------------------------------------------------
bool CocoaGameWindow::GetAllowPlayerResizing() const
{
	///@todo Not implemented
	POMDOG_THROW_EXCEPTION(std::runtime_error,
		"Not implemented", "CocoaGameWindow::GetAllowPlayerResizing");
}
//-----------------------------------------------------------------------
void CocoaGameWindow::SetAllowPlayerResizing(bool allowResizing)
{
	///@todo Not implemented
	POMDOG_THROW_EXCEPTION(std::runtime_error,
		"Not implemented", "CocoaGameWindow::SetAllowPlayerResizing");
}
//-----------------------------------------------------------------------
std::string CocoaGameWindow::GetCaption() const
{
	std::string caption = [[nativeWindow title] UTF8String];
	return std::move(caption);
}
//-----------------------------------------------------------------------
void CocoaGameWindow::SetCaption(std::string const& caption)
{
	[nativeWindow setTitle:[NSString stringWithUTF8String:caption.c_str()]];
}
//-----------------------------------------------------------------------
Rectangle CocoaGameWindow::GetClientBounds() const
{
	NSRect bounds = [nativeWindow frame];
	Rectangle rect {
		bounds.origin.x,
		bounds.origin.y,
		bounds.size.width,
		bounds.size.height
	};
	return std::move(rect);
}
//-----------------------------------------------------------------------
void CocoaGameWindow::SetClientBounds(Rectangle const& clientBounds)
{
	NSRect bounds;
	bounds.origin.x = clientBounds.x;
	bounds.origin.y = clientBounds.y;
	bounds.size.width = clientBounds.width;
	bounds.size.height = clientBounds.height;

	[nativeWindow setFrame:bounds display:YES animate:YES];
}
//-----------------------------------------------------------------------
bool CocoaGameWindow::IsMinimized() const
{
	return [nativeWindow isMiniaturized] == TRUE;
}

}// namespace Cocoa
}// namespace Details
}// namespace Pomdog
