# Apollo

The most exciting content management system yet. (at least for me..)

## Evaluation list
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
- Javascript Components
- Page/Post Categories
- Page/Post Tags
- Post Comments
- Page/Post Grid (12 Columns)
- Extensive Documentation
- Configuration Management (env)

## Addons to implement
- Redis Cache
- Shop (Woocommerce)
- Customer management


## Deployment and Runtime notes

Apollo will be "packaged" as a gem. All runtime dependencies will be resolved by the server.

Installation is as simple as "gem install apollo". Configration will live in "/etc/apollo/config" and files will live within "/var/lib/apollo/data" and "/var/lib/apollo/addons"
