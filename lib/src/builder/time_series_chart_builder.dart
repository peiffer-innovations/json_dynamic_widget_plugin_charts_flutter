import 'dart:collection';

import 'package:charts_common/common.dart' as common;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';

/// Creates a TimeSeriesBarChart widget based on the JSON structure.
class TimeSeriesChartBuilder extends JsonWidgetBuilder {
  TimeSeriesChartBuilder({
    required this.animate,
    required this.animationDuration,
    required this.behaviors,
    required this.customSeriesRenderers,
    required this.dateTimeFactory,
    required this.defaultInteractions,
    required this.defaultRenderer,
    required this.disjointMeasureAxes,
    required this.domainAxis,
    required this.flipVerticalAxis,
    required this.layoutConfig,
    required this.primaryMeasureAxis,
    required this.secondaryMeasureAxis,
    required this.series,
    required this.selectionModels,
    required this.userManagedState,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'time_series_chart';

  final bool? animate;
  final Duration? animationDuration;
  final List<charts.ChartBehavior<DateTime>>? behaviors;
  final List<charts.SeriesRendererConfig<DateTime>>? customSeriesRenderers;
  final common.DateTimeFactory? dateTimeFactory;
  final bool? defaultInteractions;
  final common.SeriesRendererConfig<DateTime>? defaultRenderer;
  final LinkedHashMap<String, common.NumericAxisSpec>? disjointMeasureAxes;
  final common.AxisSpec? domainAxis;
  final bool? flipVerticalAxis;
  final charts.LayoutConfig? layoutConfig;
  final common.NumericAxisSpec? primaryMeasureAxis;
  final common.NumericAxisSpec? secondaryMeasureAxis;
  final List<charts.Series<dynamic, DateTime>> series;
  final List<charts.SelectionModelConfig<DateTime>>? selectionModels;
  final charts.UserManagedState<DateTime>? userManagedState;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "animate": <bool>,
  ///   "animationDuration": <Duration>,
  ///   "behaviors": <List<charts.ChartBehavior<DateTime>>>,
  ///   "customSeriesRenderers": <List<charts.SeriesRendererConfig<DateTime>>>,
  ///   "dateTimeFactory": <common.DateTimeFactory>,
  ///   "defaultInteractions": <bool>,
  ///   "defaultRenderer": <common.SeriesRendererConfig<DateTime>>,
  ///   "disjointMeasureAxes": <LinkedHashMap<String, common.NumericAxisSpec>>,
  ///   "domainAxis": <common.AxisSpec>,
  ///   "flipVerticalAxis": <bool>,
  ///   "layoutConfig": <charts.LayoutConfig>,
  ///   "primaryMeasureAxis": <common.NumericAxisSpec>,
  ///   "secondaryMeasureAxis": <common.NumericAxisSpec>,
  ///   "series": <List<charts.Series<dynamic, DateTime>>>,
  ///   "selectionModels": <List<charts.SelectionModelConfig<DateTime>>>,
  ///   "userManagedState": <charts.UserManagedState<DateTime>>
  /// }
  /// ```
  static TimeSeriesChartBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    if (map == null) {
      throw Exception('[TimeSeriesChartBuilder]: map is null');
    }

    return TimeSeriesChartBuilder(
      animate:
          map['animate'] == null ? null : JsonClass.parseBool(map['animate']),
      animationDuration:
          JsonClass.parseDurationFromMillis(map['animationDuration']),
      behaviors: map['behaviors'],
      customSeriesRenderers: JsonChartsDecoder.decodeBarRendererConfigList(
        map['customSeriesRenderers'],
        validate: false,
      ),
      dateTimeFactory: JsonChartsDecoder.decodeDateTimeFactory(
        map['dateTimeFactory'],
        validate: false,
      ),
      defaultInteractions: map['defaultInteractions'] == null
          ? null
          : JsonClass.parseBool(map['defaultInteractions']),
      defaultRenderer: null,
      // JsonChartsDecoder.decodeBarRendererConfig<String>(
      //   map['defaultRenderer'],
      //   validate: false,
      // ) as charts.BarRendererConfig<String>?,
      disjointMeasureAxes: map['disjointMeasureAxes'] == null
          ? null
          : LinkedHashMap.from(map['disjointMeasureAxes']),
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
      secondaryMeasureAxis: JsonChartsDecoder.decodeNumericAxisSpec(
        map['secondaryMeasureAxis'],
        validate: false,
      ),
      series: JsonChartsDecoder.decodeSeriesList(
        map['series'],
        validate: false,
      ),
      selectionModels:
          JsonChartsDecoder.decodeSelectionModelConfigList<DateTime>(
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
      '[TimeSeriesChartBuilder] does not support children.',
    );

    return charts.TimeSeriesChart(
      series,
      animate: animate,
      animationDuration: animationDuration,
      dateTimeFactory: dateTimeFactory,
      behaviors: behaviors,
      customSeriesRenderers: customSeriesRenderers,
      defaultInteractions: defaultInteractions ?? true,
      defaultRenderer: defaultRenderer,
      disjointMeasureAxes: disjointMeasureAxes,
      domainAxis: domainAxis,
      flipVerticalAxis: flipVerticalAxis,
      layoutConfig: layoutConfig,
      primaryMeasureAxis: primaryMeasureAxis,
      secondaryMeasureAxis: secondaryMeasureAxis,
      selectionModels: selectionModels,
      userManagedState: userManagedState,
    );
  }
}
