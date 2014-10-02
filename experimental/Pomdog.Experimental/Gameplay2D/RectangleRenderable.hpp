﻿//
//  Copyright (C) 2013-2014 mogemimi.
//
//  Distributed under the MIT License.
//  See accompanying file LICENSE.md or copy at
//  http://enginetrouble.net/pomdog/LICENSE.md for details.
//

#ifndef POMDOG_RECTANGLERENDERABLE_FFA98981_CBE5_4F24_AFDB_C7ECD07CC66E_HPP
#define POMDOG_RECTANGLERENDERABLE_FFA98981_CBE5_4F24_AFDB_C7ECD07CC66E_HPP

#if (_MSC_VER > 1000)
#	pragma once
#endif

#include "Renderable.hpp"
#include "../Rendering/PrimitiveCommand.hpp"
#include "Pomdog/Math/Rectangle.hpp"
#include "Pomdog/Math/Vector2.hpp"
#include <Pomdog/Pomdog.hpp>
#include <memory>

namespace Pomdog {

class RectangleRenderable: public Renderable {
public:
	RectangleRenderable();

	void Visit(GameObject & gameObject, Renderer & renderer, Matrix4x4 const& viewMatrix, Matrix4x4 const& projectionMatrix) override;
	
	void LeftTopColor(Pomdog::Color const& color);
	void RightTopColor(Pomdog::Color const& color);
	void LeftBottomColor(Pomdog::Color const& color);
	void RightBottomColor(Pomdog::Color const& color);
	
	void OriginPivot(Vector2 const& originPivot);
	Vector2 OriginPivot() const;
	
	void BoundingBox(Rectangle const& rectangle);
	Rectangle BoundingBox() const;


private:
	Details::Rendering::PrimitiveCommand command;
	Vector2 originPivot;
	std::uint32_t dirtyFlags;
};

}// namespace Pomdog

#endif // !defined(POMDOG_RECTANGLERENDERABLE_FFA98981_CBE5_4F24_AFDB_C7ECD07CC66E_HPP)