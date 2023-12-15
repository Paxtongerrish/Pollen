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
    location "Pollen"
    kind "SharedLib"
    language "C++"
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-obj/" .. outputdir .. "/%{prj.name}")

    files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
    includedirs
    {
        "%{prj.name}/external/spdlog/include"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"
        defines {
            "POLLEN_PLATFORM_WINDOWS",
            "POLLEN_BUILD_DLL"
        }
        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }


    filter "configurations:Debug"
        defines "POLLEN_DEBUG"
        runtime "Debug"
        symbols "On"

        links
        {
        }

    filter "configurations:Release"
        defines "POLLEN_RELEASE"
        runtime "Release"
        optimize "On"

        links
        {
        }

    filter "configurations:Dist"
        defines "POLLEN_DIST"
        runtime "Release"
        optimize "On"

        links
        {
        }


project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-obj/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
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
        cppdialect "C++17"
        systemversion "latest"
        staticruntime "On"
        defines
        {
            "POLLEN_PLATFORM_WINDOWS"
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