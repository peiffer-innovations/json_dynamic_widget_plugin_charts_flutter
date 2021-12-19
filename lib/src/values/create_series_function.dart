import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_path/json_path.dart';
import 'package:json_theme/json_theme.dart';
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

    var values = <String, dynamic>{};
    var domainType = String;
    for (var arg in args) {
      if (arg == null) {
        continue;
      }
      if (arg is NamedFunctionArg) {
        values[arg.name] = arg.value;
      } else {
        List<String> parts;
        try {
          parts = arg.split(':');
        } catch (e) {
          rethrow;
        }

        var key = parts[0];
        dynamic value = parts.skip(1).join(':');
        _logger.finest('[$key] = [$value]');
        value = registry.processDynamicArgs(value).values;

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
      }
    }

    dynamic series;
    switch (domainType) {
      case DateTime:
        series = createSeries<DateTime>(
          category: values['category'],
          color: values['color'],
          domain: values['domain'],
          domainLowerBound: values['domainLowerBound'],
          domainParser: (value) => JsonClass.parseDateTime(value)!,
          domainUpperBound: values['domainUpperBound'],
          fillColor: values['fillColor'],
          fillPattern: JsonChartsDecoder.decodeFillPatternType(
            values['fillPattern'],
          ),
          id: values['id'],
          items: values['items'],
          label: values['label'],
          measure: values['measure'],
          measureLowerBoundFn: values['measureLowerBoundFn'],
          measureUpperBoundFn: values['measureUpperBoundFn'],
          name: values['name'],
          registry: registry,
        );
        break;

      case int:
        series = createSeries<int>(
          category: values['category'],
          color: values['color'],
          domain: values['domain'],
          domainLowerBound: values['domainLowerBound'],
          domainParser: (value) => JsonClass.parseInt(value) ?? 0,
          domainUpperBound: values['domainUpperBound'],
          fillColor: values['fillColor'],
          fillPattern: JsonChartsDecoder.decodeFillPatternType(
            values['fillPattern'],
          ),
          id: values['id'],
          items: values['items'],
          label: values['label'],
          measure: values['measure'],
          measureLowerBoundFn: values['measureLowerBoundFn'],
          measureUpperBoundFn: values['measureUpperBoundFn'],
          name: values['name'],
          registry: registry,
        );
        break;

      case double:
        series = createSeries<double>(
          category: values['category'],
          color: values['color'],
          domain: values['domain'],
          domainLowerBound: values['domainLowerBound'],
          domainParser: (value) => JsonClass.parseDouble(value) ?? 0.0,
          domainUpperBound: values['domainUpperBound'],
          fillColor: values['fillColor'],
          fillPattern: JsonChartsDecoder.decodeFillPatternType(
            values['fillPattern'],
          ),
          id: values['id'],
          items: values['items'],
          label: values['label'],
          measure: values['measure'],
          measureLowerBoundFn: values['measureLowerBoundFn'],
          measureUpperBoundFn: values['measureUpperBoundFn'],
          name: values['name'],
          registry: registry,
        );
        break;

      default:
        series = createSeries<String>(
          category: values['category'],
          color: values['color'],
          domain: values['domain'],
          domainLowerBound: values['domainLowerBound'],
          domainParser: ((value) => value?.toString() ?? ''),
          domainUpperBound: values['domainUpperBound'],
          fillColor: values['fillColor'],
          fillPattern: JsonChartsDecoder.decodeFillPatternType(
            values['fillPattern'],
          ),
          id: values['id'],
          items: values['items'],
          label: values['label'],
          measure: values['measure'],
          measureLowerBoundFn: values['measureLowerBoundFn'],
          measureUpperBoundFn: values['measureUpperBoundFn'],
          name: values['name'],
          registry: registry,
        );
        break;
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

    return series;
  };

  static Series<ChartPoint<D>, D> createSeries<D>({
    String? category,
    dynamic color,
    String? domain,
    String? domainLowerBound,
    required dynamic Function(dynamic value) domainParser,
    String? domainUpperBound,
    dynamic fillColor,
    FillPatternType? fillPattern,
    String? id,
    dynamic items,
    String? label,
    String? measure,
    TypedAccessorFn<ChartPoint<D>, num?>? measureLowerBoundFn,
    TypedAccessorFn<ChartPoint<D>, num?>? measureUpperBoundFn,
    required String name,
    required JsonWidgetRegistry registry,
  }) {
    if (items is String) {
      items = json.decode(items);
    }

    Color? chartsColor;
    if (color is Color) {
      chartsColor = color;
    } else {
      var mColor = ThemeDecoder.decodeColor(color);

      if (mColor != null) {
        chartsColor = JsonChartsDecoder.fromColor(mColor);
      }
    }

    Color? chartsFillColor;
    if (fillColor is Color) {
      chartsFillColor = fillColor;
    } else {
      var mFillColor = ThemeDecoder.decodeColor(fillColor);
      if (mFillColor != null) {
        chartsFillColor = JsonChartsDecoder.fromColor(mFillColor);
      }
    }

    var data = <ChartPoint<D>>[];
    var hasDomainLowerBound = false;
    var hasDomainUpperBound = false;
    var hasLabels = false;

    if (items is Map) {
      items = items.values;
    }
    if (items is Iterable) {
      domainLowerBound ??= r'$.xLowerBound';
      domainUpperBound ??= r'$.xUpperBound';
      domain ??= r'$.x';
      label ??= r'$.label';
      measure ??= r'$.y';

      var domainLowerBoundPath = JsonPath(domainLowerBound);
      var domainPath = JsonPath(domain);
      var domainUpperBoundPath = JsonPath(domainUpperBound);
      var labelPath = JsonPath(label);
      var measurePath = JsonPath(measure);
      for (var point in items) {
        var dRead = domainPath.read(point);
        if (dRead.isEmpty) {
          throw Exception(
            'No domain entry found for point: [$point] inside items: [$items]',
          );
        }
        var d = domainParser(dRead.first.value);

        var dlbRead = domainLowerBoundPath.read(point);
        var dlb = dlbRead.isEmpty ? null : domainParser(dlbRead.first.value);

        var dubRead = domainUpperBoundPath.read(point);
        var dub = dubRead.isEmpty ? null : domainParser(dubRead.first.value);
        var labels = labelPath.read(point);
        var l = labels.isNotEmpty ? labels.first.value : null;

        hasDomainLowerBound = hasDomainLowerBound || dlb != null;
        hasDomainUpperBound = hasDomainUpperBound || dub != null;
        hasLabels = hasLabels || l != null;

        var mRead = measurePath.read(point);
        var m =
            mRead.isEmpty ? null : JsonClass.parseDouble(mRead.first.value)!;
        data.add(ChartPoint<D>(
          domainLowerBound: dlb,
          domain: d,
          domainUpperBound: dub,
          label: l,
          measure: m,
        ));
      }
    }

    var result = Series<ChartPoint<D>, D>(
      seriesCategory: category,
      colorFn: chartsColor == null ? null : (_, __) => chartsColor!,
      data: data,
      displayName: name,
      domainLowerBoundFn:
          hasDomainLowerBound ? (point, _) => point.domainLowerBound : null,
      domainFn: (point, index) => point.domain,
      domainUpperBoundFn:
          hasDomainUpperBound ? (point, _) => point.domainUpperBound : null,
      fillColorFn: chartsFillColor == null ? null : (_, __) => chartsFillColor!,
      fillPatternFn: fillPattern == null ? null : (_, __) => fillPattern,
      id: id ?? name,
      labelAccessorFn: hasLabels ? (point, index) => point.label ?? '' : null,
      measureFn: (point, index) => point.measure,
      measureLowerBoundFn: measureLowerBoundFn,
      measureUpperBoundFn: measureUpperBoundFn,
    );

    return result;
  }
}
