#pragma once

#ifdef POLLEN_PLATFORM_WINDOWS

extern pollen::Application* pollen::createApplication();

int main(int argc, char** argv)
{
	auto app = pollen::createApplication();
	app->run();
	delete app;
}

#endif
