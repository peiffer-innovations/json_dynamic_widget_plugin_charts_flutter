<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [json_dynamic_widget_plugin_charts_flutter](#json_dynamic_widget_plugin_charts_flutter)
  - [Table of Contents](#table-of-contents)
  - [Live Example](#live-example)
  - [Introduction](#introduction)
  - [Using the Plugin](#using-the-plugin)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# json_dynamic_widget_plugin_charts_flutter

## Table of Contents

* [Live Example](#live-example)
* [Introduction](#introduction)
* [Using the Plugin](#using-the-plugin)


## Live Example

* [Web](https://peiffer-innovations.github.io/json_dynamic_widget_plugin_charts_flutter/web/index.html#/)


## Introduction

Plugin to the [JSON Dynamic Widget](https://peiffer-innovations.github.io/json_dynamic_widget) to provide Charts support utilizing the [charts_flutter](https://pub.dev/packages/charts_flutter).


## Using the Plugin

```dart
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';


void main() {
  // Ensure Flutter's binding is complete
  WidgetsFlutterBinding.ensureInitialized();

  // ...

  // Get an instance of the registry
  var registry = JsonWidgetRegistry.instance;

  // Bind the plugin to the registry.  This is necessary for the registry to
  // find the widget provided by the plugin
  JsonChartsFlutterPlugin.bind(registry);

  // ...
}
```

See the extensive [examples](https://github.com/peiffer-innovations/json_dynamic_widget_plugin_charts_flutter/tree/main/example/assets/charts) for usage information via the JSON renderers.  All examples were borrowed from the official [charts_flutter online gallery](https://google.github.io/charts/flutter/gallery.html)
