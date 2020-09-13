project "tinyobjloader"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "On"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    
    files
    {
        "include/tinyobjloader/tiny_obj_loader.h",
        "include/tinyobjloader/tiny_obj_loader.cc",
    }
    
    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        optimize "Off"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "Speed"
        vectorextensions "AVX2"
        symbols "On"
        flags
        {
            "LinkTimeOptimization"
        }

    filter "configurations:Dist"
        runtime "Release"
        optimize "Speed"
        vectorextensions "AVX2"
        symbols "Off"
        flags
        {
            "LinkTimeOptimization",
            "FatalWarnings"
        }
