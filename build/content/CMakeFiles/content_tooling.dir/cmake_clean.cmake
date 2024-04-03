file(REMOVE_RECURSE
  "../qml/content/App.qml"
  "../qml/content/BatterySlider.qml"
  "../qml/content/Screen01.ui.qml"
  "../qml/content/Speedometer.qml"
  "../qml/content/TempSlider.qml"
  "../qml/content/WarningSymbol.qml"
  "../qml/content/fonts/fonts.txt"
  "../qml/content/fonts/nasalization-rg.otf"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/content_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
