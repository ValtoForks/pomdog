﻿//
//  Copyright (C) 2013 mogemimi.
//
//  Distributed under the MIT License.
//  See accompanying file LICENSE.md or copy at
//  http://enginetrouble.net/pomdog/LICENSE.md for details.
//

#ifndef POMDOG_DETAIL_EVENTSLOT_HPP
#define POMDOG_DETAIL_EVENTSLOT_HPP

#if (_MSC_VER > 1000)
#	pragma once
#endif

#include <memory>
#include <functional>

namespace Pomdog {

class Event;

namespace Details {
namespace EventInternal {

class EventSlotCollection;

class EventSlot
{
private:
	typedef Event event_type;
	typedef std::function<void(event_type const&)> function_type;

public:
	EventSlot(function_type const& invoker, std::weak_ptr<EventSlotCollection> const& slots);

	void Disconnect();

	void Invoke(event_type const& event);

private:
	function_type invoker;
	std::weak_ptr<EventSlotCollection> slots;
};

}// namespace EventInternal
}// namespace Details
}// namespace Pomdog

#endif // !defined(POMDOG_DETAIL_EVENTSLOT_HPP)