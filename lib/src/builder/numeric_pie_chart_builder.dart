import 'package:charts_common/common.dart' as common;
import 'package:community_charts_flutter/flutter.dart' as charts;
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';

/// Creates a PieChart widget based on the JSON structure.
class NumericPieChartBuilder extends JsonWidgetBuilder {
  NumericPieChartBuilder({
    required this.animate,
    required this.animationDuration,
    required this.behaviors,
    required this.defaultInteractions,
    required this.defaultRenderer,
    required this.layoutConfig,
    required this.rtlSpec,
    required this.series,
    required this.selectionModels,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'numeric_pie_chart';

  final bool? animate;
  final Duration? animationDuration;
  final List<charts.ChartBehavior<num>>? behaviors;
  final bool defaultInteractions;
  final common.ArcRendererConfig<num>? defaultRenderer;
  final charts.LayoutConfig? layoutConfig;
  final common.RTLSpec? rtlSpec;
  final List<charts.Series<dynamic, num>> series;
  final List<charts.SelectionModelConfig<num>>? selectionModels;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "animate": <bool>,
  ///   "animationDuration": <Duration>,
  ///   "behaviors": <List<charts.ChartBehavior<num>>>,
  ///   "defaultInteractions": <bool>,
  ///   "defaultRenderer": <common.ArcRendererConfig<num>>,
  ///   "layoutConfig": <charts.LayoutConfig>,
  ///   "rtlSpec": <common.RTLSpec>,
  ///   "series": <List<charts.Series<dynamic, num>>>,
  ///   "selectionModels": <List<charts.SelectionModelConfig<num>>>
  /// }
  /// ```
  static NumericPieChartBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    if (map == null) {
      throw Exception('[NumericPieChartBuilder]: map is null');
    }

    return NumericPieChartBuilder(
      animate:
          map['animate'] == null ? null : JsonClass.parseBool(map['animate']),
      animationDuration:
          JsonClass.parseDurationFromMillis(map['animationDuration']),
      behaviors: JsonChartsDecoder.decodeChartBehaviorList<num>(
        map['behaviors'],
        validate: false,
      ),
      defaultInteractions: JsonClass.parseBool(
        map['defaultInteractions'],
        whenNull: true,
      ),
      defaultRenderer: JsonChartsDecoder.decodeArcRendererConfig<num>(
        map['defaultRenderer'],
        validate: false,
      ),
      layoutConfig: JsonChartsDecoder.decodeLayoutConfig(
        map['layoutConfig'],
        validate: false,
      ),
      rtlSpec: JsonChartsDecoder.decodeRTLSpec(
        map['rtlSpec'],
        validate: false,
      ),
      series: JsonChartsDecoder.decodeSeriesList(
        map['series'],
        validate: false,
      ),
      selectionModels: JsonChartsDecoder.decodeSelectionModelConfigList<num>(
        map['selectionModels'],
        validate: false,
      ),
    );
  }

  /// Builds the widget from the give [data].
  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    assert(
      data.children?.isNotEmpty != true,
      '[NumericPieChartBuilder] does not support children.',
    );

    return charts.PieChart(
      series,
      animate: animate,
      animationDuration: animationDuration,
      behaviors: behaviors,
      defaultInteractions: defaultInteractions,
      defaultRenderer: defaultRenderer,
      layoutConfig: layoutConfig,
      rtlSpec: rtlSpec,
      selectionModels: selectionModels,
    );
  }
}
