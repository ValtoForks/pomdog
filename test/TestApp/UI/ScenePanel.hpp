//
//  Copyright (C) 2013-2014 mogemimi.
//
//  Distributed under the MIT License.
//  See accompanying file LICENSE.md or copy at
//  http://enginetrouble.net/pomdog/LICENSE.md for details.
//

#ifndef POMDOG_SCENEPANEL_F59B1210_FA6C_4446_9752_7754A8017116_HPP
#define POMDOG_SCENEPANEL_F59B1210_FA6C_4446_9752_7754A8017116_HPP

#if (_MSC_VER > 1000)
#	pragma once
#endif

#include <Pomdog/Pomdog.hpp>
#include <Pomdog/Utility/Optional.hpp>
#include "Panel.hpp"

namespace Pomdog {
namespace UI {

class ScenePanel: public Panel {
public:
	std::shared_ptr<GameObject> cameraObject;

	Transform2D RenderTransform;
	Vector2 RenderTransformOrigin;

public:
	ScenePanel(double widthIn, double heightIn);
	
	void OnPointerCanceled(PointerPoint const& pointerPoint) override;
	
	void OnPointerCaptureLost(PointerPoint const& pointerPoint) override;
	
	void OnPointerWheelChanged(PointerPoint const& pointerPoint) override;
	
	void OnPointerEntered(PointerPoint const& pointerPoint) override;
	
	void OnPointerExited(PointerPoint const& pointerPoint) override;
	
	void OnPointerPressed(PointerPoint const& pointerPoint) override;
	
	void OnPointerMoved(PointerPoint const& pointerPoint) override;
	
	void OnPointerReleased(PointerPoint const& pointerPoint) override;
	
	void OnRenderSizeChanged();
	
	void Draw(DrawingContext & drawingContext) override;
	
	void UpdateAnimation(DurationSeconds const& frameDuration) override;
	
	Signal<void(Vector2 const& point)> SceneTouch;
	
private:
	void OnMouseLeftButtonPressed(PointerPoint const& pointerPoint);
	void OnMouseLeftButtonMoved(PointerPoint const& pointerPoint);
	void OnMouseMiddleButtonPressed(PointerPoint const& pointerPoint);
	void OnMouseMiddleButtonMoved(PointerPoint const& pointerPoint);
	void OnMouseRightButtonPressed(PointerPoint const& pointerPoint);
	void OnMouseRightButtonMoved(PointerPoint const& pointerPoint);

	Vector2 ConvertToPanelSpace(Point2D const& point) const;
	
private:
	//double width;
	//double height;

	Optional<Vector2> tumbleStartPosition;
	Optional<Vector2> trackStartPosition;
	
	Optional<std::int32_t> prevScrollWheel;
	float scrollWheel;

	bool isFocused;
};

}// namespace UI
}// namespace Pomdog

#endif // !defined(POMDOG_SCENEPANEL_F59B1210_FA6C_4446_9752_7754A8017116_HPP)