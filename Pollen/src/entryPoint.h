#pragma once

#ifdef POLLEN_PLATFORM_WINDOWS

extern pollen::Application* pollen::createApplication();

int main(int argc, char** argv)
{
	pollen::Log::init();
	POLLEN_CORE_WARN("initialized Log.");
	int a = 5;
	POLLEN_INFO("Hello! Var={0}", a);
	auto app = pollen::createApplication();
	app->run();
	delete app;
}

#endif
