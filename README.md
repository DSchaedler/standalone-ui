standalone-ui (SUI or sui) is designed to be a drop-in way to easily create UI Elements in DragonRuby Game Toolkit with no dependencies. This means no sprites, font files, or frameworks.  

The indivdual sub-module files can be used independently as well, if you only want to implement one feature. Be sure to `include 'lib/sui/sub_module_name.rb'` in your `main.rb` or `require` file.  

The module's functions are detailed in the [Github Wiki](https://github.com/DSchaedler/standalone-ui/wiki).

# Usage
1. Copy the `lib` folder into your project folder.
2. In `app/main.rb`, type `require 'lib/sui.rb'` at the top of the file.
3. In `app/main.rb`, at the top of `tick`, type `include SUI` to load the module.
4. In `app/main.rb`, after `include SUI`, type `SUI.ui_update` to enable interactive elements.
