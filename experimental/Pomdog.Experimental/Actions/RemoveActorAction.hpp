﻿//
//  Copyright (C) 2013-2014 mogemimi.
//
//  Distributed under the MIT License.
//  See accompanying file LICENSE.md or copy at
//  http://enginetrouble.net/pomdog/LICENSE.md for details.
//

#ifndef POMDOG_REMOVEACTORACTION_4E4B9484_EB63_42E0_BA11_5559A4810AF7_HPP
#define POMDOG_REMOVEACTORACTION_4E4B9484_EB63_42E0_BA11_5559A4810AF7_HPP

#if (_MSC_VER > 1000)
#	pragma once
#endif

#include "Pomdog.Experimental/Actions/Action.hpp"
#include <Pomdog/Pomdog.hpp>

namespace Pomdog {

class RemoveActorAction: public Action {
private:
	bool isCompleted = false;

public:
	void Act(GameObject & gameObject, AnimationTimeInterval const& frameDuration) override
	{
		if (isCompleted) {
			return;
		}
		
		POMDOG_ASSERT(gameObject);
		
		if (gameObject) {
			gameObject.Destroy();
		}
		
		isCompleted = true;
	}

	bool IsCompleted() const override
	{
		return isCompleted;
	}
};

}// namespace Pomdog

#endif // !defined(POMDOG_REMOVEACTORACTION_4E4B9484_EB63_42E0_BA11_5559A4810AF7_HPP)