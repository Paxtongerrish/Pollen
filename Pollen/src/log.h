#pragma once
#include <memory>
#include "core.h"
#include "spdlog/spdlog.h"

namespace pollen
{
	class POLLEN_API Log
	{
	public:
		static void init();
		inline static std::shared_ptr<spdlog::logger>& getCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& getClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// Core Log Macros
#define POLLEN_CORE_TRACE(...) pollen::Log::getCoreLogger()->trace(__VA_ARGS__)
#define POLLEN_CORE_INFO(...)  pollen::Log::getCoreLogger()->info(__VA_ARGS__)
#define POLLEN_CORE_WARN(...)  pollen::Log::getCoreLogger()->warn(__VA_ARGS__)
#define POLLEN_CORE_ERROR(...) pollen::Log::getCoreLogger()->error(__VA_ARGS__)
#define POLLEN_CORE_FATAL(...) pollen::Log::getCoreLogger()->fatal(__VA_ARGS__)

// Client Log Macros
#define POLLEN_TRACE(...)      pollen::Log::getClientLogger()->trace(__VA_ARGS__)
#define POLLEN_INFO(...)       pollen::Log::getClientLogger()->info(__VA_ARGS__)
#define POLLEN_WARN(...)       pollen::Log::getClientLogger()->warn(__VA_ARGS__)
#define POLLEN_ERROR(...)      pollen::Log::getClientLogger()->error(__VA_ARGS__)
#define POLLEN_FATAL(...)      pollen::Log::getClientLogger()->fatal(__VA_ARGS__)