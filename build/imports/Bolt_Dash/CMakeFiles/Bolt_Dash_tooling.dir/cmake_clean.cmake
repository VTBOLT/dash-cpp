file(REMOVE_RECURSE
  "../../qml/Bolt_Dash/Constants.qml"
  "../../qml/Bolt_Dash/DirectoryFontLoader.qml"
  "../../qml/Bolt_Dash/EventListModel.qml"
  "../../qml/Bolt_Dash/EventListSimulator.qml"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/Bolt_Dash_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
