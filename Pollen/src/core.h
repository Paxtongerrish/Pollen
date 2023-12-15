#pragma once

#ifdef POLLEN_PLATFORM_WINDOWS
	#ifdef POLLEN_BUILD_DLL
		#define POLLEN_API _declspec(dllexport)
	#else
		#define POLLEN_API _declspec(dllimport)
	#endif
#else
	#error Pollen only supports windows
#endif
