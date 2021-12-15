import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:logging/logging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    Logger.root.level = Level.FINEST;
    Logger.root.onRecord.listen((record) {
      debugPrint(
        '[${record.loggerName}]: ${record.message}',
      );
      if (record.error != null) {
        debugPrint('${record.error}');
      }
      if (record.stackTrace != null) {
        debugPrint('${record.stackTrace}');
      }
    });
  } else {
    Logger.root.level = Level.INFO;
    Logger.root.onRecord.listen((record) {
      debugPrint(
        '[${record.loggerName}]: ${record.level.name}: ${record.time}: ${record.message}',
      );
      if (record.error != null) {
        debugPrint('${record.error}');
      }
      if (record.stackTrace != null) {
        debugPrint('${record.stackTrace}');
      }
    });
  }

  var navigatorKey = GlobalKey<NavigatorState>();

  var registry = JsonWidgetRegistry.instance;
  registry.registerFunction(
    'template',
    ({args, required registry}) => registry.getValue(
      args![0],
    ),
  );

  JsonChartsFlutterPlugin.bind(registry);

  registry.navigatorKey = navigatorKey;

  var templates = {
    'simple_bar_chart': 'bar',
    'stacked_bar_chart': 'bar',
    'grouped_bar_chart': 'bar',
    'grouped_stacked_bar_chart': 'bar',
    'grouped_target_line_bar_chart': 'bar',
    'stacked_horizontal_bar_chart': 'bar',
    'stacked_target_line_bar_chart': 'bar',
    'horizontal_bar_chart': 'bar',
    'horizontal_label_bar_chart': 'bar',
    'vertical_label_bar_chart': 'bar',
    'spark_bar_chart': 'bar',
    'grouped_fill_color_bar_chart': 'bar',
    'stacked_fill_color_bar_chart': 'bar',
    'pattern_forward_hatch_bar_chart': 'bar',
    'horizontal_pattern_forward_hatch_bar_chart': 'bar',
    'grouped_stacked_weight_pattern_bar_chart': 'bar',
    'custom_rounded_bar_chart': 'bar',
    'simple_time_series': 'time_series',
  };
  var futures = <Future>[];
  for (var entry in templates.entries) {
    futures.add(
      Future.microtask(
        () async => registry.setValue(
          entry.key,
          json.encode(
            await rootBundle.loadString(
              'assets/charts/${entry.value}/${entry.key}.json',
            ),
          ),
        ),
      ),
    );
  }
  await Future.wait(futures);

  var data = JsonWidgetData.fromDynamic(
    json.decode(await rootBundle.loadString('assets/pages/charts.json')),
  )!;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonWidgetPage(
        data: data,
      ),
      theme: ThemeData.light(),
    ),
  );
}

class JsonWidgetPage extends StatelessWidget {
  JsonWidgetPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final JsonWidgetData data;

  @override
  Widget build(BuildContext context) => data.build(context: context);
}
