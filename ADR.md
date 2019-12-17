# Architecture Decision Records

### 17.12.2019 - An addon can also be an widget
Author: Niklas Hanft

I thought a lot about the seperation of widgets and addons. There are two reasons which made me clear this seperation up.
The first is, that a widget is a very small piece of admin code, that probably comes in "bundles" (Distribution of multiple components). So a single "widget" would not sustain its name.
The second reason is, that an addon most likely is about to register widgets, for themes or custom layout.

The three terms "widget", "theme" and "addon" are now bundled in "addon".


