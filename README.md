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