import 'dart:math';

import 'package:charts_common/common.dart' as common;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_theme/json_theme.dart';
import 'package:json_theme/json_theme_schemas.dart';

class JsonChartsDecoder {
  static const _baseSchemaUrl =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter';

  /// Expects the [map] to be either a [common.AnnotationLabelAnchor] or a
  /// [String] containing one of the following values:
  ///
  /// * `end`
  /// * `middle`
  /// * `start`
  static common.AnnotationLabelAnchor? decodeAnnotationLabelAnchor(
    dynamic map, {
    bool validate = true,
  }) {
    common.AnnotationLabelAnchor? result;

    if (map is common.AnnotationLabelAnchor) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/annotation_label_anchor',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'end':
          result = common.AnnotationLabelAnchor.end;
          break;

        case 'middle':
          result = common.AnnotationLabelAnchor.middle;
          break;

        case 'start':
          result = common.AnnotationLabelAnchor.start;
          break;

        default:
          throw Exception(
            '[decodeAnnotationLabelAnchor]: unknown value: [$map]',
          );
      }
    }

    return result;
  }

  /// Expects the [map] to be either a [common.AnnotationLabelDirection] or a
  /// [String] containing one of the following values:
  ///
  /// * `auto`
  /// * `horizontal`
  /// * `vertical`
  static common.AnnotationLabelDirection? decodeAnnotationLabelDirection(
    dynamic map, {
    bool validate = true,
  }) {
    common.AnnotationLabelDirection? result;

    if (map is common.AnnotationLabelDirection) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/annotation_label_direction',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'auto':
          result = common.AnnotationLabelDirection.auto;
          break;

        case 'horizontal':
          result = common.AnnotationLabelDirection.horizontal;
          break;

        case 'vertical':
          result = common.AnnotationLabelDirection.vertical;
          break;

        default:
          throw Exception(
            '[decodeAnnotationLabelDirection]: unknown value: [$map]',
          );
      }
    }

    return result;
  }

  /// Expects the [map] to be either a [common.AnnotationLabelPosition] or a
  /// [String] containing one of the following values:
  ///
  /// * `auto`
  /// * `horizontal`
  /// * `vertical`
  static common.AnnotationLabelPosition? decodeAnnotationLabelPosition(
    dynamic map, {
    bool validate = true,
  }) {
    common.AnnotationLabelPosition? result;

    if (map is common.AnnotationLabelPosition) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/annotation_label_position',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'auto':
          result = common.AnnotationLabelPosition.auto;
          break;

        case 'inside':
          result = common.AnnotationLabelPosition.inside;
          break;

        case 'margin':
          result = common.AnnotationLabelPosition.margin;
          break;

        case 'outside':
          result = common.AnnotationLabelPosition.outside;
          break;

        default:
          throw Exception(
            '[decodeAnnotationLabelPosition]: unknown value: [$map]',
          );
      }
    }

    return result;
    //result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be one of the following structures:
  ///
  /// ```json
  /// {
  ///   "axisId": <String>,
  ///   "axisType": <RangeAnnotationAxisType>,
  ///   "color": <Color>,
  ///   "dashPattern": <List<int>>,
  ///   "endLabel": <String>,
  ///   "labelAnchor": <AnnotationLabelAnchor>,
  ///   "labelDirection": <AnnotationLabelDirection>,
  ///   "labelPosition": <AnnotationLabelPosition>,
  ///   "labelStyleSpec": <TextStyleSpec>,
  ///   "middleLabel": <String>,
  ///   "startLabel": <String>,
  ///   "strokeWidthPx": <double>,
  ///   "type": "line_annotation",
  ///   "value": <T>
  /// }
  /// ```
  ///
  /// ... or ...
  ///
  /// ```json
  /// {
  ///   "axisId": <String>,
  ///   "axisType": <RangeAnnotationAxisType>,
  ///   "color": <Color>,
  ///   "endLabel": <String>,
  ///   "endValue": <T>,
  ///   "labelAnchor": <AnnotationLabelAnchor>,
  ///   "labelDirection": <AnnotationLabelDirection>,
  ///   "labelPosition": <AnnotationLabelPosition>,
  ///   "labelStyleSpec": <TextStyleSpec>,
  ///   "middleLabel": <String>,
  ///   "startLabel": <String>,
  ///   "startValue": <T>,
  ///   "strokeWidthPx": <double>,
  ///   "type": "range_annotation"
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeSymbolRenderer]
  static common.AnnotationSegment<Object>? decodeAnnotationSegment<T>(
    dynamic map, {
    bool validate = true,
  }) {
    common.AnnotationSegment<Object>? result;

    if (map is common.AnnotationSegment<Object>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/annotation_segment',
        value: map,
        validate: validate,
      ));

      var type = map['type'];
      var axisType = decodeRangeAnnotationAxisType(
        map['axisType'],
        validate: false,
      )!;

      switch (type) {
        case 'line_annotation':
          result = common.LineAnnotationSegment<Object>(
            axisType == common.RangeAnnotationAxisType.domain
                ? JsonClass.parseValue<T>(map['value'])
                : (JsonClass.parseDouble(map['value']) ?? 0.0),
            axisType,
            axisId: map['axisId']?.toString(),
            color: decodeColor(
              map['color'],
              validate: false,
            ),
            dashPattern: map['dashPattern'] == null
                ? null
                : map['dashPattern'].map((e) => JsonClass.parseInt(e)!),
            endLabel: map['endLabel']?.toString(),
            labelAnchor: decodeAnnotationLabelAnchor(
              map['labelAnchor'],
              validate: false,
            ),
            labelDirection: decodeAnnotationLabelDirection(
              map['labelDirection'],
              validate: false,
            ),
            labelPosition: decodeAnnotationLabelPosition(
              map['labelPosition'],
              validate: false,
            ),
            labelStyleSpec: decodeTextStyleSpec(
              map['labelStyleSpec'],
              validate: false,
            ),
            middleLabel: map['middleLabel']?.toString(),
            startLabel: map['startLabel']?.toString(),
            strokeWidthPx: JsonClass.parseDouble(map['strokeWidthPx']) ?? 2.0,
          );
          break;

        case 'range_annotation':
          result = common.RangeAnnotationSegment<Object>(
            axisType == common.RangeAnnotationAxisType.domain
                ? JsonClass.parseValue<T>(map['startValue'])
                : (JsonClass.parseDouble(map['startValue']) ?? 0.0),
            axisType == common.RangeAnnotationAxisType.domain
                ? JsonClass.parseValue<T>(map['endValue'])
                : (JsonClass.parseDouble(map['endValue']) ?? 0.0),
            axisType,
            axisId: map['axisId']?.toString(),
            color: decodeColor(
              map['color'],
              validate: false,
            ),
            endLabel: map['endLabel']?.toString(),
            labelAnchor: decodeAnnotationLabelAnchor(
              map['labelAnchor'],
              validate: false,
            ),
            labelDirection: decodeAnnotationLabelDirection(
              map['labelDirection'],
              validate: false,
            ),
            labelPosition: decodeAnnotationLabelPosition(
              map['labelPosition'],
              validate: false,
            ),
            labelStyleSpec: decodeTextStyleSpec(
              map['labelStyleSpec'],
              validate: false,
            ),
            middleLabel: map['middleLabel']?.toString(),
            startLabel: map['startLabel']?.toString(),
          );
          break;

        default:
          throw Exception('[AnnotationSegment.type]: unknown type: [$type]');
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "arcLength": <double>,
  ///   "arcRatio": <double>,
  ///   "arcRendererDecorators": <ArcRendererDecoder>,
  ///   "arcWidth": <int>,
  ///   "customRendererId": <String>,
  ///   "layoutPaintOrder": <int>,
  ///   "minHoleWidthForCenterContent": <double>,
  ///   "startAngle": <double>,
  ///   "strokeWidthPx": <double>,
  ///   "symbolRenderer": <SymbolRenderer>
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeSymbolRenderer]
  static charts.ArcRendererConfig<D>? decodeArcRendererConfig<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.ArcRendererConfig<D>? result;

    if (map is charts.ArcRendererConfig<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/arc_renderer_config',
        value: map,
        validate: validate,
      ));

      result = charts.ArcRendererConfig<D>(
        arcLength: JsonClass.parseDouble(map['arcLength']) ?? (2 * pi),
        arcRatio: JsonClass.parseDouble(map['arcRatio']),
        arcRendererDecorators: map['arcRendererDecoders'],
        arcWidth: JsonClass.parseInt(map['arcWidth']),
        customRendererId: map['customRendererId'],
        layoutPaintOrder: JsonClass.parseInt(map['layoutPaintOrder']) ??
            charts.LayoutViewPaintOrder.arc,
        minHoleWidthForCenterContent:
            JsonClass.parseInt(map['minHoleWidthForCenterContent']) ?? 30,
        startAngle: JsonClass.parseDouble(map['startAngle']) ?? -pi / 2,
        strokeWidthPx: JsonClass.parseDouble(map['strokeWidthPx']) ?? 2.0,
        symbolRenderer: decodeSymbolRenderer(
          map['symbolRenderer'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Expects the [map] to be either a [charts.AxisDirection] or a [String]
  /// containing one of the following values:
  ///
  /// * `normal`
  /// * `reversed`
  static charts.AxisDirection? decodeAxisDirection(
    dynamic map, {
    bool validate = true,
  }) {
    charts.AxisDirection? result;

    if (map is charts.AxisDirection) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/axis_direction',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'normal':
          result = charts.AxisDirection.normal;
          break;
        case 'reversed':
          result = charts.AxisDirection.reversed;
          break;
        default:
          throw Exception('Unknown [AxisDirection] encountered: [$map]');
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "renderSpec": <RenderSpec>,
  ///   "scaleSpec": <ScaleSpec>,
  ///   "showAxisLine": <bool>,
  ///   "tickFormatterSpec": <TickFormatterSpec>,
  ///   "tickProviderSpec": <TickProviderSpec>
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeEndPointsTimeAxisSpec]
  /// * [decodeNumericAxisSpec]x
  /// * [decodeOrdinalAxisSpec]
  static charts.AxisSpec? decodeAxisSpec(
    dynamic map, {
    bool validate = true,
  }) {
    charts.AxisSpec? result;

    if (map is charts.AxisSpec) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/axis_spec',
        value: map,
        validate: validate,
      ));

      var type = map['type'];

      switch (type) {
        case 'end_points_time':
          result = decodeEndPointsTimeAxisSpec(map);
          break;

        case 'numeric':
          result = decodeNumericAxisSpec(map);
          break;

        case 'ordinal':
          result = decodeOrdinalAxisSpec(map);
          break;

        default:
          result = charts.AxisSpec(
            renderSpec: decodeRenderSpec(
              map['renderSpec'],
              validate: false,
            ),
            scaleSpec: map['scaleSpec'],
            showAxisLine: map['showAxisLine'] == null
                ? null
                : JsonClass.parseBool(map['showAxisLine']),
            tickFormatterSpec: map['tickFormatterSpec'],
            tickProviderSpec: map['tickProviderSpec'],
          );
      }
    }

    return result;
  }

  /// Expects the [map] to be either a [charts.BarGroupingType] or a [String]
  /// containing one of the following values:
  ///
  /// * `grouped`
  /// * `groupedStacked`
  /// * `stacked`
  static common.BarGroupingType? decodeBarGroupingType(
    dynamic map, {
    bool validate = true,
  }) {
    common.BarGroupingType? result;

    if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/bar_grouping_type',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'grouped':
          result = common.BarGroupingType.grouped;
          break;

        case 'groupedStacked':
          result = common.BarGroupingType.groupedStacked;
          break;

        case 'stacked':
          result = common.BarGroupingType.stacked;
          break;

        default:
          throw Exception('Unknown [BarGroupingType] encountered: [$map]');
      }
    }

    return result;
  }

  /// Expects the [map] to be either a [charts.BarLabelAnchor] or a [String]
  /// containing one of the following values:
  ///
  /// * `end`
  /// * `middle`
  /// * `start`
  static charts.BarLabelAnchor? decodeBarLabelAnchor(
    dynamic map, {
    bool validate = true,
  }) {
    charts.BarLabelAnchor? result;

    if (map is charts.BarLabelAnchor) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/bar_label_anchor',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'end':
          result = charts.BarLabelAnchor.end;
          break;

        case 'middle':
          result = charts.BarLabelAnchor.middle;
          break;

        case 'start':
          result = charts.BarLabelAnchor.start;
          break;

        default:
          throw Exception('Unknown [BarLabelAnchor] encountered: [$map]');
      }
    }

    return result;
  }

  /// Expects the [map] to be either a [common.BarLabelPlacement] or a [String]
  /// containing one of the following values:
  ///
  /// * `followMeasureAxis`
  /// * `opposeAxisBaseline`
  static common.BarLabelPlacement? decodeBarLabelPlacement(
    dynamic map, {
    bool validate = true,
  }) {
    common.BarLabelPlacement? result;

    if (map is common.BarLabelPlacement) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/bar_label_placement',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'followMeasureAxis':
          result = common.BarLabelPlacement.followMeasureAxis;
          break;

        case 'opposeAxisBaseline':
          result = common.BarLabelPlacement.opposeAxisBaseline;
          break;

        default:
          throw Exception('Unknown [BarLabelPlacement] encountered: [$map]');
      }
    }

    return result;
  }

  /// Expects the [map] to be either a [common.BarLabelPosition] or a [String]
  /// containing one of the following values:
  ///
  /// * `auto`
  /// * `inside`
  /// * `outside`
  /// * `right`
  static common.BarLabelPosition? decodeBarLabelPosition(
    dynamic map, {
    bool validate = true,
  }) {
    common.BarLabelPosition? result;

    if (map is common.BarLabelPosition) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/bar_label_position',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'auto':
          result = common.BarLabelPosition.auto;
          break;

        case 'inside':
          result = common.BarLabelPosition.inside;
          break;

        case 'outside':
          result = common.BarLabelPosition.outside;
          break;

        case 'right':
          result = common.BarLabelPosition.right;
          break;

        default:
          throw Exception('Unknown [BarLabelPosition] encountered: [$map]');
      }
    }

    return result;
  }

  /// Expects the [map] to be either a [common.BarLabelVerticalPosition] or a
  /// [String] containing one of the following values:
  ///
  /// * `middle`
  /// * `top`
  static common.BarLabelVerticalPosition? decodeBarLabelVerticalPosition(
    dynamic map, {
    bool validate = true,
  }) {
    common.BarLabelVerticalPosition? result;

    if (map is common.BarLabelVerticalPosition) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/bar_label_vertical_position',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'middle':
          result = common.BarLabelVerticalPosition.middle;
          break;

        case 'top':
          result = common.BarLabelVerticalPosition.top;
          break;

        default:
          throw Exception(
            'Unknown [BarLabelVerticalPosition] encountered: [$map]',
          );
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be one of the following structures:
  ///
  /// ```json
  /// {
  ///   "barGroupInnerPaddingPx": <int>,
  ///   "barRendererDecorator": <BarRendererDecorator>,
  ///   "cornerStrategy": <CornerStrategy>,
  ///   "customRendererId": <String>,
  ///   "fillPattern": <FillPatternType>,
  ///   "groupingType": <BarGroupingType>,
  ///   "layoutPaintOrder": <int>,
  ///   "maxBarWidthPx": <int>,
  ///   "minBarLengthPx": <int>,
  ///   "stackedBarPaddingPx": <int>,
  ///   "strokeWidthPx": <double>,
  ///   "symbolRenderer": <SymbolRenderer>,
  ///   "weightPattern": <List<int>>
  /// }
  /// ```
  ///
  /// Type: "target_line"
  /// ```json
  /// {
  ///   "barGroupInnerPaddingPx": <int>,
  ///   "customRendererId": <String>,
  ///   "dashPattern": <List<int>>,
  ///   "groupingType": <BarGroupingType>,
  ///   "layoutPaintOrder": <int>,
  ///   "minBarLengthPx": <int>,
  ///   "overDrawOuterPx": <int>,
  ///   "overDrawPx": <int>,
  ///   "roundEndCaps": <double>,
  ///   "strokeWidthPx": <double>,
  ///   "symbolRenderer": <SymbolRenderer>,
  ///   "type": "target_line",
  ///   "weightPattern": <List<int>>
  /// }
  /// ```
  /// See also:
  /// * [decodeBarGroupingType]
  /// * [decodeBarTargetLineRendererConfig]
  /// * [decodeCornerStrategy]
  /// * [decodeFillPatternType]
  /// * [decodeSymbolRenderer]
  static common.BaseBarRendererConfig<D>? decodeBarRendererConfig<D>(
    dynamic map, {
    bool validate = true,
  }) {
    common.BaseBarRendererConfig<D>? result;

    if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/bar_renderer_config',
        value: map,
        validate: validate,
      ));
      var type = map['type'];

      switch (type) {
        case 'bar_target_line':
        case 'target_line':
          result = decodeBarTargetLineRendererConfig<D>(
            map,
            validate: false,
          );
          break;

        default:
          result = charts.BarRendererConfig<D>(
            barGroupInnerPaddingPx: JsonClass.parseInt(
                  map['barGroupInnerPaddingPx'],
                ) ??
                2,
            barRendererDecorator: map['barRendererDecorator'],
            cornerStrategy: decodeCornerStrategy(
              map['cornerStrategy'],
              validate: false,
            ),
            customRendererId: map['customRendererId']?.toString(),
            fillPattern: decodeFillPatternType(
              map['fillPattern'],
              validate: false,
            ),
            groupingType: decodeBarGroupingType(
              map['groupingType'],
              validate: false,
            ),
            layoutPaintOrder: JsonClass.parseInt(map['layoutPaintOrder']) ??
                charts.LayoutViewPaintOrder.bar,
            maxBarWidthPx: JsonClass.parseInt(map['maxBarWidthPx']),
            minBarLengthPx: JsonClass.parseInt(map['minBarLengthPx']) ?? 0,
            stackedBarPaddingPx: JsonClass.parseInt(
                  map['stackedBarPaddingPx'],
                ) ??
                1,
            strokeWidthPx: JsonClass.parseDouble(map['strokeWidthPx']) ?? 0.0,
            symbolRenderer: decodeSymbolRenderer(
              map['symbolRenderer'],
              validate: false,
            ),
            weightPattern: map['weightPattern'] == null
                ? null
                : ((map['weightPattern'] as List)
                    .map((e) => JsonClass.parseInt(e)!)).toList(),
          );
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be in the following structures:
  ///
  /// ```json
  /// {
  ///   "barGroupInnerPaddingPx": <int>,
  ///   "customRendererId": <String>,
  ///   "dashPattern": <List<int>>,
  ///   "groupingType": <BarGroupingType>,
  ///   "layoutPaintOrder": <int>,
  ///   "minBarLengthPx": <int>,
  ///   "overDrawOuterPx": <int>,
  ///   "overDrawPx": <int>,
  ///   "roundEndCaps": <double>,
  ///   "strokeWidthPx": <double>,
  ///   "symbolRenderer": <SymbolRenderer>,
  ///   "weightPattern": <List<int>>
  /// }
  /// ```
  /// See also:
  /// * [decodeBarGroupingType]
  /// * [decodeSymbolRenderer]
  static common.BarTargetLineRendererConfig<D>?
      decodeBarTargetLineRendererConfig<D>(
    dynamic map, {
    bool validate = true,
  }) {
    common.BarTargetLineRendererConfig<D>? result;

    if (map is common.BarTargetLineRendererConfig<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/bar_target_line_renderer_config',
        value: map,
        validate: validate,
      ));
      result = charts.BarTargetLineRendererConfig<D>(
        barGroupInnerPaddingPx: JsonClass.parseInt(
              map['barGroupInnerPaddingPx'],
            ) ??
            2,
        customRendererId: map['customRendererId']?.toString(),
        dashPattern: map['dashPattern'] == null
            ? null
            : map['dashPattern'].map((e) => JsonClass.parseInt(e)!),
        groupingType: decodeBarGroupingType(map['groupingType']) ??
            charts.BarGroupingType.grouped,
        layoutPaintOrder: JsonClass.parseInt(map['layoutPaintOrder']) ??
            charts.LayoutViewPaintOrder.bar,
        minBarLengthPx: JsonClass.parseInt(map['minBarLengthPx']) ?? 0,
        overDrawOuterPx: JsonClass.parseInt(map['overDrawOuterPx']),
        overDrawPx: JsonClass.parseInt(map['overDrawPx']) ?? 0,
        roundEndCaps: map['roundEndCaps'] == null
            ? true
            : JsonClass.parseBool(map['roundEndCaps']),
        strokeWidthPx: JsonClass.parseDouble(map['strokeWidthPx']) ?? 3.0,
        symbolRenderer: decodeSymbolRenderer(
          map['symbolRenderer'],
          validate: false,
        ),
        weightPattern: map['weightPattern'] == null
            ? null
            : ((map['weightPattern'] as List)
                .map((e) => JsonClass.parseInt(e)!)).toList(),
      );
    }

    return result;
  }

  static List<common.BaseBarRendererConfig<D>>? decodeBarRendererConfigList<D>(
    dynamic map, {
    bool validate = true,
  }) {
    List<common.BaseBarRendererConfig<D>>? result;

    if (map is List<common.BaseBarRendererConfig<D>>) {
      result = map;
    } else if (map is Iterable) {
      result = [];
      for (var item in map) {
        result.add(decodeBarRendererConfig<D>(
          item,
          validate: false,
        )!);
      }
    } else if (map != null) {
      result = [decodeBarRendererConfig<D>(map, validate: false)!];
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "insideLabelStyleSpec": <TextStyleSpec>,
  ///   "labelAnchor": <BarLabelAnchor>,
  ///   "labelPlacement": <BarLabelPlacement>,
  ///   "labelPosition": <BarLabelPosition>,
  ///   "labelVerticalPosition": <BarLabelVerticalPosition>,
  ///   "outsideLabelStyleSpec": <TextStyleSpec>
  /// }
  /// ```
  ///
  /// See also
  /// * [decodeBarLabelAnchor]
  /// * [decodeBarLabelPlacement]
  /// * [decodeBarLabelPosition]
  /// * [decodeBarLabelVerticalPosition]
  /// * [decodeTextStyleSpec]
  static common.BarRendererDecorator<T>? decodeBarRendererDecorator<T>(
    dynamic map, {
    bool validate = true,
  }) {
    common.BarRendererDecorator<T>? result;

    if (map is common.BarRendererDecorator<T>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/bar_renderer_decorator',
        value: map,
        validate: validate,
      ));
      var type = map['type'];

      switch (type) {
        case 'label':
          result = charts.BarLabelDecorator<T>(
            insideLabelStyleSpec: decodeTextStyleSpec(
                  map['insideLabelStyleSpec'],
                  validate: false,
                ) ??
                common.TextStyleSpec(fontSize: 12, color: common.Color.white),
            labelAnchor: decodeBarLabelAnchor(
              map['labelAnchor'],
              validate: false,
            ),
            labelPadding: JsonClass.parseInt(map['labelPadding']) ?? 5,
            labelPlacement: decodeBarLabelPlacement(
                  map['labelPlacement'],
                  validate: false,
                ) ??
                common.BarLabelPlacement.followMeasureAxis,
            labelPosition: decodeBarLabelPosition(
                  map['labelPosition'],
                  validate: false,
                ) ??
                common.BarLabelPosition.auto,
            labelVerticalPosition: decodeBarLabelVerticalPosition(
                  map['labelVerticalPosition'],
                  validate: false,
                ) ??
                common.BarLabelVerticalPosition.middle,
            outsideLabelStyleSpec: decodeTextStyleSpec(
                  map['outsideLabelStyleSpec'],
                  validate: false,
                ) ??
                common.TextStyleSpec(fontSize: 12, color: common.Color.black),
          );
          break;

        default:
          throw Exception(
            '[decodeBarRendererDecorator]: unknown type: [$type]',
          );
      }
    }

    return result;
  }

  /// Decodes a dynamic value to an appropriate [charts.ChartBehavior].
  /// Which renderer is used is determined by the "type", and the schema is then
  /// specific to that type.  The following types are supported:
  ///
  /// * "domain_highlighter": [decodeDomainHighlighter]
  /// * "range_annotation": [decodeRangeAnnotation]
  /// * "select_nearest": [decodeSelectNearest]
  static charts.ChartBehavior<D>? decodeChartBehavior<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.ChartBehavior<D>? result;

    if (map is charts.ChartBehavior<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/chart_behavior',
        value: map,
        validate: validate,
      ));

      var type = map['type'];

      switch (type) {
        case 'domain_highlighter':
          result = decodeDomainHighlighter<D>(
            map,
            validate: false,
          );
          break;

        case 'range_annotation':
          result = decodeRangeAnnotation<D>(
            map,
            validate: false,
          );
          break;

        case 'select_nearest':
          result = decodeSelectNearest<D>(
            map,
            validate: false,
          );
          break;

        default:
          throw Exception(
            '[ChartBehavior.type]: unknown type: [$type]',
          );
      }
    }

    return result;
  }

  static List<charts.ChartBehavior<T>>? decodeChartBehaviorList<T>(
    dynamic map, {
    bool validate = true,
  }) {
    List<charts.ChartBehavior<T>>? result;

    if (map is List<charts.ChartBehavior<T>>) {
      result = map;
    } else if (map is charts.ChartBehavior<T>) {
      result = [map];
    } else if (map is Map) {
      result = [
        decodeChartBehavior<T>(
          map,
          validate: false,
        )!
      ];
    } else if (map != null) {
      result = [];

      for (var item in map) {
        result.add(decodeChartBehavior<T>(
          item,
          validate: false,
        )!);
      }
    }

    return result;
  }

  /// Expects the [map] to be either a [common.Color], a [Color], or a [String]
  /// containing the hex value of the color to use.
  static common.Color? decodeColor(
    dynamic map, {
    bool validate = true,
  }) {
    common.Color? result;

    if (map is charts.Color) {
      result = map;
    } else if (map is Color) {
      result = fromColor(map);
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId:
            'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_theme/color',
        value: map,
        validate: validate,
      ));
      result = fromColor(ThemeDecoder.decodeColor(
        map,
        validate: false,
      )!);
    }

    return result;
  }

  /// Decodes the object from an [int] or Map-like dynamic structure.  This
  /// expects the JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "type": "none"
  /// }
  /// ```
  ///
  /// ```json
  /// {
  ///   "radius": <int>,
  ///   "type": "const"
  /// }
  /// ```
  static charts.CornerStrategy? decodeCornerStrategy(
    dynamic map, {
    bool validate = true,
  }) {
    charts.CornerStrategy? result;

    if (map is charts.CornerStrategy) {
      result = map;
    } else if (map is num) {
      result = charts.ConstCornerStrategy(map.toInt());
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/corner_strategy',
        value: map,
        validate: validate,
      ));
      var type = map['type'];

      switch (type) {
        case 'const':
          result =
              charts.ConstCornerStrategy(JsonClass.parseInt(map['radius'])!);
          break;

        case 'none':
          result = charts.NoCornerStrategy();
          break;

        default:
          throw Exception('Unknown [CornerStrategy.type] encountered: [$type]');
      }
    }

    return result;
  }

  /// Expects the [map] to be either a [common.DateTimeFactory] or a [String]
  /// containing one of the following values:
  ///
  /// * `local`
  /// * `utc`
  static common.DateTimeFactory? decodeDateTimeFactory(
    dynamic map, {
    bool validate = false,
  }) {
    common.DateTimeFactory? result;

    if (map is common.DateTimeFactory) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/date_time_factory',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'local':
          result = common.LocalDateTimeFactory();
          break;

        case 'utc':
          result = common.UTCDateTimeFactory();
          break;

        default:
          throw Exception('Unknown [DateTimeFactory] encountered: [$map]');
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "selectionModelType": <SelectionModelType>
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeSelectionModelType]
  static charts.DomainHighlighter<D>? decodeDomainHighlighter<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.DomainHighlighter<D>? result;

    if (map is charts.DomainHighlighter<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/domain_highlighter',
        value: map,
        validate: validate,
      ));
      result = charts.DomainHighlighter<D>(
        decodeSelectionModelType(map['selectionModelType']) ??
            common.SelectionModelType.info,
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "renderSpec": <RenderSpec<DateTime>>,
  ///   "showAxisLine": <bool>,
  ///   "tickFormatterSpec": <DateTimeTickFormatterSpec>,
  ///   "tickProviderSpec": <DateTimeTickProviderSpec>,
  ///   "viewport": <DateTimeExtents>
  /// }
  /// ```
  static charts.EndPointsTimeAxisSpec? decodeEndPointsTimeAxisSpec(
    dynamic map, {
    bool validate = true,
  }) {
    charts.EndPointsTimeAxisSpec? result;

    if (map is charts.EndPointsTimeAxisSpec) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/end_points_time_axis_spec',
        value: map,
        validate: validate,
      ));
      result = charts.EndPointsTimeAxisSpec(
        renderSpec: decodeRenderSpec<DateTime>(
          map['renderSpec'],
          validate: false,
        ),
        showAxisLine: map['showAxisLine'] == null
            ? null
            : JsonClass.parseBool(map['showAxisLine']),
        tickFormatterSpec: map['tickFormatterSpec'],
        tickProviderSpec: map['tickProviderSpec'],
        viewport: map['viewport'],
      );
    }

    return result;
  }

  /// Expects the [map] to be either a [charts.BarGroupingType] or a [String]
  /// containing one of the following values:
  ///
  /// * `forwardHatch`
  /// * `solid`
  static charts.FillPatternType? decodeFillPatternType(
    dynamic map, {
    bool validate = true,
  }) {
    charts.FillPatternType? result;

    if (map is charts.FillPatternType) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/fill_pattern_type',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'forwardHatch':
          result = charts.FillPatternType.forwardHatch;
          break;

        case 'solid':
          result = charts.FillPatternType.solid;
          break;

        default:
          throw Exception('Unknown [FillPatternType] encountered: [$map]');
      }
    }

    return result;
  }

  /// Decodes the object from an [int] or Map-like dynamic structure.  This
  /// expects the JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "bottomMarginSpec": <MarginSpec>,
  ///   "leftMarginSpec": <MarginSpec>,
  ///   "rightMarginSpec": <MarginSpec>,
  ///   "topMarginSpec": <MarginSpec>
  /// }
  /// ```
  static charts.LayoutConfig? decodeLayoutConfig(
    dynamic map, {
    bool validate = true,
  }) {
    charts.LayoutConfig? result;

    if (map is charts.LayoutConfig) {
      result = map;
    } else if ((map is num || map is String) &&
        JsonClass.parseInt(map) != null) {
      result = charts.LayoutConfig(
        bottomMarginSpec: decodeMarginSpec(
          map,
          validate: false,
        )!,
        leftMarginSpec: decodeMarginSpec(
          map,
          validate: false,
        )!,
        rightMarginSpec: decodeMarginSpec(
          map,
          validate: false,
        )!,
        topMarginSpec: decodeMarginSpec(
          map,
          validate: false,
        )!,
      );
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/layout_config',
        value: map,
        validate: validate,
      ));
      result = charts.LayoutConfig(
        bottomMarginSpec: decodeMarginSpec(
              map['bottomMarginSpec'],
              validate: false,
            ) ??
            charts.MarginSpec.fixedPixel(0),
        leftMarginSpec: decodeMarginSpec(
              map['leftMarginSpec'],
              validate: false,
            ) ??
            charts.MarginSpec.fixedPixel(0),
        rightMarginSpec: decodeMarginSpec(
              map['rightMarginSpec'],
              validate: false,
            ) ??
            charts.MarginSpec.fixedPixel(0),
        topMarginSpec: decodeMarginSpec(
              map['topMarginSpec'],
              validate: false,
            ) ??
            charts.MarginSpec.fixedPixel(0),
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "areaOpacity": <double>,
  ///   "customRendererId": <String>,
  ///   "dashPattern": <List<int>>,
  ///   "includeArea": <bool>,
  ///   "includeLine": <bool>,
  ///   "includePoints": <bool>,
  ///   "layoutPaintOrder": <int>,
  ///   "radiusPx": <double>,
  ///   "roundEndCaps": <bool>,
  ///   "stacked": <bool>,
  ///   "strokeWidthPx": <double>,
  ///   "symbolRenderer": <SymbolRenderer>
  /// }
  /// ```
  ///
  /// See also
  /// * [decodeSymbolRenderer]
  static charts.LineRendererConfig<D>? decodeLineRendererConfig<D>(
    dynamic map, {
    bool validate = false,
  }) {
    charts.LineRendererConfig<D>? result;

    if (map is charts.LineRendererConfig<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/line_renderer_config',
        value: map,
        validate: validate,
      ));
      result = charts.LineRendererConfig<D>(
        areaOpacity: JsonClass.parseDouble(map['areaOpacity']) ?? 0.1,
        customRendererId: map['customRendererId']?.toString(),
        dashPattern: map['dashPattern'] == null
            ? null
            : map['dashPattern'].map((e) => JsonClass.parseInt(e)!),
        includeArea: JsonClass.parseBool(map['includeArea']),
        includeLine: JsonClass.parseBool(
          map[''],
          whenNull: true,
        ),
        includePoints: JsonClass.parseBool(map['includePoints']),
        layoutPaintOrder: JsonClass.parseInt(map['layoutPaintOrder']) ??
            charts.LayoutViewPaintOrder.line,
        radiusPx: JsonClass.parseDouble(map['radiusPx']) ?? 3.5,
        roundEndCaps: JsonClass.parseBool(map['roundEndCaps']),
        stacked: JsonClass.parseBool(map['stacked']),
        strokeWidthPx: JsonClass.parseDouble(map['strokeWidthPx']) ?? 2.0,
        symbolRenderer: decodeSymbolRenderer(
          map['symbolRenderer'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "color": <Color>,
  ///   "dashPattern": <List<int>>,
  ///   "thickness": <int>
  /// }
  /// ```
  ///
  /// See also
  /// * [decodeColor]
  static charts.LineStyleSpec? decodeLineStyleSpec(
    dynamic map, {
    bool validate = true,
  }) {
    charts.LineStyleSpec? result;

    if (result is charts.LineStyleSpec) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/line_style_spec',
        value: map,
        validate: validate,
      ));
      result = charts.LineStyleSpec(
        color: decodeColor(map['color'], validate: false),
        dashPattern: map['dashPattern'] == null
            ? null
            : map['dashPattern'].map((e) => JsonClass.parseInt(e)!),
        thickness: JsonClass.parseInt(map['thickness']),
      );
    }

    return result;
  }

  /// Decodes the object from an [int] or Map-like dynamic structure.  This
  /// expects the JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "bottomMarginSpec": <MarginSpec>,
  ///   "leftMarginSpec": <MarginSpec>,
  ///   "rightMarginSpec": <MarginSpec>,
  ///   "topMarginSpec": <MarginSpec>
  /// }
  /// ```
  static charts.MarginSpec? decodeMarginSpec(
    dynamic map, {
    bool validate = true,
  }) {
    charts.MarginSpec? result;

    if (map is charts.MarginSpec) {
      result = map;
    } else if ((map is num || map is String) &&
        JsonClass.parseInt(map) != null) {
      result = charts.MarginSpec.fixedPixel(JsonClass.parseInt(map));
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/margin_spec',
        value: map,
        validate: validate,
      ));
      var type = map['type'];

      switch (type) {
        case 'percent':
          result = charts.MarginSpec.fromPercent(
            maxPercent: JsonClass.parseInt(map['maxPercent']),
            minPercent: JsonClass.parseInt(map['minPercent']),
          );
          break;

        case 'pixel':
          if (map is num || map is String) {
            result = charts.MarginSpec.fromPixel(
              maxPixel: JsonClass.parseInt(map['maxPixel']),
              minPixel: JsonClass.parseInt(map['minPixel']),
            );
          } else {
            result = charts.MarginSpec.fromPixel(
              maxPixel: JsonClass.parseInt(
                map['maxPixel'],
              ),
              minPixel: JsonClass.parseInt(
                map['minPixel'],
              ),
            );
          }
          break;
        default:
          throw Exception('Unknown [MarginSpec.type] encountered: [$type]');
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "renderSpec": <RenderSpec<num>>,
  ///   "scaleSpec": <ScaleSpec<num>>,
  ///   "showAxisLine": <bool>,
  ///   "tickFormatterSpec": <NumericTickFormatterSpec>,
  ///   "tickProviderSpec": <NumericTickProviderSpec>,
  ///   "viewport": <NumericExtents>
  /// }
  /// ```
  static charts.NumericAxisSpec? decodeNumericAxisSpec(
    dynamic map, {
    bool validate = true,
  }) {
    charts.NumericAxisSpec? result;

    if (map is charts.NumericAxisSpec) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/numeric_axis_spec',
        value: map,
        validate: validate,
      ));
      result = charts.NumericAxisSpec(
        renderSpec: decodeRenderSpec<num>(
          map['renderSpec'],
          validate: false,
        ),
        scaleSpec: map['scaleSpec'],
        showAxisLine: map['showAxisLine'] == null
            ? null
            : JsonClass.parseBool(map['showAxisLine']),
        tickFormatterSpec: map['tickFormatterSpec'],
        tickProviderSpec: map['tickProviderSpec'],
        viewport: map['viewport'],
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "renderSpec": <RenderSpec<String>>,
  ///   "scaleSpec": <OrdinalScaleSpec>,
  ///   "showAxisLine": <bool>,
  ///   "tickFormatterSpec": <OrdinalTickFormatterSpec>,
  ///   "tickProviderSpec": <OrdinalTickProviderSpec>,
  ///   "viewport": <OrdinalExtents>
  /// }
  /// ```
  static charts.OrdinalAxisSpec? decodeOrdinalAxisSpec(
    dynamic map, {
    bool validate = true,
  }) {
    charts.OrdinalAxisSpec? result;

    if (map is charts.OrdinalAxisSpec) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/ordinal_axis_spec',
        value: map,
        validate: validate,
      ));

      result = charts.OrdinalAxisSpec(
        renderSpec: decodeRenderSpec<String>(
          map['renderSpec'],
          validate: false,
        ),
        scaleSpec: map['scaleSpec'],
        showAxisLine: map['showAxisLine'] == null
            ? null
            : JsonClass.parseBool(map['showAxisLine']),
        tickFormatterSpec: map['tickFormatterSpec'],
        tickProviderSpec: map['tickProviderSpec'],
        viewport: map['viewport'],
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "boundsLineRadiusPx": <double>,
  ///   "customRendererId": <String>,
  ///   "customSymbolRenderers": <Map<String, SymbolRenderer>>,
  ///   "layoutPaintOrder": <int>,
  ///   "pointRendererDecorators": <List<PointRendererDecorator>>,
  ///   "radiusPx": <double>,
  ///   "strokeWidthPx": <double>,
  ///   "symbolRenderer": <SymbolRenderer>
  /// }
  /// ```
  ///
  /// See also
  /// * [decodeSymbolRenderer]
  static common.PointRendererConfig<D>? decodePointRendererConfig<D>(
    dynamic map, {
    bool validate = true,
  }) {
    common.PointRendererConfig<D>? result;

    if (map is common.PointRendererConfig<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/point_renderer_config',
        value: map,
        validate: validate,
      ));
      result = common.PointRendererConfig<D>(
        boundsLineRadiusPx: JsonClass.parseDouble(map['boundsLineRadiusPx']),
        customRendererId: map['customRendererId']?.toString(),
        customSymbolRenderers: map['customSymbolRenderers'] == null
            ? null
            : (map['customSymbolRenderers'] as Map).map(
                (key, value) => MapEntry<String, common.SymbolRenderer>(
                  key,
                  decodeSymbolRenderer(
                    value,
                    validate: false,
                  )!,
                ),
              ),
        layoutPaintOrder: JsonClass.parseInt(map['layoutPaintOrder']) ??
            charts.LayoutViewPaintOrder.point,
        pointRendererDecorators: map['pointRendererDecorators'],
        radiusPx: JsonClass.parseDouble(map['radiusPx']) ?? 5.0,
        strokeWidthPx: JsonClass.parseDouble(map['strokeWidthPx']) ?? 0.0,
        symbolRenderer: decodeSymbolRenderer(
          map['symbolRenderer'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "annotations": <List<AnnotationSegment>>,
  ///   "defaultColor": <Color>,
  ///   "defaultLabelAnchor": <AnnotationLabelAnchor>,
  ///   "defaultLabelDirection": <AnnotationLabelDirection>,
  ///   "defaultLabelPosition": <AnnotationLabelPosition>,
  ///   "defaultLabelStyleSpec": <TextStyleSpec>,
  ///   "extendAxis": <bool>,
  ///   "labelPadding": <int>,
  ///   "layoutPaintOrder": <int>
  /// }
  /// ```
  ///
  /// See also
  /// * [decodeAnnotationSegment]
  /// * [decodeAnnotationLabelAnchor]
  /// * [decodeAnnotationLabelDirection]
  /// * [decodeAnnotationLabelPosition]
  /// * [decodeTextStyleSpec]
  static charts.RangeAnnotation<T>? decodeRangeAnnotation<T>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.RangeAnnotation<T>? result;

    if (map is charts.RangeAnnotation<T>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/range_annotation',
        value: map,
        validate: validate,
      ));

      result = charts.RangeAnnotation<T>(
        (map['annotations'] as List)
            .map(
              (e) => decodeAnnotationSegment<T>(
                e,
                validate: false,
              )!,
            )
            .toList(),
        defaultColor: decodeColor(
          map['defaultColor'],
          validate: false,
        ),
        defaultLabelAnchor: decodeAnnotationLabelAnchor(
          map['defaultLabelAnchor'],
          validate: false,
        ),
        defaultLabelDirection: decodeAnnotationLabelDirection(
          map['defaultLabelDirection'],
          validate: false,
        ),
        defaultLabelPosition: decodeAnnotationLabelPosition(
          map['defaultLabelPosition'],
          validate: false,
        ),
        defaultLabelStyleSpec: decodeTextStyleSpec(
          map['defaultLabelStyleSpec'],
          validate: false,
        ),
        extendAxis: map['extendAxis'] == null
            ? null
            : JsonClass.parseBool(
                map['extendAxis'],
              ),
        labelPadding: JsonClass.parseInt(map['labelPadding']),
        layoutPaintOrder: JsonClass.parseInt(map['layoutPaintOrder']),
      );
    }

    return result;
  }

  /// Expects the [map] to be either a [charts.RangeAnnotationAxisType] or a
  /// [String] containing one of the following values:
  ///
  /// * `domain`
  /// * `measure`
  static common.RangeAnnotationAxisType? decodeRangeAnnotationAxisType(
    dynamic map, {
    bool validate = false,
  }) {
    common.RangeAnnotationAxisType? result;

    if (map is common.RangeAnnotationAxisType) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/range_annotation_axis_type',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'domain':
          result = common.RangeAnnotationAxisType.domain;
          break;

        case 'measure':
          result = common.RangeAnnotationAxisType.measure;
          break;

        default:
          throw Exception(
            '[decodeRangeAnnotationAxisType]: unknown value: [$map]',
          );
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be one of the following structures:
  ///
  /// ```json
  /// {
  ///   "axisLineStyle": <LineStyleSpec>,
  ///   "type": "none"
  /// }
  /// ```
  ///
  /// ```json
  /// {
  ///   "axisLineStyle": <LineStyleSpec>,
  ///   "labelAnchor": <TickLabelAnchor>,
  ///   "labelCollisionOffsetFromAxisPx": <int>,
  ///   "labelCollisionOffsetFromTickPx": <int>,
  ///   "labelCollisionRotation": <int>,
  ///   "labelJustification": <TickLabelJustification>,
  ///   "labelOffsetFromAxisPx": <int>,
  ///   "labelOffsetFromTickPx": <int>,
  ///   "labelRotation": <int>,
  ///   "labelStyle": <TextStyleSpec>,
  ///   "lineStyle": <LineStyleSpec>,
  ///   "minimumPaddingBetweenLabelsPx": <int>,
  ///   "tickLengthPx": <int>,
  ///   "type": <"grid_line" | "small_tick">
  /// }
  /// ```
  ///
  /// See also
  /// * [decodeLineStyleSpec]
  /// * [decodeTickLabelAnchor]
  /// * [decodeTickLabelJustification]
  /// * [decodeTextStyleSpec]
  static charts.RenderSpec<D>? decodeRenderSpec<D>(
    dynamic map, {
    bool validate = false,
  }) {
    charts.RenderSpec<D>? result;

    if (map is charts.RenderSpec<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/render_spec',
        value: map,
        validate: validate,
      ));
      var type = map['type'];
      switch (type) {
        case 'grid_line':
          result = charts.GridlineRendererSpec<D>(
            axisLineStyle: decodeLineStyleSpec(
              map['axisLineStyle'],
              validate: false,
            ),
            labelAnchor: decodeTickLabelAnchor(
              map['labelAnchor'],
              validate: false,
            ),
            labelCollisionOffsetFromAxisPx: JsonClass.parseInt(
              map['labelCollisionOffsetFromAxisPx'],
            ),
            labelCollisionOffsetFromTickPx: JsonClass.parseInt(
              map['labelCollisionOffsetFromTickPx'],
            ),
            labelCollisionRotation: JsonClass.parseInt(
              map['labelCollisionRotation'],
            ),
            labelJustification: decodeTickLabelJustification(
              map['labelJustification'],
              validate: false,
            ),
            labelOffsetFromAxisPx: JsonClass.parseInt(
              map['labelOffsetFromAxisPx'],
            ),
            labelOffsetFromTickPx: JsonClass.parseInt(
              map['labelOffsetFromTickPx'],
            ),
            labelRotation: JsonClass.parseInt(map['labelRotation']),
            labelStyle: decodeTextStyleSpec(
              map['labelStyle'],
              validate: false,
            ),
            lineStyle: decodeLineStyleSpec(
              map['lineStyle'],
              validate: false,
            ),
            minimumPaddingBetweenLabelsPx: JsonClass.parseInt(
              map['minimumPaddingBetweenLabelsPx'],
            ),
            tickLengthPx: JsonClass.parseInt(map['tickLengthPx']),
          );
          break;

        case 'none':
          result = charts.NoneRenderSpec<D>(
            axisLineStyle: decodeLineStyleSpec(
              map['axisLineStyle'],
              validate: false,
            ),
          );
          break;

        case 'small_tick':
          result = charts.SmallTickRendererSpec<D>(
            axisLineStyle: decodeLineStyleSpec(
              map['axisLineStyle'],
              validate: false,
            ),
            labelAnchor: decodeTickLabelAnchor(
              map['labelAnchor'],
              validate: false,
            ),
            labelCollisionOffsetFromAxisPx: JsonClass.parseInt(
              map['labelCollisionOffsetFromAxisPx'],
            ),
            labelCollisionOffsetFromTickPx: JsonClass.parseInt(
              map['labelCollisionOffsetFromTickPx'],
            ),
            labelCollisionRotation: JsonClass.parseInt(
              map['labelCollisionRotation'],
            ),
            labelJustification: decodeTickLabelJustification(
              map['labelJustification'],
              validate: false,
            ),
            labelOffsetFromAxisPx: JsonClass.parseInt(
              map['labelOffsetFromAxisPx'],
            ),
            labelOffsetFromTickPx: JsonClass.parseInt(
              map['labelOffsetFromTickPx'],
            ),
            labelRotation: JsonClass.parseInt(map['labelRotation']),
            labelStyle: decodeTextStyleSpec(
              map['labelStyle'],
              validate: false,
            ),
            lineStyle: decodeLineStyleSpec(
              map['lineStyle'],
              validate: false,
            ),
            minimumPaddingBetweenLabelsPx: JsonClass.parseInt(
              map['minimumPaddingBetweenLabelsPx'],
            ),
            tickLengthPx: JsonClass.parseInt(map['tickLengthPx']),
          );
          break;

        default:
          throw Exception('[decodeRenderSpec]: unknown type: [$type]');
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "axisDirection": <AxisDirection>
  /// }
  /// ```
  ///
  /// See also
  /// * [decodeAxisDirection]
  static charts.RTLSpec? decodeRTLSpec(
    dynamic map, {
    bool validate = true,
  }) {
    charts.RTLSpec? result;

    if (map is charts.RTLSpec) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/rtl_spec',
        value: map,
        validate: validate,
      ));
      result = charts.RTLSpec(
        axisDirection: decodeAxisDirection(
          map['axisDirection'],
          validate: false,
        )!,
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "eventTrigger": <SelectionTrigger>,
  ///   "maximumDomainDistancePx": <int>,
  ///   "selectAcrossAllDrawAreaComponents": <bool>,
  ///   "selectClosestSeries": <bool>,
  ///   "selectionMode": <SelectionMode>,
  ///   "selectionModelType": <SelectionModelType>
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeSelectionTrigger]
  /// * [decodeSelectionMode]
  /// * [decodeSelectionModelType]
  static charts.SelectNearest<D>? decodeSelectNearest<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.SelectNearest<D>? result;

    if (map is charts.SelectNearest<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/select_nearest',
        value: map,
        validate: validate,
      ));
      result = charts.SelectNearest<D>(
        eventTrigger: decodeSelectionTrigger(
              map['eventTrigger'],
              validate: false,
            ) ??
            common.SelectionTrigger.tap,
        maximumDomainDistancePx: JsonClass.parseInt(
          map['maximumDomainDistancePx'],
        ),
        selectAcrossAllDrawAreaComponents: JsonClass.parseBool(
          map['selectAcrossAllDrawAreaComponents'],
        ),
        selectClosestSeries: JsonClass.parseBool(
          map['selectClosestSeries'],
          whenNull: true,
        ),
        selectionMode: decodeSelectionMode(
              map['selectionMode'],
              validate: false,
            ) ??
            common.SelectionMode.expandToDomain,
        selectionModelType: decodeSelectionModelType(
              map['selectionModelType'],
              validate: false,
            ) ??
            common.SelectionModelType.info,
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "changedListener": <SelectionModelListener<T>>,
  ///   "type": <SelectionModelType>,
  ///   "updatedListener": <SelectionModelListener<T>>
  /// }
  /// ```
  ///
  /// See also
  /// * [decodeSelectionModelType]
  static charts.SelectionModelConfig<T>? decodeSelectionModelConfig<T>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.SelectionModelConfig<T>? result;

    if (map is charts.SelectionModelConfig<T>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/selection_model_config',
        value: map,
        validate: validate,
      ));
      result = charts.SelectionModelConfig<T>(
        changedListener: map['changedListener'],
        type: decodeSelectionModelType(
          map['type'],
          validate: false,
        )!,
        updatedListener: map['updatedListener'],
      );
    }

    return result;
  }

  /// Decodes the object from a list of [charts.SelectionModelConfig] objects.
  ///
  /// See also
  /// * [decodeSelectionModelConfig]
  static List<charts.SelectionModelConfig<T>>?
      decodeSelectionModelConfigList<T>(
    dynamic map, {
    bool validate = true,
  }) {
    List<charts.SelectionModelConfig<T>>? result;

    if (map is List) {
      result = [];
      for (var item in map) {
        result.add(
          decodeSelectionModelConfig(
            item,
            validate: false,
          )!,
        );
      }
    } else if (map is Map) {
      result = [decodeSelectionModelConfig(map, validate: false)!];
    } else if (map != null) {
      throw Exception('[decodeSelectionModelConfigList]: Unknown data: [$map]');
    }

    return result;
  }

  /// Expects the [map] to be either a [common.SelectionMode] or a [String]
  /// containing one of the following values:
  ///
  /// * `expandToDomain`
  /// * `selectOverlapping`
  /// * `single`
  static common.SelectionMode? decodeSelectionMode(
    dynamic map, {
    bool validate = true,
  }) {
    common.SelectionMode? result;

    if (map is common.SelectionMode) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/selection_mode',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'expandToDomain':
          result = common.SelectionMode.expandToDomain;
          break;

        case 'selectOverlapping':
          result = common.SelectionMode.selectOverlapping;
          break;

        case 'single':
          result = common.SelectionMode.single;
          break;

        default:
          throw Exception('Unknown [SelectionMode] encountered: [$map]');
      }
    }

    return result;
  }

  /// Expects the [map] to be either a [charts.SelectionModelType] or a [String]
  /// containing one of the following values:
  ///
  /// * `action`
  /// * `info`
  static charts.SelectionModelType? decodeSelectionModelType(
    dynamic map, {
    bool validate = true,
  }) {
    charts.SelectionModelType? result;

    if (map is charts.SelectionModelType) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/selection_model_type',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'action':
          result = charts.SelectionModelType.action;
          break;

        case 'info':
          result = charts.SelectionModelType.info;
          break;

        default:
          throw Exception('Unknown [SelectionModelType] encountered: [$map]');
      }
    }

    return result;
  }

  /// Expects the [map] to be either a [common.SelectionTrigger] or a [String]
  /// containing one of the following values:
  ///
  /// * `hover`
  /// * `longPressHold`
  /// * `pressHold`
  /// * `tap`
  /// * `tapAndDrag`
  static common.SelectionTrigger? decodeSelectionTrigger(
    dynamic map, {
    bool validate = true,
  }) {
    common.SelectionTrigger? result;

    if (map is common.SelectionTrigger) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/selection_trigger',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'hover':
          result = common.SelectionTrigger.hover;
          break;

        case 'longPressHold':
          result = common.SelectionTrigger.longPressHold;
          break;

        case 'pressHold':
          result = common.SelectionTrigger.pressHold;
          break;

        case 'tap':
          result = common.SelectionTrigger.tap;
          break;

        case 'tapAndDrag':
          result = common.SelectionTrigger.tapAndDrag;
          break;

        default:
          throw Exception('Unknown [SelectionTrigger] encountered: [$map]');
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "areaColorFn": <TypedAccessorFn<T, Color>>,
  ///   "colorFn": <TypedAccessorFn<T, Color>>,
  ///   "dashPatternFn": <TypedAccessorFn<T, List<int>>>,
  ///   "data": <List<T>>,
  ///   "displayName": <String>,
  ///   "domainFormatterFn": <TypedAccessorFn<T, DomainFormatter<D>>>,
  ///   "domainLowerBoundFn": <TypedAccessorFn<T, D>>,
  ///   "domainUpperBoundFn": <TypedAccessorFn<T, D>>,
  ///   "domainFn": <TypedAccessorFn<T, D>>,
  ///   "fillColorFn": <TypedAccessorFn<T, Color>>,
  ///   "fillPatternFn": <TypedAccessorFn<T, Color>>,
  ///   "id": <String>,
  ///   "insideLabelStyleAccessorFn": <TypedAccessorFn<T, TextStyleSpec>>,
  ///   "keyFn": <TypedAccessorFn<T, String>>,
  ///   "labelAccessorFn": <TypedAccessorFn<T, String>>,
  ///   "measureFn": map['measureFn'],
  ///   "measureFormatterFn": <TypedAccessorFn<T, MeasureFormatter>>,
  ///   "measureLowerBoundFn": <TypedAccessorFn<T, num>>,
  ///   "measureOffsetFn": <TypedAccessorFn<T, num>>,
  ///   "measureUpperBoundFn": <TypedAccessorFn<T, num>>,
  ///   "outsideLabelStyleAccessorFn": <TypedAccessorFn<T, TextStyleSpec>>,
  ///   "overlaySeries": <bool>,
  ///   "patternColorFn": <TypedAccessorFn<T, Color>>,
  ///   "radiusPxFn": <TypedAccessorFn<T, num>>,
  ///   "seriesCategory": <String>,
  ///   "seriesColor": <Color>,
  ///   "strokeWidthPxFn": <TypedAccessorFn<T, num>>
  /// }
  /// ```
  ///
  /// See also
  /// * [decodeColor]
  static charts.Series<T, D> decodeSeries<T, D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.Series<T, D>? result;

    if (map is charts.Series<T, D>) {
      result = map;
    } else if (map == null) {
      throw Exception('[decodeSeries]: map is null');
    } else {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/series',
        value: map,
        validate: validate,
      ));
      result = charts.Series<T, D>(
        areaColorFn: map['areaColorFn'],
        colorFn: map['colorFn'],
        dashPatternFn: map['dashPatternFn'],
        data: JsonClass.parseJson(map['data']),
        displayName: map['displayName']?.toString(),
        domainFormatterFn: map['domainFormatterFn'],
        domainLowerBoundFn: map['domainLowerBoundFn'],
        domainUpperBoundFn: map['domainUpperBoundFn'],
        domainFn: map['domainFn'],
        fillColorFn: map['fillColorFn'],
        fillPatternFn: map['fillPatternFn'],
        id: map['id'].toString(),
        insideLabelStyleAccessorFn: map['insideLabelStyleAccessorFn'],
        keyFn: map['keyFn'],
        labelAccessorFn: map['labelAccessorFn'],
        measureFn: map['measureFn'],
        measureFormatterFn: map['measureFormatterFn'],
        measureLowerBoundFn: map['measureLowerBoundFn'],
        measureOffsetFn: map['measureOffsetFn'],
        measureUpperBoundFn: map['measureUpperBoundFn'],
        outsideLabelStyleAccessorFn: map['outsideLabelStyleAccessorFn'],
        overlaySeries: JsonClass.parseBool(map['overlaySeries']),
        patternColorFn: map['patternColorFn'],
        radiusPxFn: map['radiusPxFn'],
        seriesCategory: map['seriesCategory']?.toString(),
        seriesColor: decodeColor(
          map['seriesColor'],
          validate: false,
        ),
        strokeWidthPxFn: map['strokeWidthPxFn'],
      );
    }

    return result;
  }

  static List<charts.Series<T, D>> decodeSeriesList<T, D>(
    dynamic map, {
    bool validate = true,
  }) {
    List<charts.Series<T, D>>? result;

    if (map is Map) {
      map = map.values;
    }

    if (map is charts.Series) {
      result = <charts.Series<T, D>>[map as charts.Series<T, D>];
    } else if (map is Iterable) {
      result = [];
      for (var item in map) {
        result.add(decodeSeries<T, D>(
          item,
          validate: false,
        ));
      }
    } else {
      throw Exception('[decodeSeriesList]: map is not supported: [$map]');
    }

    return result;
  }

  /// Decodes a dynamic value to an appropriate [charts.SeriesRendererConfig].
  /// Which renderer is used is determined by the "type", and the schema is then
  /// specific to that type.  The following types are supported:
  ///
  /// * "arc": [decodeArcRendererConfig]
  /// * "bar": [decodeBarRendererConfig]
  /// * "bar_target_line": [decodeBarTargetLineRendererConfig]
  /// * "line": [decodeLineRendererConfig]
  /// * "point": [decodePointRendererConfig]
  /// * "symbol_annotation": [decodeSymbolAnnotationRendererConfig]
  static charts.SeriesRendererConfig<D>? decodeSeriesRendererConfig<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.SeriesRendererConfig<D>? result;

    if (map is charts.SeriesRendererConfig<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/series_renderer_config',
        value: map,
        validate: validate,
      ));

      var type = map['type'];
      switch (type) {
        case 'arc':
          result = decodeArcRendererConfig<D>(
            map,
            validate: false,
          );
          break;

        case 'bar':
          result = decodeBarRendererConfig<D>(
            map,
            validate: false,
          );
          break;

        case 'bar_target_line':
          result = decodeBarTargetLineRendererConfig<D>(
            map,
            validate: false,
          );
          break;

        case 'line':
          result = decodeLineRendererConfig<D>(
            map,
            validate: false,
          );
          break;

        case 'point':
          result = decodePointRendererConfig<D>(
            map,
            validate: false,
          );
          break;

        case 'symbol_annotation':
          result = decodeSymbolAnnotationRendererConfig<D>(
            map,
            validate: false,
          );
          break;

        default:
          throw Exception(
              'Unknown [SeriesRendererConfig.type] encountered: [$type]');
      }
    }

    return result;
  }

  static List<common.SeriesRendererConfig<T>>?
      decodeSeriesRendererConfigList<T>(
    dynamic map, {
    bool validate = true,
  }) {
    List<common.SeriesRendererConfig<T>>? result;

    if (map is List<common.SeriesRendererConfig<T>>) {
      result = map;
    } else if (map is common.SeriesRendererConfig<T>) {
      result = [map];
    } else if (map is Map) {
      result = [
        decodeSeriesRendererConfig<T>(
          map,
          validate: false,
        )!
      ];
    } else if (map is List) {
      result = [];
      for (var item in map) {
        result.add(decodeSeriesRendererConfig<T>(item, validate: false)!);
      }
    } else if (map != null) {
      throw Exception(
        '[decodeSeriesRendererConfigList]: unknown input data type encountered: [$map]',
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "customRendererId": <String>,
  ///   "customSymbolRenderers": <Map<String, SymbolRenderer>>,
  ///   "pointRendererDecorators": <List<PointRendererDecorator>>,
  ///   "radiusPx": <double>,
  ///   "showBottomSeparatorLine": <bool>,
  ///   "showSeparatorLines": <bool>,
  ///   "symbolRenderer": <SymbolRenderer>,
  ///   "verticalSymbolBottomPaddingPx": <double>,
  ///   "verticalSymbolTopPaddingPx": <double>
  /// }
  /// ```
  ///
  /// See also
  /// * [decodeSymbolRenderer]
  static common.SymbolAnnotationRendererConfig<D>?
      decodeSymbolAnnotationRendererConfig<D>(
    dynamic map, {
    bool validate = true,
  }) {
    common.SymbolAnnotationRendererConfig<D>? result;

    if (map is common.SymbolAnnotationRendererConfig<D>) {
      result = map;
    } else if (map != null) {
      result = common.SymbolAnnotationRendererConfig<D>(
        customRendererId: map['customRendererId']?.toString(),
        customSymbolRenderers: map['customSymbolRenderers'] == null
            ? null
            : (map['customSymbolRenderers'] as Map).map(
                (key, value) => MapEntry<String, common.SymbolRenderer>(
                  key,
                  decodeSymbolRenderer(
                    value,
                    validate: false,
                  )!,
                ),
              ),
        pointRendererDecorators: map['pointRendererDecorators'],
        radiusPx: JsonClass.parseDouble(map['radiusPx']) ?? 5.0,
        showBottomSeparatorLine: JsonClass.parseBool(
          map['showBottomSeparatorLine'],
        ),
        showSeparatorLines: JsonClass.parseBool(
          map['showSeparatorLines'],
          whenNull: true,
        ),
        symbolRenderer: decodeSymbolRenderer(
          map['symbolRenderer'],
          validate: false,
        ),
        verticalSymbolBottomPaddingPx:
            JsonClass.parseDouble(map['verticalSymbolBottomPaddingPx']) ?? 5.0,
        verticalSymbolTopPaddingPx:
            JsonClass.parseDouble(map['verticalSymbolTopPaddingPx']) ?? 5.0,
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "color": <Color>,
  ///   "fontFamily": <String>,
  ///   "fontSize": <int>,
  ///   "fontWeight": <String>,
  ///   "lineHeight": <double>
  /// }
  /// ```
  ///
  /// See also
  /// * [decodeColor]
  static charts.TextStyleSpec? decodeTextStyleSpec(
    dynamic map, {
    bool validate = true,
  }) {
    charts.TextStyleSpec? result;

    if (map is charts.TextStyleSpec) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/text_style_spec',
        value: map,
        validate: validate,
      ));
      result = charts.TextStyleSpec(
        color: decodeColor(map['color']),
        fontFamily: map['fontFamily']?.toString(),
        fontSize: JsonClass.parseInt(map['fontSize']),
        fontWeight: map['fontWeight']?.toString(),
        lineHeight: JsonClass.parseDouble(map['lineHeight']),
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "isSolid": <bool>,
  ///   "type": <"circle" | "rect">
  /// }
  /// ```
  static common.SymbolRenderer? decodeSymbolRenderer(
    dynamic map, {
    bool validate = true,
  }) {
    common.SymbolRenderer? result;

    if (result is common.SymbolRenderer) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/symbol_renderer',
        value: map,
        validate: validate,
      ));
      var type = map['type'];

      switch (type) {
        case 'circle':
          result = common.CircleSymbolRenderer(
            isSolid: map['isSolid'] == null
                ? true
                : JsonClass.parseBool(
                    map['isSolid'],
                    whenNull: true,
                  ),
          );
          break;

        case 'rect':
          result = common.RectSymbolRenderer(
            isSolid: map['isSolid'] == null
                ? true
                : JsonClass.parseBool(
                    map['isSolid'],
                    whenNull: true,
                  ),
          );
          break;
        default:
          throw Exception('Unknown [SymbolRenderer.type] encountered: [$type]');
      }
    }

    return result;
  }

  /// Expects the [map] to be either a [charts.TickLabelAnchor] or a [String]
  /// containing one of the following values:
  ///
  /// * `after`
  /// * `before`
  /// * `centered`
  /// * `inside`
  static charts.TickLabelAnchor? decodeTickLabelAnchor(
    dynamic map, {
    bool validate = true,
  }) {
    charts.TickLabelAnchor? result;

    if (map is charts.TickLabelAnchor) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/tick_label_anchor',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'after':
          result = charts.TickLabelAnchor.after;
          break;

        case 'before':
          result = charts.TickLabelAnchor.before;
          break;

        case 'centered':
          result = charts.TickLabelAnchor.centered;
          break;

        case 'inside':
          result = charts.TickLabelAnchor.inside;
          break;

        default:
          throw Exception(
            '[decodeTickLabelAnchor]: map is not supported: [$map]',
          );
      }
    }

    return result;
  }

  /// Expects the [map] to be either a [charts.TickLabelJustification] or a [String]
  /// containing one of the following values:
  ///
  /// * `inside`
  /// * `outside`
  static charts.TickLabelJustification? decodeTickLabelJustification(
    dynamic map, {
    bool validate = true,
  }) {
    charts.TickLabelJustification? result;

    if (map is charts.TickLabelJustification) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/tick_label_justification',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'inside':
          result = charts.TickLabelJustification.inside;
          break;

        case 'outside':
          result = charts.TickLabelJustification.outside;
          break;

        default:
          throw Exception(
            '[decodeTickLabelJustification]: map is not supported: [$map]',
          );
      }
    }

    return result;
  }

  static common.Color fromColor(Color color) => common.Color(
        a: color.alpha,
        b: color.blue,
        r: color.red,
        g: color.green,
      );
}
