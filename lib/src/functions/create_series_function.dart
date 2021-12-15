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
          case 'domainType':
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
          domainParser: (value) => JsonClass.parseDateTime(value)!,
          fillColor: values['fillColor'],
          fillPattern: JsonChartsDecoder.decodeFillPatternType(
            values['fillPattern'],
          ),
          id: values['id'],
          items: values['items'],
          label: values['label'],
          measure: values['measure'],
          name: values['name'],
          registry: registry,
        );
        break;

      case int:
        series = createSeries<int>(
          category: values['category'],
          color: values['color'],
          domain: values['domain'],
          domainParser: (value) => JsonClass.parseInt(value) ?? 0,
          fillColor: values['fillColor'],
          fillPattern: JsonChartsDecoder.decodeFillPatternType(
            values['fillPattern'],
          ),
          id: values['id'],
          items: values['items'],
          label: values['label'],
          measure: values['measure'],
          name: values['name'],
          registry: registry,
        );
        break;

      case double:
        series = createSeries<double>(
          category: values['category'],
          color: values['color'],
          domain: values['domain'],
          domainParser: (value) => JsonClass.parseDouble(value) ?? 0.0,
          fillColor: values['fillColor'],
          fillPattern: JsonChartsDecoder.decodeFillPatternType(
            values['fillPattern'],
          ),
          id: values['id'],
          items: values['items'],
          label: values['label'],
          measure: values['measure'],
          name: values['name'],
          registry: registry,
        );
        break;

      default:
        series = createSeries<String>(
          category: values['category'],
          color: values['color'],
          domain: values['domain'],
          domainParser: ((value) => value?.toString() ?? ''),
          fillColor: values['fillColor'],
          fillPattern: JsonChartsDecoder.decodeFillPatternType(
            values['fillPattern'],
          ),
          id: values['id'],
          items: values['items'],
          label: values['label'],
          measure: values['measure'],
          name: values['name'],
          registry: registry,
        );
        break;
    }

    if (values['rendererIdKey'] != id) {
      series.setAttribute(rendererIdKey, values['rendererIdKey']);
    }

    return series;
  };

  static Series<ChartPoint<D>, D> createSeries<D>({
    String? category,
    dynamic color,
    String? domain,
    required dynamic Function(dynamic value) domainParser,
    dynamic fillColor,
    FillPatternType? fillPattern,
    String? id,
    dynamic items,
    String? label,
    String? measure,
    required String name,
    required JsonWidgetRegistry registry,
  }) {
    if (items is String) {
      items = json.decode(items);
    }

    var mColor = ThemeDecoder.decodeColor(color);
    var mFillColor = ThemeDecoder.decodeColor(fillColor);

    Color? chartsColor;
    if (mColor != null) {
      chartsColor = JsonChartsDecoder.fromColor(mColor);
    }

    Color? chartsFillColor;
    if (mFillColor != null) {
      chartsFillColor = JsonChartsDecoder.fromColor(mFillColor);
    }

    var data = <ChartPoint<D>>[];
    var hasLabels = false;

    if (items is Map) {
      items = items.values;
    }
    if (items is Iterable) {
      domain ??= r'$.x';
      label ??= r'$.label';
      measure ??= r'$.y';

      var domainPath = JsonPath(domain);
      var labelPath = JsonPath(label);
      var measurePath = JsonPath(measure);
      for (var point in items) {
        var d = domainParser(domainPath.read(point).first.value);
        var labels = labelPath.read(point);
        var l = labels.isNotEmpty ? labels.first.value : null;

        hasLabels = hasLabels || l != null;

        var m = JsonClass.parseDouble(measurePath.read(point).first.value)!;
        data.add(ChartPoint<D>(
          domain: d,
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
      domainFn: (point, index) => point.domain,
      fillColorFn: chartsFillColor == null ? null : (_, __) => chartsFillColor!,
      fillPatternFn: fillPattern == null ? null : (_, __) => fillPattern,
      id: id ?? name,
      labelAccessorFn: hasLabels ? (point, index) => point.label ?? '' : null,
      measureFn: (point, index) => point.measure,
    );

    return result;
  }
}
