# Apollo

The most exciting content management system yet.

## Features to add...

- Using autoloading via https://github.com/fxn/zeitwerk
    - Very important for having a compatible file structure
- Menus (Model)
- Options (Persisten Key/Value Storage)
- Widgets (Embeddable pieces of Text/Video/Image/Html)
- Cache (Non-Persisten In Memory Storage) // Plugin
- Theme/Plugin Hooks (Installed, Removed)
- Shortcuts/Helper (Call Code in a user friendly way - aka shortcodes and embbedable)
- WYSIWYG Editor
- Theme Permissions
- User Permissions
- Asset Pipeline (Add gems, js, html, css via Api)
- Extension Permissions (Access to Apis, like Apple's security system)
- Page/Post Categories
- Page/Post Tags
- Post Comments
- Layouting options
- Extensive Documentation
- No Code Editor!!! (Users shouldnt do that...)
- Packaging as gem // More specifically packaging as shippable zip... or docker-compose
- Provide one-click installer // Dont think that is possible
- Accessible logs and exceptions
- Provide a data folder for plugin, theme temporary data
    - Push the concept of having the central data folder for every 3rd party data

## Todos

- Improve Module System
    - Cleanup Core/Theme/Plugin modules
    - Optimize Plugin/Theme loader to use the right modules.
- Write documentation
- Cleanup alpha theme

### Questions

- Should we distinguish between Themes and Plugins? Or do we have an "Addon" system. 
The idea is, that also themes should have the possibility to implement controllers to embrace mvc. So its technically a kind of a plugin.


## Themes

A theme should enable a developer to code clean code. It should provide all necessary freedom to write extensible and customizable code.
In a wordpress theme you are bound to some files, which have to exist. This includes index.php page.php and so on. In apollo, you are free to implement your own controllers.


