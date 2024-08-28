file(REMOVE_RECURSE
  "Constants.qml"
  "DirectoryFontLoader.qml"
  "EventListModel.qml"
  "EventListSimulator.qml"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/Bolt_Dash_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
