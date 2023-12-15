#include "pollen.h"
#include <iostream>


class Sandbox : public pollen::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

pollen::Application* pollen::createApplication()
{
	return new Sandbox();
}