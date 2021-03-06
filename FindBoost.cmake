function(add_cloned_imported_target dst src)
    add_library(${dst} INTERFACE IMPORTED)
    foreach(name INTERFACE_LINK_LIBRARIES INTERFACE_INCLUDE_DIRECTORIES INTERFACE_COMPILE_DEFINITIONS INTERFACE_COMPILE_OPTIONS)
        get_property(value TARGET ${src} PROPERTY ${name} )
        set_property(TARGET ${dst} PROPERTY ${name} ${value})
    endforeach()
endfunction()

foreach(component ${Boost_FIND_COMPONENTS})
    if(NOT TARGET Boost::${component})
        add_cloned_imported_target(Boost::${component} CONAN_PKG::boost_${component})
    endif()
endforeach()
set(Boost_FOUND TRUE)
