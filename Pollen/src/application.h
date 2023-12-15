#pragma once
#include "core.h"

namespace pollen
{
	class POLLEN_API Application
	{
	public:
		Application();
		virtual ~Application();
		void run();
	};
	Application* createApplication();
}

