file(REMOVE_RECURSE
  "Main/main.qml"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/Bolt_DashApp_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
