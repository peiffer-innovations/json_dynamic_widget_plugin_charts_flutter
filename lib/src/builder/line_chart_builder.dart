import 'dart:collection';

import 'package:charts_common/common.dart' as common;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';

/// Creates a LineChart widget based on the JSON structure.
class LineChartBuilder extends JsonWidgetBuilder {
  LineChartBuilder({
    required this.animate,
    required this.animationDuration,
    required this.behaviors,
    required this.customSeriesRenderers,
    required this.defaultInteractions,
    required this.defaultRenderer,
    required this.disjointMeasureAxes,
    required this.domainAxis,
    required this.flipVerticalAxis,
    required this.layoutConfig,
    required this.primaryMeasureAxis,
    required this.rtlSpec,
    required this.secondaryMeasureAxis,
    required this.series,
    required this.selectionModels,
    required this.userManagedState,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'line_chart';

  final bool? animate;
  final Duration? animationDuration;
  final List<charts.ChartBehavior<num>>? behaviors;
  final List<charts.SeriesRendererConfig<num>>? customSeriesRenderers;
  final bool defaultInteractions;
  final common.LineRendererConfig<num>? defaultRenderer;
  final LinkedHashMap<String, common.NumericAxisSpec>? disjointMeasureAxes;
  final common.AxisSpec? domainAxis;
  final bool? flipVerticalAxis;
  final charts.LayoutConfig? layoutConfig;
  final common.NumericAxisSpec? primaryMeasureAxis;
  final common.RTLSpec? rtlSpec;
  final common.NumericAxisSpec? secondaryMeasureAxis;
  final List<charts.Series<dynamic, num>> series;
  final List<charts.SelectionModelConfig<num>>? selectionModels;
  final charts.UserManagedState<num>? userManagedState;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "animate": <bool>,
  ///   "animationDuration": <Duration>,
  ///   "behaviors": <List<charts.ChartBehavior<num>>>,
  ///   "customSeriesRenderers": <List<charts.LineRendererConfig<num>>>,
  ///   "defaultInteractions": <bool>,
  ///   "defaultRenderer": <common.SeriesRendererConfig<num>>,
  ///   "disjointMeasureAxes": <LinkedHashMap<String, common.NumericAxisSpec>>,
  ///   "domainAxis": <common.AxisSpec>,
  ///   "flipVerticalAxis": <bool>,
  ///   "layoutConfig": <charts.LayoutConfig>,
  ///   "primaryMeasureAxis": <common.NumericAxisSpec>,
  ///   "rtlSpec": <common.RTLSpec>,
  ///   "secondaryMeasureAxis": <common.NumericAxisSpec>,
  ///   "series": <List<charts.Series<dynamic, num>>>,
  ///   "selectionModels": <List<charts.SelectionModelConfig<num>>>,
  ///   "userManagedState": <charts.UserManagedState<num>>
  /// }
  /// ```
  static LineChartBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    if (map == null) {
      throw Exception('[LineChartBuilder]: map is null');
    }

    return LineChartBuilder(
      animate:
          map['animate'] == null ? null : JsonClass.parseBool(map['animate']),
      animationDuration:
          JsonClass.parseDurationFromMillis(map['animationDuration']),
      behaviors: JsonChartsDecoder.decodeChartBehaviorList<num>(
        map['behaviors'],
        validate: false,
      ),
      customSeriesRenderers:
          JsonChartsDecoder.decodeSeriesRendererConfigList<num>(
        map['customSeriesRenderers'],
        validate: false,
      ),
      defaultInteractions: JsonClass.parseBool(
        map['defaultInteractions'],
        whenNull: true,
      ),
      defaultRenderer: JsonChartsDecoder.decodeLineRendererConfig<num>(
        map['defaultRenderer'],
        validate: false,
      ),
      disjointMeasureAxes: map['disjointMeasureAxes'] == null
          ? null
          : LinkedHashMap.from(
              map['disjointMeasureAxes'].map(
                (k, v) => MapEntry<String, common.NumericAxisSpec>(
                  k.toString(),
                  JsonChartsDecoder.decodeNumericAxisSpec(v)!,
                ),
              ),
            ),
      domainAxis: JsonChartsDecoder.decodeAxisSpec(
        map['domainAxis'],
        validate: false,
      ),
      flipVerticalAxis: map['flipVerticalAxis'] == null
          ? null
          : JsonClass.parseBool(map['flipVerticalAxis']),
      layoutConfig: JsonChartsDecoder.decodeLayoutConfig(
        map['layoutConfig'],
        validate: false,
      ),
      primaryMeasureAxis: JsonChartsDecoder.decodeNumericAxisSpec(
        map['primaryMeasureAxis'],
        validate: false,
      ),
      rtlSpec: JsonChartsDecoder.decodeRTLSpec(
        map['rtlSpec'],
        validate: false,
      ),
      secondaryMeasureAxis: JsonChartsDecoder.decodeNumericAxisSpec(
        map['secondaryMeasureAxis'],
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
      userManagedState: map['userManagedState'],
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
      '[LineChartBuilder] does not support children.',
    );

    return charts.LineChart(
      series,
      animate: animate,
      animationDuration: animationDuration,
      behaviors: behaviors,
      customSeriesRenderers: customSeriesRenderers,
      defaultInteractions: defaultInteractions,
      defaultRenderer: defaultRenderer,
      disjointMeasureAxes: disjointMeasureAxes,
      domainAxis: domainAxis,
      flipVerticalAxis: flipVerticalAxis,
      layoutConfig: layoutConfig,
      primaryMeasureAxis: primaryMeasureAxis,
      rtlSpec: rtlSpec,
      secondaryMeasureAxis: secondaryMeasureAxis,
      selectionModels: selectionModels,
      userManagedState: userManagedState,
    );
  }
}
