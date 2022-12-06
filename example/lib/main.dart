import 'dart:convert';
import 'dart:math' as math;

import 'package:example/src/custom_functions/confidence_interval_functions.dart';
import 'package:example/src/custom_functions/selection_callback_functions.dart';
import 'package:example/src/custom_functions/series_legend_with_measure_functions.dart';
import 'package:example/src/custom_functions/slider_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';
import 'package:logging/logging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SchemaValidator.enabled = false;

  if (kDebugMode) {
    Logger.root.level = Level.FINE;
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

  final navigatorKey = GlobalKey<NavigatorState>();

  final registry = JsonWidgetRegistry.instance;

  registry.setValue(
    'NumberFormat.compactSimpleCurrency',
    NumberFormat.compactSimpleCurrency(),
  );
  registry.setValue('pi', math.pi);
  registry.setValue('Icons.cloud', Icons.cloud);

  registry.registerFunction(
    'loadTemplate',
    ({args, required registry}) => registry.getValue(
      args![0],
    ),
  );
  ConfidenceIntervalFunctions.functions.forEach(
    (key, value) => registry.setValue(key, value),
  );
  SelectionCallbackFunctions.functions.forEach(
    (key, value) => registry.setValue(key, value),
  );
  SeriesLegendWithMeasuresFunctions.functions.forEach(
    (key, value) => registry.setValue(key, value),
  );
  SliderFunctions.functions.forEach(
    (key, value) => registry.setValue(key, value),
  );

  JsonChartsFlutterPlugin.bind(registry);

  registry.navigatorKey = navigatorKey;

  final templates = {
    // bar
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

    // time series
    'simple_time_series': 'time_series',
    'end_points_axis_time_series': 'time_series',
    'confidence_interval_time_series': 'time_series',
    'line_annotation_time_series': 'time_series',
    'range_annotation_time_series': 'time_series',
    'range_annotation_margin_time_series': 'time_series',
    'symbol_annotation_time_series': 'time_series',
    'with_bar_renderer_time_series': 'time_series',

    // line
    'simple_line_chart': 'line',
    'points_line_chart': 'line',
    'stacked_area_line_chart': 'line',
    'stacked_area_custom_color_line_chart': 'line',
    'area_and_line_line_chart': 'line',
    'simple_nulls_line_chart': 'line',
    'stacked_area_nulls_line_chart': 'line',
    'dash_pattern_line_chart': 'line',

    // scatter plot
    'simple_scatter_plot_chart': 'scatter_plot',
    'shapes_scatter_plot_chart': 'scatter_plot',
    'comparison_points_scatter_plot_chart': 'scatter_plot',
    'bucketing_axis_scatter_plot_chart': 'scatter_plot',

    // combo
    'ordinal_bar_line_combo_chart': 'combo',
    'numeric_line_bar_combo_chart': 'combo',
    'numeric_line_point_combo_chart': 'combo',
    'date_time_line_point_combo_chart': 'combo',
    'scatter_plot_line_combo_chart': 'combo',

    // pie
    'simple_pie_chart': 'pie',
    'inside_label_pie_chart': 'pie',
    'partial_pie_chart': 'pie',
    'donut_pie_chart': 'pie',
    'auto_label_pie_chart': 'pie',
    'gauge_pie_chart': 'pie',

    // axis
    'bar_secondary_axis': 'axis',
    'bar_second_axis_only': 'axis',
    'horizontal_bar_secondary_axis': 'axis',
    'flipped_vertical_axis': 'axis',
    'short_tick_length_axis': 'axis',
    'custom_font_size_and_color': 'axis',
    'measure_axis_label_alignment': 'axis',
    'hidden_ticks_and_labels': 'axis',
    'custom_axis_tick_formatters': 'axis',
    'custom_measure_tick_count': 'axis',
    'integer_only_measure_axis': 'axis',
    'nonzero_bound_measure_axis': 'axis',
    'statically_provided_ticks': 'axis',
    'ordinal_initial_viewport': 'axis',
    'numeric_initial_viewport': 'axis',
    'gridline_dash_pattern': 'axis',
    'line_disjoint_axis': 'axis',

    // legend
    'simple_series_legend': 'legend',
    'series_legend_options': 'legend',
    'series_legend_with_measures': 'legend',
    'legend_custom_symbol': 'legend',
    'default_hidden_series_legend': 'legend',
    'simple_datum_legend': 'legend',
    'datum_legend_options': 'legend',
    'datum_legend_with_measures': 'legend',

    // behavior
    'initial_selection': 'behavior',
    'selection_bar_highlight': 'behavior',
    'selection_line_highlight': 'behavior',
    'selection_callback_example': 'behavior',
    'chart_title': 'behavior',
    'slider': 'behavior',
    'sliding_viewport_on_selection': 'behavior',
    'percent_of_domain': 'behavior',
    'percent_of_domain_by_category': 'behavior',
    'percent_of_series': 'behavior',
    'initial_hint_animation': 'behavior',
  };
  final futures = <Future>[];
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

  final data = JsonWidgetData.fromDynamic(
      json.decode(await rootBundle.loadString('assets/pages/charts.json')))!;

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
