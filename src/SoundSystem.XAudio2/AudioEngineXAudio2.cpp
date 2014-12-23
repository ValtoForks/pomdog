﻿//
//  Copyright (C) 2013-2014 mogemimi.
//  Distributed under the MIT License. See LICENSE.md or
//  http://enginetrouble.net/pomdog/license for details.
//

#include "AudioEngineXAudio2.hpp"
#include "Pomdog/Utility/Assert.hpp"
#include "Pomdog/Utility/Exception.hpp"

#if (_WIN32_WINNT >= 0x0602 /*_WIN32_WINNT_WIN8*/) && !defined(__cplusplus_winrt)
#include <wrl/wrappers/corewrappers.h>
#include <wrl/client.h>
#include <wrl/event.h>
#include <Windows.Devices.Enumeration.h>
#include <Windows.Foundation.Collections.h>
#pragma comment(lib,"runtimeobject.lib")
#endif

#include <vector>
#include <string>
#include <utility>

namespace Pomdog {
namespace Details {
namespace SoundSystem {
namespace XAudio2 {
namespace {

static std::string GetErrorDesc(HRESULT hr, std::string const& desc)
{
	return "Failed to call " + desc + ", HRESULT=" + std::to_string(hr);
}
//-----------------------------------------------------------------------
#if (_WIN32_WINNT >= 0x0602 /*_WIN32_WINNT_WIN8*/)
struct AudioDeviceDetails {
	std::wstring DeviceID;
	std::wstring DisplayName;
};
//-----------------------------------------------------------------------
static std::vector<AudioDeviceDetails> EnumerateAudioDevices()
{
#if defined(_XBOX_ONE)
	///@todo Not implemented
#elif (_WIN32_WINNT >= 0x0602 /*_WIN32_WINNT_WIN8*/) && defined(__cplusplus_winrt)
	///@todo Not implemented

	//using Windows::Devices::Enumeration::DeviceClass;
	//using Windows::Devices::Enumeration::DeviceInformation;
	//using Windows::Devices::Enumeration::DeviceInformationCollection;

	//auto operation = DeviceInformation::FindAllAsync(DeviceClass::AudioRender);
	//while (operation->Status != Windows::Foundation::AsyncStatus::Completed);

	//DeviceInformationCollection^ devices = operation->GetResults();

	//for (unsigned int index = 0; index < devices->Size; ++index)
	//{
	//	using Windows::Devices::Enumeration::DeviceInformation;
	//	DeviceInformation^ deviceInfo = devices->GetAt(index);
	//	//deviceInfo->Name->Data();
	//	//deviceInfo->Id->Data();
	//}

#elif (_WIN32_WINNT >= 0x0602 /*_WIN32_WINNT_WIN8*/) && !defined(__cplusplus_winrt)

	using Microsoft::WRL::Callback;
	using Microsoft::WRL::ComPtr;
	using namespace Microsoft::WRL::Wrappers;
	using namespace ABI::Windows::Foundation;
	using namespace ABI::Windows::Foundation::Collections;
	using namespace ABI::Windows::Devices::Enumeration;

	RoInitializeWrapper initialize(RO_INIT_MULTITHREADED);
	HRESULT hr = initialize;

	if (FAILED(hr)) {
		POMDOG_THROW_EXCEPTION(std::runtime_error, GetErrorDesc(hr, "RoInitialize"));
	}

	ComPtr<IDeviceInformationStatics> deviceInfomationFactory;
	hr = GetActivationFactory(HStringReference(
		RuntimeClass_Windows_Devices_Enumeration_DeviceInformation).Get(), &deviceInfomationFactory);

	if (FAILED(hr)) {
		POMDOG_THROW_EXCEPTION(std::runtime_error, GetErrorDesc(hr, "GetActivationFactory"));
	}

	Event findCompleted(CreateEventEx(nullptr, nullptr, CREATE_EVENT_MANUAL_RESET, WRITE_OWNER | EVENT_ALL_ACCESS));

	if (!findCompleted.IsValid()) {
		POMDOG_THROW_EXCEPTION(std::runtime_error, GetErrorDesc(hr, "CreateEventEx"));
	}

	ComPtr<IAsyncOperation<DeviceInformationCollection*>> findOperation;
	hr = deviceInfomationFactory->FindAllAsyncDeviceClass(DeviceClass_AudioRender, findOperation.GetAddressOf());

	if (FAILED(hr)) {
		POMDOG_THROW_EXCEPTION(std::runtime_error, GetErrorDesc(hr, "FindAllAsyncDeviceClass"));
	}

	auto callback = Callback<IAsyncOperationCompletedHandler<DeviceInformationCollection*>>(
		[&findCompleted](IAsyncOperation<DeviceInformationCollection*>*, AsyncStatus)-> HRESULT {
			SetEvent(findCompleted.Get());
			return S_OK;
		});

	findOperation->put_Completed(callback.Get());

	WaitForSingleObjectEx(findCompleted.Get(), INFINITE, FALSE);

	ComPtr<IVectorView<DeviceInformation*>> devices;
	findOperation->GetResults(devices.GetAddressOf());

	unsigned int count = 0;
	hr = devices->get_Size(&count);

	if (FAILED(hr)) {
		POMDOG_THROW_EXCEPTION(std::runtime_error, GetErrorDesc(hr, "get_Size"));
	}

	if (count <= 0) {
		return {};
	}

	std::vector<AudioDeviceDetails> result;

	POMDOG_ASSERT(count >= 1);
	result.reserve(count);

	for (unsigned int index = 0; index < count; ++index)
	{
		ComPtr<IDeviceInformation> deviceInfo;
		hr = devices->GetAt(index, deviceInfo.GetAddressOf());

		if (FAILED(hr)) {
			continue;
		}

		HString id;
		deviceInfo->get_Id(id.GetAddressOf());
		HString name;
		deviceInfo->get_Name(name.GetAddressOf());

		AudioDeviceDetails deviceDetails;
		deviceDetails.DeviceID = id.GetRawBuffer(nullptr);
		deviceDetails.DisplayName = name.GetRawBuffer(nullptr);
		
		result.push_back(std::move(deviceDetails));
	}

	return std::move(result);
#endif
}
#endif

}// unnamed namespace
//-----------------------------------------------------------------------
AudioEngineXAudio2::AudioEngineXAudio2()
	: masteringVoice(nullptr)
{
	HRESULT hr = ::CoInitializeEx(nullptr, COINIT_MULTITHREADED);
	if (FAILED(hr)) {
		POMDOG_THROW_EXCEPTION(std::runtime_error, GetErrorDesc(hr, "CoInitializeEx"));
	}

	UINT32 flags = 0;
#if (_WIN32_WINNT < 0x0602 /*_WIN32_WINNT_WIN8*/) && defined(_DEBUG)
	flags |= XAUDIO2_DEBUG_ENGINE;
#endif

	hr = ::XAudio2Create(&xAudio2, flags, XAUDIO2_DEFAULT_PROCESSOR);
	if (FAILED(hr)) {
		::CoUninitialize();
		POMDOG_THROW_EXCEPTION(std::runtime_error, GetErrorDesc(hr, "XAudio2Create"));
	}

#if (_WIN32_WINNT < 0x0602 /*_WIN32_WINNT_WIN8*/) && defined(_DEBUG)
	{
		XAUDIO2_DEBUG_CONFIGURATION debugConfig;
		debugConfig.TraceMask = XAUDIO2_LOG_ERRORS | XAUDIO2_LOG_WARNINGS;
		debugConfig.BreakMask = 0;
		debugConfig.LogThreadID = FALSE;
		debugConfig.LogFileline = FALSE;
		debugConfig.LogFunctionName = FALSE;
		debugConfig.LogTiming = FALSE;

		POMDOG_ASSERT(xAudio2);
		xAudio2->SetDebugConfiguration(&debugConfig, 0);
	}
#endif

#if (_WIN32_WINNT >= 0x0602 /*_WIN32_WINNT_WIN8*/)
	std::vector<AudioDeviceDetails> audioDevices;
	
	try {
		audioDevices = EnumerateAudioDevices();
	}
	catch (std::exception const& e) {
		xAudio2.Reset();
		::CoUninitialize();
		throw e;
	}

	if (audioDevices.empty()) {
		xAudio2.Reset();
		::CoUninitialize();
		POMDOG_THROW_EXCEPTION(std::runtime_error, GetErrorDesc(hr, "XAudio2Create"));
	}
	POMDOG_ASSERT(!audioDevices.empty());

#else
	UINT32 deviceCount = 0;
	hr = xAudio2->GetDeviceCount(&deviceCount);
	if (FAILED(hr)) {
		xAudio2.Reset();
		::CoUninitialize();
		POMDOG_THROW_EXCEPTION(std::runtime_error, GetErrorDesc(hr, "GetDeviceCount"));
	}

	UINT32 preferredDevice = 0;
	for (UINT32 index = 0; index < deviceCount; ++index)
	{
		XAUDIO2_DEVICE_DETAILS deviceDetails;
		hr = xAudio2->GetDeviceDetails(index, &deviceDetails);

		if (FAILED(hr)) {
			// Error: FUS RO DAH!
			///@todo Not implemented
			break;
		}

		constexpr WORD stereoChannels = 2;
		if (stereoChannels < deviceDetails.OutputFormat.Format.nChannels)
		{
			preferredDevice = index;
			break;
		}
	}
#endif

#if (_WIN32_WINNT >= 0x0602 /*_WIN32_WINNT_WIN8*/)
	hr = xAudio2->CreateMasteringVoice(&masteringVoice, XAUDIO2_DEFAULT_CHANNELS,
		XAUDIO2_DEFAULT_SAMPLERATE, 0, audioDevices.front().DeviceID.data(), nullptr, AudioCategory_GameEffects);
#else
	hr = xAudio2->CreateMasteringVoice(&masteringVoice, XAUDIO2_DEFAULT_CHANNELS,
		XAUDIO2_DEFAULT_SAMPLERATE, 0, preferredDevice, nullptr);
#endif

	if (FAILED(hr)) {
		xAudio2.Reset();
		::CoUninitialize();
		POMDOG_THROW_EXCEPTION(std::runtime_error, GetErrorDesc(hr, "CreateMasteringVoice"));
	}
}
//-----------------------------------------------------------------------
AudioEngineXAudio2::~AudioEngineXAudio2()
{
	if (masteringVoice) {
		masteringVoice->DestroyVoice();
		masteringVoice = nullptr;
	}

	if (xAudio2) {
		xAudio2.Reset();
		::CoUninitialize();
	}
}
//-----------------------------------------------------------------------
float AudioEngineXAudio2::MasterVolume() const
{
	// Error: FUS RO DAH!
	///@todo Not implemented
	POMDOG_THROW_EXCEPTION(std::runtime_error, "Not implemented");
}
//-----------------------------------------------------------------------
void AudioEngineXAudio2::MasterVolume(float volumeIn)
{
	// Error: FUS RO DAH!
	///@todo Not implemented
	UNREFERENCED_PARAMETER(volumeIn);
	POMDOG_THROW_EXCEPTION(std::runtime_error, "Not implemented");
}
//-----------------------------------------------------------------------
IXAudio2* AudioEngineXAudio2::XAudio2Engine() const
{
	POMDOG_ASSERT(xAudio2);
	return xAudio2.Get();
}
//-----------------------------------------------------------------------
}// namespace XAudio2
}// namespace SoundSystem
}// namespace Details
}// namespace Pomdog