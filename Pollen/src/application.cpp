#include <chrono>
#include <thread>
#include <string>
#include <iostream>
#include "application.h"

namespace pollen
{
	Application::Application()
	{
	}
	Application::~Application()
	{
	}
	void Application::run()
	{
		std::cout << "App.Run\n";
		while (true) {
			std::this_thread::sleep_for(std::chrono::milliseconds(100));
		}

	}
}