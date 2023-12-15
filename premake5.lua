workspace "Pollen"
    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }
	architecture "x64"
	startproject "Pollen"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Pollen"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-obj/" .. outputdir .. "/%{prj.name}")

    files
	{
		"Pollen/src/**.h",
		"Pollen/src/**.cpp"
	}
    includedirs
    {
        "%{wks.location}/Pollen/external/spdlog/include",
    }
    filter "system:windows"
        systemversion "latest"
        defines {
            "POLLEN_PLATFORM_WINDOWS",
            "POLLEN_BUILD_DLL"
        }


    filter "configurations:Debug"
        defines "POLLEN_DEBUG"
        runtime "Debug"
        symbols "on"

        links
        {
        }

    filter "configurations:Release"
        defines "POLLEN_RELEASE"
        runtime "Release"
        optimize "on"

        links
        {
        }

    filter "configurations:Dist"
        defines "POLLEN_DIST"
        runtime "Release"
        optimize "on"

        links
        {
        }


project "Sandbox"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-obj/" .. outputdir .. "/%{prj.name}")

    files
    {
        "Sandbox/src/**.h",
        "Sandbox/src/**.cpp"
    }

    includedirs
    {
        "%{wks.location}/Pollen/external/spdlog/include",
        "%{wks.location}/Pollen/src"
    }

    links
    {
        "Pollen"
    }

    filter "system:windows"
        systemversion "latest"
        defines
        {
            "POLLEN_PLATFORM_WINDOWS",
            "POLLEN_BUILD_DLL"
        }

    filter "configurations:Debug"
        defines "POLLEN_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "POLLEN_RELEASE"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        defines "POLLEN_DIST"
        runtime "Release"
        optimize "on"