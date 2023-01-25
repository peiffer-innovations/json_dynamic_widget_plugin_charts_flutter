import 'dart:convert';

import 'package:community_charts_flutter/flutter.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_path/json_path.dart';
import 'package:logging/logging.dart';

class CreateSeriesFunction {
  static const id = 'create_series';

  static final Logger _logger = Logger('CreateSeriesFunction');

  static final JsonWidgetFunction body = ({
    required List<dynamic>? args,
    required JsonWidgetRegistry registry,
  }) {
    if (args == null) {
      throw Exception(
        '[$id]: requires 2+ args: [inputList, seriesName, {domainAxis}, {measureAxis}, {color}, {label}, {fillColor}]',
      );
    }

    final values = <String, dynamic>{};
    var domainType = String;
    for (var arg in args) {
      if (arg == null) {
        continue;
      }
      if (arg is Map) {
        Map<String, dynamic>.from(arg).forEach((key, value) {
          _logger.finest('[$key] = [$value]');
          switch (key) {
            case 'type':
              if (value == 'DateTime') {
                domainType = DateTime;
              } else if (value == 'int') {
                domainType = int;
              } else if (value == 'double') {
                domainType = double;
              } else {
                domainType = String;
              }
              break;
            default:
              values[key] = value;
          }
        });
      }
    }

    dynamic series;
    try {
      switch (domainType) {
        case DateTime:
          series = createSeries<DateTime>(
            areaColor: values['areaColor'],
            color: values['color'],
            dashPattern: values['dashPattern'],
            domain: values['domain'],
            domainLowerBoundFn: values['domainLowerBoundFn'],
            domainParser: (value) => JsonClass.parseDateTime(value)!,
            domainUpperBoundFn: values['domainUpperBoundFn'],
            fillColor: values['fillColor'],
            fillPattern: JsonChartsDecoder.decodeFillPatternType(
              values['fillPattern'],
            ),
            id: values['id'],
            itemColor: values['itemColor'],
            itemDomainLowerBound: values['itemDomainLowerBound'],
            itemDomainUpperBound: values['itemDomainUpperBound'],
            itemFillColor: values['itemFillColor'],
            itemLabel: values['label'],
            itemMeasureLowerBound: values['itemMeasureLowerBound'],
            itemMeasureUpperBound: values['itemMeasureUpperBound'],
            itemRadius: values['itemRadius'],
            itemShape: values['itemShape'],
            itemStrokeWidth: values['itemStrokeWidth'],
            items: values['items'],
            measure: values['measure'],
            measureLowerBoundFn: values['measureLowerBoundFn'],
            measureUpperBoundFn: values['measureUpperBoundFn'],
            name: values['name'],
            registry: registry,
            seriesCategory: values['seriesCategory'],
          );
          break;

        case int:
          series = createSeries<int>(
            areaColor: values['areaColor'],
            color: values['color'],
            dashPattern: values['dashPattern'],
            domain: values['domain'],
            domainLowerBoundFn: values['domainLowerBoundFn'],
            domainParser: (value) => JsonClass.parseInt(value) ?? 0,
            domainUpperBoundFn: values['domainUpperBoundFn'],
            fillColor: values['fillColor'],
            fillPattern: JsonChartsDecoder.decodeFillPatternType(
              values['fillPattern'],
            ),
            id: values['id'],
            itemColor: values['itemColor'],
            itemDomainLowerBound: values['itemDomainLowerBound'],
            itemDomainUpperBound: values['itemDomainUpperBound'],
            itemFillColor: values['itemFillColor'],
            itemLabel: values['label'],
            itemMeasureLowerBound: values['itemMeasureLowerBound'],
            itemMeasureUpperBound: values['itemMeasureUpperBound'],
            itemRadius: values['itemRadius'],
            itemShape: values['itemShape'],
            itemStrokeWidth: values['itemStrokeWidth'],
            items: values['items'],
            measure: values['measure'],
            measureLowerBoundFn: values['measureLowerBoundFn'],
            measureUpperBoundFn: values['measureUpperBoundFn'],
            name: values['name'],
            registry: registry,
            seriesCategory: values['seriesCategory'],
          );
          break;

        case double:
          series = createSeries<double>(
            areaColor: values['areaColor'],
            color: values['color'],
            dashPattern: values['dashPattern'],
            domain: values['domain'],
            domainLowerBoundFn: values['domainLowerBoundFn'],
            domainParser: (value) => JsonClass.parseDouble(value) ?? 0.0,
            domainUpperBoundFn: values['domainUpperBoundFn'],
            fillColor: values['fillColor'],
            fillPattern: JsonChartsDecoder.decodeFillPatternType(
              values['fillPattern'],
            ),
            id: values['id'],
            itemColor: values['itemColor'],
            itemDomainLowerBound: values['itemDomainLowerBound'],
            itemDomainUpperBound: values['itemDomainUpperBound'],
            itemFillColor: values['itemFillColor'],
            itemLabel: values['label'],
            itemMeasureLowerBound: values['itemMeasureLowerBound'],
            itemMeasureUpperBound: values['itemMeasureUpperBound'],
            itemRadius: values['itemRadius'],
            itemShape: values['itemShape'],
            itemStrokeWidth: values['itemStrokeWidth'],
            items: values['items'],
            measure: values['measure'],
            measureLowerBoundFn: values['measureLowerBoundFn'],
            measureUpperBoundFn: values['measureUpperBoundFn'],
            name: values['name'],
            registry: registry,
            seriesCategory: values['seriesCategory'],
          );
          break;

        default:
          series = createSeries<String>(
            areaColor: values['areaColor'],
            color: values['color'],
            dashPattern: values['dashPattern'],
            domain: values['domain'],
            domainLowerBoundFn: values['domainLowerBoundFn'],
            domainParser: ((value) => value?.toString() ?? ''),
            domainUpperBoundFn: values['domainUpperBoundFn'],
            fillColor: values['fillColor'],
            fillPattern: JsonChartsDecoder.decodeFillPatternType(
              values['fillPattern'],
            ),
            id: values['id'],
            itemColor: values['itemColor'],
            itemDomainLowerBound: values['itemDomainLowerBound'],
            itemDomainUpperBound: values['itemDomainUpperBound'],
            itemFillColor: values['itemFillColor'],
            itemLabel: values['label'],
            itemMeasureLowerBound: values['itemMeasureLowerBound'],
            itemMeasureUpperBound: values['itemMeasureUpperBound'],
            itemRadius: values['itemRadius'],
            itemShape: values['itemShape'],
            itemStrokeWidth: values['itemStrokeWidth'],
            items: values['items'],
            measure: values['measure'],
            measureLowerBoundFn: values['measureLowerBoundFn'],
            measureUpperBoundFn: values['measureUpperBoundFn'],
            name: values['name'],
            registry: registry,
            seriesCategory: values['seriesCategory'],
          );
          break;
      }
    } catch (e, stack) {
      _logger.severe('Error processing series: [$values]', e, stack);
      rethrow;
    }

    if (values['boundsLineRadiusPxKey'] != null) {
      series.setAttribute(
        boundsLineRadiusPxKey,
        JsonClass.parseDouble(values['boundsLineRadiusPxKey']),
      );
    }

    if (values['rendererIdKey'] != null) {
      series.setAttribute(rendererIdKey, values['rendererIdKey']);
    }
    if (values['measureAxisIdKey'] != null) {
      series.setAttribute(measureAxisIdKey, values['measureAxisIdKey']);
    }

    return series;
  };

  static Series<ChartPoint<D>, D> createSeries<D>({
    required dynamic areaColor,
    required dynamic color,
    required dynamic dashPattern,
    required String? domain,
    required TypedAccessorFn<ChartPoint<D>, D?>? domainLowerBoundFn,
    required TypedAccessorFn<ChartPoint<D>, D?>? domainUpperBoundFn,
    required dynamic Function(dynamic value) domainParser,
    required dynamic fillColor,
    required FillPatternType? fillPattern,
    required String? id,
    required String? itemColor,
    required String? itemDomainLowerBound,
    required String? itemDomainUpperBound,
    required String? itemFillColor,
    required String? itemLabel,
    required String? itemMeasureLowerBound,
    required String? itemMeasureUpperBound,
    required String? itemRadius,
    required String? itemShape,
    required String? itemStrokeWidth,
    required dynamic items,
    required String? measure,
    required TypedAccessorFn<ChartPoint<D>, num?>? measureLowerBoundFn,
    required TypedAccessorFn<ChartPoint<D>, num?>? measureUpperBoundFn,
    required String name,
    required JsonWidgetRegistry registry,
    required String? seriesCategory,
  }) {
    if (items is String) {
      items = json.decode(items);
    }

    final areaChartsColor = JsonChartsDecoder.decodeColor(areaColor);
    final chartsColor = JsonChartsDecoder.decodeColor(color);
    final chartsFillColor = JsonChartsDecoder.decodeColor(fillColor);

    final data = <ChartPoint<D>>[];
    var hasColor = false;
    var hasDomainLowerBound = false;
    var hasDomainUpperBound = false;
    var hasFillColor = false;
    var hasLabels = false;
    var hasMeasureLowerBound = false;
    var hasMeasureUpperBound = false;
    var hasRadius = false;
    var hasShape = false;
    var hasStrokeWidth = false;

    List<int>? chartsDashPattern;
    if (dashPattern is String) {
      try {
        dashPattern = json.decode(dashPattern);
      } catch (e) {
        // no-op
      }
    }
    if (dashPattern is List) {
      chartsDashPattern =
          dashPattern.map((e) => JsonClass.parseInt(e)!).toList();
    }

    if (items is Map) {
      items = items.values;
    }
    if (items is Iterable) {
      domain ??= r'$.x';
      itemColor ??= r'$.color';
      itemDomainLowerBound ??= r'$.xLowerBound';
      itemDomainUpperBound ??= r'$.xUpperBound';
      itemFillColor ??= r'$.fillColor';
      itemLabel ??= r'$.label';
      itemMeasureLowerBound ??= r'$.yLowerBound';
      itemMeasureUpperBound ??= r'$.yUpperBound';
      itemRadius ??= r'$.radius';
      itemShape ??= r'$.shape';
      itemStrokeWidth ??= r'$.strokeWidth';
      measure ??= r'$.y';

      final colorPath = JsonPath(itemColor);
      final domainLowerBoundPath = JsonPath(itemDomainLowerBound);
      final domainPath = JsonPath(domain);
      final domainUpperBoundPath = JsonPath(itemDomainUpperBound);
      final fillColorPath = JsonPath(itemFillColor);
      final labelPath = JsonPath(itemLabel);
      final measureLowerBoundPath = JsonPath(itemMeasureLowerBound);
      final measurePath = JsonPath(measure);
      final measureUpperBoundPath = JsonPath(itemMeasureUpperBound);
      final radiusPath = JsonPath(itemRadius);
      final shapePath = JsonPath(itemShape);
      final strokeWidthPath = JsonPath(itemStrokeWidth);
      for (var point in items) {
        final dRead = domainPath.read(point);
        if (dRead.isEmpty) {
          throw Exception(
            'No domain entry found for point: [$point] inside items: [$items]',
          );
        }
        final d = domainParser(dRead.first.value);

        final dlbRead = domainLowerBoundPath.read(point);
        final dlb = dlbRead.isEmpty ? null : domainParser(dlbRead.first.value);

        final dubRead = domainUpperBoundPath.read(point);
        final dub = dubRead.isEmpty ? null : domainParser(dubRead.first.value);

        final labels = labelPath.read(point);
        final l = labels.isNotEmpty ? labels.first.value : null;

        final colors = colorPath.read(point);
        final c = colors.isNotEmpty
            ? JsonChartsDecoder.decodeColor(colors.first.value)
            : null;

        final fillColors = fillColorPath.read(point);
        final fc = fillColors.isNotEmpty
            ? JsonChartsDecoder.decodeColor(fillColors.first.value)
            : null;

        final mlbRead = measureLowerBoundPath.read(point);
        final mlb =
            mlbRead.isEmpty ? null : JsonClass.parseDouble(mlbRead.first.value);

        final mubRead = measureUpperBoundPath.read(point);
        final mub =
            mubRead.isEmpty ? null : JsonClass.parseDouble(mubRead.first.value);

        final radii = radiusPath.read(point);
        final r =
            radii.isNotEmpty ? JsonClass.parseDouble(radii.first.value) : null;

        final shapes = shapePath.read(point);
        final s = shapes.isNotEmpty ? shapes.first.value : null;

        final strokeWidths = strokeWidthPath.read(point);
        final sw = strokeWidths.isNotEmpty
            ? JsonClass.parseDouble(strokeWidths.first.value)
            : null;

        hasColor = hasColor || c != null;
        hasDomainLowerBound = hasDomainLowerBound || dlb != null;
        hasDomainUpperBound = hasDomainUpperBound || dub != null;
        hasFillColor = hasFillColor || fc != null;
        hasLabels = hasLabels || l != null;
        hasMeasureLowerBound = hasMeasureLowerBound || mlb != null;
        hasMeasureUpperBound = hasMeasureLowerBound || mub != null;
        hasRadius = hasRadius || r != null;
        hasShape = hasShape || s != null;
        hasStrokeWidth = hasStrokeWidth || sw != null;

        final mRead = measurePath.read(point);
        final m =
            mRead.isEmpty ? null : JsonClass.parseDouble(mRead.first.value);
        data.add(ChartPoint<D>(
          color: c,
          domain: d,
          domainLowerBound: dlb,
          domainUpperBound: dub,
          fillColor: fc,
          label: l,
          measure: m,
          measureLowerBound: mlb,
          measureUpperBound: mub,
          radius: r,
          shape: s,
          strokeWidth: sw,
        ));
      }
    }

    final result = Series<ChartPoint<D>, D>(
      areaColorFn: areaChartsColor == null ? null : (_, __) => areaChartsColor,
      colorFn: hasColor
          ? (point, _) =>
              point.color ?? chartsColor ?? MaterialPalette.blue.shadeDefault
          : chartsColor == null
              ? null
              : (_, __) => chartsColor,
      dashPatternFn:
          chartsDashPattern == null ? null : (_, __) => chartsDashPattern,
      data: data,
      displayName: name,
      domainLowerBoundFn: hasDomainLowerBound
          ? (point, _) => point.domainLowerBound
          : domainLowerBoundFn,
      domainFn: (point, index) => point.domain,
      domainUpperBoundFn: hasDomainUpperBound
          ? (point, _) => point.domainUpperBound
          : domainUpperBoundFn,
      fillColorFn: hasFillColor
          ? (point, _) => point.fillColor ?? chartsFillColor
          : chartsFillColor == null
              ? null
              : (_, __) => chartsFillColor,
      fillPatternFn: fillPattern == null ? null : (_, __) => fillPattern,
      id: id ?? name,
      labelAccessorFn:
          hasLabels ? (point, index) => point.label ?? '<n/a>' : null,
      measureFn: (point, index) => point.measure,
      measureLowerBoundFn: hasMeasureLowerBound
          ? (point, _) => point.measureLowerBound
          : measureLowerBoundFn,
      measureUpperBoundFn: hasMeasureUpperBound
          ? (point, _) => point.measureUpperBound
          : measureUpperBoundFn,
      radiusPxFn: hasRadius ? (point, _) => point.radius ?? 3.0 : null,
      seriesCategory: seriesCategory,
      strokeWidthPxFn: hasStrokeWidth ? (point, _) => point.strokeWidth : null,
    );

    if (hasShape) {
      result.setAttribute(
        pointSymbolRendererFnKey,
        (index) => data[index].shape!,
      );
    }

    return result;
  }
}
