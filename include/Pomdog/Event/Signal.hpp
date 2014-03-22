//
//  Copyright (C) 2013-2014 mogemimi.
//
//  Distributed under the MIT License.
//  See accompanying file LICENSE.md or copy at
//  http://enginetrouble.net/pomdog/LICENSE.md for details.
//

#ifndef POMDOG_SIGNAL_51888AFF_8963_45DD_8BFC_FE29E829BBFD_HPP
#define POMDOG_SIGNAL_51888AFF_8963_45DD_8BFC_FE29E829BBFD_HPP

#if (_MSC_VER > 1000)
#	pragma once
#endif

#include <memory>
#include <functional>
#include <utility>
#include "../Config/Export.hpp"
#include "detail/SignalBody.hpp"
#include "EventConnection.hpp"

namespace Pomdog {

template <typename...Arguments>
class POMDOG_EXPORT Signal<void(Arguments...)> {
public:
	Signal();
	Signal(Signal const&) = delete;
	Signal(Signal &&) = default;
	Signal & operator=(Signal const&) = delete;
	Signal & operator=(Signal &&) = default;
	
	~Signal() = default;
	
	EventConnection Connect(std::function<void(Arguments...)> const& slot);

	EventConnection Connect(std::function<void(Arguments...)> && slot);

	void operator()(Arguments &&... arguments);
	
	std::size_t InvocationCount() const;

private:
	std::shared_ptr<Details::SignalsAndSlots::SignalBody<void(Arguments...)>> signalBody;
};

//-----------------------------------------------------------------------
template <typename...Arguments>
Signal<void(Arguments...)>::Signal()
	: signalBody(std::make_shared<Details::SignalsAndSlots::SignalBody<void(Arguments...)>>())
{}
//-----------------------------------------------------------------------
template <typename...Arguments>
EventConnection Signal<void(Arguments...)>::Connect(std::function<void(Arguments...)> const& slot)
{
	POMDOG_ASSERT(slot);
	POMDOG_ASSERT(signalBody);
	return EventConnection{signalBody->Connect(slot)};
}
//-----------------------------------------------------------------------
template <typename...Arguments>
EventConnection Signal<void(Arguments...)>::Connect(std::function<void(Arguments...)> && slot)
{
	POMDOG_ASSERT(slot);
	POMDOG_ASSERT(signalBody);
	return EventConnection{signalBody->Connect(std::move(slot))};
}
//-----------------------------------------------------------------------
template <typename...Arguments>
void Signal<void(Arguments...)>::operator()(Arguments &&... arguments)
{
	POMDOG_ASSERT(signalBody);
	signalBody->operator()(std::forward<Arguments>(arguments)...);
}
//-----------------------------------------------------------------------
template <typename...Arguments>
std::size_t Signal<void(Arguments...)>::InvocationCount() const
{
	return signalBody->InvocationCount();
}

}// namespace Pomdog

#endif // !defined(POMDOG_SIGNAL_51888AFF_8963_45DD_8BFC_FE29E829BBFD_HPP)
