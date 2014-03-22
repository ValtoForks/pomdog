//
//  Copyright (C) 2013-2014 mogemimi.
//
//  Distributed under the MIT License.
//  See accompanying file LICENSE.md or copy at
//  http://enginetrouble.net/pomdog/LICENSE.md for details.
//

#include <Pomdog/Event/EventHandler.hpp>
#include <Pomdog/Utility/Assert.hpp>
#include <Pomdog/Event/EventConnection.hpp>

namespace Pomdog {
//-----------------------------------------------------------------------
EventHandler::EventHandler()
	: signalBody(std::make_shared<Details::SignalsAndSlots::SignalBody<void(Event const&)>>())
{}
//-----------------------------------------------------------------------
EventConnection EventHandler::Connect(std::function<void(Event const&)> const& slot)
{
	POMDOG_ASSERT(slot);
	POMDOG_ASSERT(signal);
	return EventConnection{signalBody->Connect(slot)};
}
//-----------------------------------------------------------------------
EventConnection EventHandler::Connect(std::function<void(Event const&)> && slot)
{
	POMDOG_ASSERT(slot);
	POMDOG_ASSERT(signal);
	return EventConnection{signalBody->Connect(slot)};
}
//-----------------------------------------------------------------------
void EventHandler::Invoke(Event && event)
{
	POMDOG_ASSERT(signal);
	signalBody->operator()(std::move(event));
}
//-----------------------------------------------------------------------
}// namespace Pomdog
