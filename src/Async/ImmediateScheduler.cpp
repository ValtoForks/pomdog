// Copyright (c) 2013-2018 mogemimi. Distributed under the MIT license.

#include "Pomdog/Async/ImmediateScheduler.hpp"
#include "Pomdog/Utility/Assert.hpp"
#include <thread>

namespace Pomdog {
namespace Concurrency {

void ImmediateScheduler::Schedule(
    std::function<void()> && task,
    const Duration& delayTime)
{
    POMDOG_ASSERT(task);
    if (delayTime > std::chrono::duration<double>::zero()) {
        using namespace std::chrono;
        std::this_thread::sleep_for(duration_cast<milliseconds>(delayTime));
    }
    task();
}

} // namespace Concurrency
} // namespace Pomdog
