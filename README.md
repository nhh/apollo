# Apollo

The most exciting content management system yet.





## Core Features
- Menus (Model)
- ~~Configuration~~ (Model)
- Widgets (Embeddable pieces of Text/Video/Image/Html)

- Hooks
- Shortcuts (Widget)
- WYSIWYG (Widget)
- Permissions
    - Theme Permissions
    - Widget Permissions
    - Plugin Permissions
- User Permissions
- Vue/React Component injection (Widget)
- Page/Post Categories
- Page/Post Tags
- Post Comments
- Page/Post Grid (12 Columns)
- Extensive Documentation

### Addons to implement
- Redis Cache
- Shop (Woocommerce)
- Customer management


### Architecture Decisions:

1. Plugins and Themes are basically Addons.
    The main reason for this is, that themes CAN actually have admin configuration and custom entities. The second reason
    for this is, that plugins are not bound to have ONLY admin stuff packed.
    The result is an addon, fully applying mvc and are not being bound to one side of the fence.
    Addons and Widgets on the other hand have clearly different purposes.
