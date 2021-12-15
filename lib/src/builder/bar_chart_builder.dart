import 'dart:collection';

import 'package:charts_common/common.dart' as common;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';

/// Creates a BarChart widget based on the JSON structure.
class BarChartBuilder extends JsonWidgetBuilder {
  BarChartBuilder({
    required this.animate,
    required this.animationDuration,
    required this.barGroupingType,
    required this.barRendererDecorator,
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
    required this.vertical,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'bar_chart';

  final bool? animate;
  final Duration? animationDuration;
  final common.BarGroupingType? barGroupingType;
  final common.BarRendererDecorator<String>? barRendererDecorator;
  final List<charts.ChartBehavior<String>>? behaviors;
  final List<charts.SeriesRendererConfig<String>>? customSeriesRenderers;
  final bool? defaultInteractions;
  final common.BarRendererConfig<String>? defaultRenderer;
  final LinkedHashMap<String, common.NumericAxisSpec>? disjointMeasureAxes;
  final common.AxisSpec? domainAxis;
  final bool? flipVerticalAxis;
  final charts.LayoutConfig? layoutConfig;
  final common.NumericAxisSpec? primaryMeasureAxis;
  final common.RTLSpec? rtlSpec;
  final common.NumericAxisSpec? secondaryMeasureAxis;
  final List<charts.Series<dynamic, String>> series;
  final List<charts.SelectionModelConfig<String>>? selectionModels;
  final charts.UserManagedState<String>? userManagedState;
  final bool? vertical;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "animate": <bool>,
  ///   "animationDuration": <Duration>,
  ///   "barGroupingType": <common.BarGroupingType>,
  ///   "barRendererDecorator": <common.BarRendererDecorator<String>>,
  ///   "behaviors": <List<charts.ChartBehavior<String>>>,
  ///   "customSeriesRenderers": <List<charts.SeriesRendererConfig<String>>>,
  ///   "defaultInteractions": <bool>,
  ///   "defaultRenderer": <common.BarRendererConfig<String>>,
  ///   "disjointMeasureAxes": <LinkedHashMap<String, common.NumericAxisSpec>>,
  ///   "domainAxis": <common.AxisSpec>,
  ///   "flipVerticalAxis": <bool>,
  ///   "layoutConfig": <charts.LayoutConfig>,
  ///   "primaryMeasureAxis": <common.NumericAxisSpec>,
  ///   "rtlSpec": <common.RTLSpec>,
  ///   "secondaryMeasureAxis": <common.NumericAxisSpec>,
  ///   "series": <List<charts.Series<dynamic, String>>>,
  ///   "selectionModels": <List<charts.SelectionModelConfig<String>>>,
  ///   "userManagedState": <charts.UserManagedState<String>>,
  ///   "vertical": <bool>
  /// }
  /// ```
  static BarChartBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    if (map == null) {
      throw Exception('[BarChartBuilder]: map is null');
    }

    return BarChartBuilder(
      animate:
          map['animate'] == null ? null : JsonClass.parseBool(map['animate']),
      animationDuration:
          JsonClass.parseDurationFromMillis(map['animationDuration']),
      barGroupingType: JsonChartsDecoder.decodeBarGroupingType(
        map['barGroupingType'],
        validate: false,
      ),
      barRendererDecorator:
          JsonChartsDecoder.decodeBarRendererDecorator<String>(
        map['barRendererDecorator'],
        validate: false,
      ),
      behaviors: map['behaviors'],
      customSeriesRenderers: JsonChartsDecoder.decodeBarRendererConfigList(
        map['customSeriesRenderers'],
        validate: false,
      ),
      defaultInteractions: map['defaultInteractions'] == null
          ? null
          : JsonClass.parseBool(map['defaultInteractions']),
      defaultRenderer: JsonChartsDecoder.decodeBarRendererConfig<String>(
        map['defaultRenderer'],
        validate: false,
      ) as charts.BarRendererConfig<String>?,
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
      selectionModels: JsonChartsDecoder.decodeSelectionModelConfigList<String>(
        map['selectionModels'],
        validate: false,
      ),
      userManagedState: map['userManagedState'],
      vertical:
          map['vertical'] == null ? null : JsonClass.parseBool(map['vertical']),
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
      '[BarChartBuilder] does not support children.',
    );

    return charts.BarChart(
      series,
      animate: animate,
      animationDuration: animationDuration,
      barGroupingType: barGroupingType,
      barRendererDecorator: barRendererDecorator,
      behaviors: behaviors,
      customSeriesRenderers: customSeriesRenderers,
      defaultInteractions: defaultInteractions ?? true,
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
      vertical: vertical ?? true,
    );
  }
}
