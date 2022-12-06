import 'dart:math';

import 'package:charts_common/common.dart' as common;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme.dart';
import 'package:json_theme/json_theme_schemas.dart';
import 'package:logging/logging.dart';

class JsonChartsDecoder {
  static const _baseSchemaUrl =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter';

  static final _logger = Logger('JsonChartsDecoder');

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

      final type = map['type'];
      final axisType = decodeRangeAnnotationAxisType(
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
                : List<int>.from(
                    map['dashPattern'].map((e) => JsonClass.parseInt(e)!),
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
  ///   "insideLabelStyleSpec": <TextStyleSpec>,
  ///   "labelPadding": <int>,
  ///   "labelPosition": <ArcLabelPosition>,
  ///   "leaderLineColor": <Color>,
  ///   "leaderLineStyleSpec": <ArcLabelLeaderLineStyleSpec>,
  ///   "outsideLabelStyleSpec": <TextStyleSpec>,
  ///   "showLeaderLines": <bool>
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeArcLabelLeaderLineStyleSpec]
  /// * [decodeArcLabelPosition]
  /// * [decodeColor]
  /// * [decodeTextStyleSpec]
  static common.ArcLabelDecorator<D>? decodeArcLabelDecorator<D>(
    dynamic map, {
    bool validate = false,
  }) {
    common.ArcLabelDecorator<D>? result;

    if (map is common.ArcLabelDecorator<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/arc_label_decorator',
        value: map,
        validate: validate,
      ));

      result = common.ArcLabelDecorator<D>(
        insideLabelStyleSpec: decodeTextStyleSpec(
          map['insideLabelStyleSpec'],
          validate: false,
        ),
        labelPadding: JsonClass.parseInt(map['labelPadding']) ?? 5,
        labelPosition: decodeArcLabelPosition(
              map['labelPosition'],
              validate: false,
            ) ??
            common.ArcLabelPosition.auto,
        leaderLineColor: decodeColor(
          map['leaderLineColor'],
          validate: false,
        ),
        leaderLineStyleSpec: decodeArcLabelLeaderLineStyleSpec(
          map['leaderLineStyleSpec'],
          validate: false,
        ),
        outsideLabelStyleSpec: decodeTextStyleSpec(
          map['outsideLabelStyleSpec'],
          validate: false,
        ),
        showLeaderLines: JsonClass.parseBool(
          map['showLeaderLines'],
          whenNull: true,
        ),
      );
    }

    return result;
  }

  static List<common.ArcLabelDecorator<D>> decodeArcLabelDecoratorList<D>(
    dynamic map, {
    bool validate = false,
  }) {
    var result = <common.ArcLabelDecorator<D>>[];

    if (map is List) {
      result = <common.ArcLabelDecorator<D>>[];
      for (var item in map) {
        result.add(decodeArcLabelDecorator<D>(
          item,
          validate: false,
        )!);
      }
    } else if (map is common.ArcLabelDecorator<D>) {
      result = <common.ArcLabelDecorator<D>>[map];
    } else if (map is Map) {
      result = <common.ArcLabelDecorator<D>>[
        decodeArcLabelDecorator<D>(
          map,
          validate: false,
        )!,
      ];
    } else if (map != null) {
      throw Exception('[decodeArcLabelDecoratorList]: unknown object: [$map]');
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "color": <Color>,
  ///   "length": <double>,
  ///   "thickness": <double>
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeColor]
  static common.ArcLabelLeaderLineStyleSpec? decodeArcLabelLeaderLineStyleSpec(
    dynamic map, {
    bool validate = true,
  }) {
    common.ArcLabelLeaderLineStyleSpec? result;

    if (map is common.ArcLabelLeaderLineStyleSpec) {
      result = map;
    } else if (map != null) {
      result = common.ArcLabelLeaderLineStyleSpec(
        color: decodeColor(
              map['color'],
              validate: false,
            ) ??
            charts.MaterialPalette.black,
        length: JsonClass.parseDouble(map['length']) ?? 10.0,
        thickness: JsonClass.parseDouble(map['thickness']) ?? 1.0,
      );
    }

    return result;
  }

  /// Expects the [map] to be either a [common.ArcLabelPosition] or a [String]
  /// containing one of the following values:
  ///
  /// * `auto`
  /// * `inside`
  /// * `outside`
  static common.ArcLabelPosition? decodeArcLabelPosition(
    dynamic map, {
    bool validate = true,
  }) {
    common.ArcLabelPosition? result;

    if (map is common.ArcLabelPosition) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/arc_label_position',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'auto':
          result = charts.ArcLabelPosition.auto;
          break;

        case 'inside':
          result = charts.ArcLabelPosition.inside;
          break;

        case 'outside':
          result = charts.ArcLabelPosition.outside;
          break;

        default:
          throw Exception(
            '[decodeArcLabelPosition]: unknown type: [$map]',
          );
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
  ///   "arcRendererDecorators": <List<ArcLabelDecorator>>,
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
  /// * [decodeArcLabelDecorator]
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
        arcRendererDecorators:
            decodeArcLabelDecoratorList<D>(map['arcRendererDecorators']),
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
  ///   "tickProviderSpec": <TickProviderSpec>,
  ///   "type": <String>
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeBucketingAxisSpec]
  /// * [decodeEndPointsTimeAxisSpec]
  /// * [decodeDateTimeAxisSpec]
  /// * [decodeNumericAxisSpec]
  /// * [decodeOrdinalAxisSpec]
  /// * [decodePercentAxisSpec]
  static charts.AxisSpec<D>? decodeAxisSpec<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.AxisSpec? result;

    if (map is charts.AxisSpec<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/axis_spec',
        value: map,
        validate: validate,
      ));

      final type = map['type'];

      switch (type) {
        case 'bucketing':
          result = decodeBucketingAxisSpec(
            map,
            validate: false,
          );
          break;

        case 'date_time':
          result = decodeDateTimeAxisSpec(
            map,
            validate: false,
          );
          break;

        case 'end_points_time':
          result = decodeEndPointsTimeAxisSpec(
            map,
            validate: false,
          );
          break;

        case 'numeric':
          result = decodeNumericAxisSpec(
            map,
            validate: false,
          );
          break;

        case 'ordinal':
          result = decodeOrdinalAxisSpec(
            map,
            validate: false,
          );
          break;

        case 'percent':
          result = decodePercentAxisSpec<D>(
            map,
            validate: false,
          );
          break;

        default:
          result = charts.AxisSpec<D>(
            renderSpec: decodeRenderSpec<D>(
              map['renderSpec'],
              validate: false,
            ),
            scaleSpec: map['scaleSpec'],
            showAxisLine: map['showAxisLine'] == null
                ? null
                : JsonClass.parseBool(map['showAxisLine']),
            tickFormatterSpec: decodeTickFormatterSpec<D>(
              map['tickFormatterSpec'],
              validate: false,
            ),
            tickProviderSpec: map['tickProviderSpec'],
          );
      }
    }

    return result as common.AxisSpec<D>?;
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
      final type = map['type'];

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
            : List<int>.from(
                map['dashPattern'].map((e) => JsonClass.parseInt(e)!),
              ),
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
      final type = map['type'];

      switch (type) {
        case 'label':
          result = charts.BarLabelDecorator<T>(
            insideLabelStyleSpec: decodeTextStyleSpec(
                  map['insideLabelStyleSpec'],
                  validate: false,
                ) ??
                const common.TextStyleSpec(
                    fontSize: 12, color: common.Color.white),
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
                const common.TextStyleSpec(
                    fontSize: 12, color: common.Color.black),
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

  /// Expects the [map] to be either a [charts.BehaviorPosition] or a [String]
  /// containing one of the following values:
  ///
  /// * `bottom`
  /// * `end`
  /// * `inside`
  /// * `start`
  /// * `top`
  static charts.BehaviorPosition? decodeBehaviorPosition(
    dynamic map, {
    bool validate = true,
  }) {
    charts.BehaviorPosition? result;

    if (map is charts.BehaviorPosition) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/behavior_position',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'bottom':
          result = charts.BehaviorPosition.bottom;
          break;

        case 'end':
          result = charts.BehaviorPosition.end;
          break;

        case 'inside':
          result = charts.BehaviorPosition.inside;
          break;

        case 'start':
          result = charts.BehaviorPosition.start;
          break;

        case 'top':
          result = charts.BehaviorPosition.top;
          break;

        default:
          throw Exception(
            '[decodeBehaviorPosition]: map is not supported: [$map]',
          );
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
  ///   "showAxisLine": <bool>,
  ///   "showBucket": <bool>,
  ///   "threshold": <double>,
  ///   "tickFormatterSpec": <NumericTickFormatterSpec>,
  ///   "tickProviderSpec": <NumericTickProviderSpec>,
  ///   "viewport": <NumericExtents>
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeNumericTickProviderSpec]
  static charts.BucketingAxisSpec? decodeBucketingAxisSpec(
    dynamic map, {
    bool validate = true,
  }) {
    charts.BucketingAxisSpec? result;

    if (map is charts.BucketingAxisSpec) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/bucketing_axis_spec',
        value: map,
        validate: validate,
      ));
      result = charts.BucketingAxisSpec(
        renderSpec: decodeRenderSpec<num>(
          map['renderSpec'],
          validate: false,
        ),
        showAxisLine: map['showAxisLine'] == null
            ? null
            : JsonClass.parseBool(map['showAxisLine']),
        showBucket: map['showBucket'] == null
            ? null
            : JsonClass.parseBool(map['showBucket']),
        threshold: JsonClass.parseDouble(map['threshold']),
        tickFormatterSpec: decodeNumericTickFormatterSpec(
          map['tickFormatterSpec'],
          validate: false,
        ),
        tickProviderSpec: decodeNumericTickProviderSpec(
          map['tickProviderSpec'],
          validate: false,
        ),
        viewport: decodeNumericExtents(
          map['viewport'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Decodes a dynamic value to an appropriate [charts.ChartBehavior].
  /// Which renderer is used is determined by the "type", and the schema is then
  /// specific to that type.  The following types are supported:
  ///
  /// * "chart_title": [decodeChartTitle]
  /// * "datum_legend": [decodeDatumLegend]
  /// * "domain_highlighter": [decodeDomainHighlighter]
  /// * "initial_hint_behavior": [decodeInitialHintBehavior]
  /// * "initial_selection": [decodeInitialSelection]
  /// * "line_point_highlighter": [decodeLinePointHighlighter]
  /// * "pan_and_zoom_behavior": [decodePanAndZoomBehavior]
  /// * "percent_injector": [decodePercentInjector]
  /// * "range_annotation": [decodeRangeAnnotation]
  /// * "select_nearest": [decodeSelectNearest]
  /// * "series_legend": [decodeSeriesLegend]
  /// * "slider": [decodeSlider]
  /// * "sliding_viewport": [decodeSlidingViewport]
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

      final type = map['type'];

      switch (type) {
        case 'chart_title':
          result = decodeChartTitle<D>(
            map,
            validate: false,
          );
          break;

        case 'datum_legend':
          result = decodeDatumLegend<D>(
            map,
            validate: false,
          );
          break;

        case 'domain_highlighter':
          result = decodeDomainHighlighter<D>(
            map,
            validate: false,
          );
          break;

        case 'initial_hint_behavior':
          result = decodeInitialHintBehavior<D>(
            map,
            validate: false,
          );
          break;

        case 'initial_selection':
          result = decodeInitialSelection<D>(
            map,
            validate: false,
          );
          break;

        case 'line_point_highlighter':
          result = decodeLinePointHighlighter<D>(
            map,
            validate: false,
          );
          break;

        case 'pan_and_zoom_behavior':
          result = decodePanAndZoomBehavior<D>(
            map,
            validate: false,
          );
          break;

        case 'percent_injector':
          result = decodePercentInjector<D>(
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

        case 'series_legend':
          result = decodeSeriesLegend<D>(
            map,
            validate: false,
          );
          break;

        case 'slider':
          result = decodeSlider<D>(
            map,
            validate: false,
          );
          break;

        case 'sliding_viewport':
          result = decodeSlidingViewport<D>(
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
      result = <charts.ChartBehavior<T>>[map];
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

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "behaviorPosition": <BehaviorPosition>,
  ///   "innerPadding": <int>,
  ///   "layoutMinSize": <int>,
  ///   "layoutPreferredSize": <int>,
  ///   "maxWidthStrategy": <MaxWidthStrategy>,
  ///   "outerPadding": <int>,
  ///   "subTitle": <String>,
  ///   "subTitleStyleSpec": <TextStyleSpec>,
  ///   "text": <String>,
  ///   "titleDirection": <ChartTitleDirection>,
  ///   "titleOutsideJustification": <TitleOutsideJustification>,
  ///   "titlePadding": <int>,
  ///   "titleStyleSpec": <TextStyleSpec>
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeBehaviorPosition]
  /// * [decodeChartTitleDirection]
  /// * [decodeMaxWidthStrategy]
  /// * [decodeOutsideJustification]
  /// * [decodeTextStyleSpec]
  static charts.ChartTitle<D>? decodeChartTitle<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.ChartTitle<D>? result;

    if (map is charts.ChartTitle<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/chart_title',
        value: map,
        validate: validate,
      ));
      result = charts.ChartTitle<D>(
        map['text'],
        behaviorPosition: decodeBehaviorPosition(
          map['behaviorPosition'],
          validate: false,
        ),
        innerPadding: JsonClass.parseInt(map['innerPadding']),
        layoutMinSize: JsonClass.parseInt(map['layoutMinSize']),
        layoutPreferredSize: JsonClass.parseInt(map['layoutPreferredSize']),
        maxWidthStrategy: decodeMaxWidthStrategy(
          map['maxWidthStrategy'],
          validate: false,
        ),
        outerPadding: JsonClass.parseInt(map['outerPadding']),
        subTitle: map['subTitle'],
        subTitleStyleSpec: decodeTextStyleSpec(
          map['subTitleStyleSpec'],
          validate: false,
        ),
        titleDirection: decodeChartTitleDirection(
          map['titleDirection'],
          validate: false,
        ),
        titleOutsideJustification: decodeOutsideJustification(
          map['titleOutsideJustification'],
          validate: false,
        ),
        titlePadding: JsonClass.parseInt(map['titlePadding']),
        titleStyleSpec: decodeTextStyleSpec(
          map['titleStyleSpec'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Expects the [map] to be either a [common.ChartTitleDirection] or a
  /// [String] containing one of the following values:
  ///
  /// * `auto`
  /// * `horizontal`
  /// * `vertical`
  static common.ChartTitleDirection? decodeChartTitleDirection(
    dynamic map, {
    bool validate = true,
  }) {
    common.ChartTitleDirection? result;

    if (map is common.ChartTitleDirection) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/chart_title_direction',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'auto':
          result = common.ChartTitleDirection.auto;
          break;

        case 'horizontal':
          result = common.ChartTitleDirection.horizontal;
          break;

        case 'vertical':
          result = common.ChartTitleDirection.vertical;
          break;

        default:
          throw Exception(
            '[decodeChartTitleDirection]: map is not supported: [$map]',
          );
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
      final type = map['type'];

      switch (type) {
        case 'const':
          result =
              charts.ConstCornerStrategy(JsonClass.parseInt(map['radius'])!);
          break;

        case 'none':
          result = const charts.NoCornerStrategy();
          break;

        default:
          throw Exception('Unknown [CornerStrategy.type] encountered: [$type]');
      }
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
  ///
  /// See also:
  /// * [decodeDateTimeTickFormatterSpec]
  /// * [decodeDateTimeTickProviderSpec]
  /// * [decodeRendererSpec]
  static charts.DateTimeAxisSpec? decodeDateTimeAxisSpec(
    dynamic map, {
    bool validate = true,
  }) {
    charts.DateTimeAxisSpec? result;

    if (map is charts.DateTimeAxisSpec) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/date_time_axis_spec',
        value: map,
        validate: validate,
      ));

      result = charts.DateTimeAxisSpec(
        renderSpec: decodeRenderSpec<DateTime>(
          map['renderSpec'],
          validate: false,
        ),
        showAxisLine: map['showAxisLine'] == null
            ? null
            : JsonClass.parseBool(map['showAxisLine']),
        tickFormatterSpec: decodeDateTimeTickFormatterSpec(
          map['tickFormatterSpec'],
          validate: false,
        ),
        tickProviderSpec: decodeDateTimeTickProviderSpec(
          map['tickProviderSpec'],
          validate: false,
        ),
        viewport: decodeDateTimeExtents(
          map['viewport'],
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
  ///   "end": <DateTime>,
  ///   "start": <DateTime>
  /// }
  /// ```
  static common.DateTimeExtents? decodeDateTimeExtents(
    dynamic map, {
    bool validate = false,
  }) {
    common.DateTimeExtents? result;

    if (map is common.DateTimeExtents) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/date_time_extents',
        value: map,
        validate: validate,
      ));

      result = common.DateTimeExtents(
        end: JsonClass.parseDateTime(map['end'])!,
        start: JsonClass.parseDateTime(map['start'])!,
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "includeTime": <bool>,
  ///   "type": "auto"
  /// }
  /// ```
  static common.DateTimeTickProviderSpec? decodeDateTimeTickProviderSpec(
    dynamic map, {
    bool validate = true,
  }) {
    common.DateTimeTickProviderSpec? result;

    if (map is common.DateTimeTickProviderSpec) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/date_time_tick_provider_spec',
        value: map,
        validate: validate,
      ));
      final type = map['type'];

      switch (type) {
        case 'auto':
          result = common.AutoDateTimeTickProviderSpec(
            includeTime: JsonClass.parseBool(
              map['includeTime'],
              whenNull: true,
            ),
          );
          break;

        default:
          throw Exception(
            '[decodeDateTimeTickProviderSpec]: unknown type encountered: [$type]',
          );
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
          result = const common.LocalDateTimeFactory();
          break;

        case 'utc':
          result = const common.UTCDateTimeFactory();
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
  ///   "format": <String>
  /// }
  /// ```
  static charts.DateTimeTickFormatterSpec? decodeDateTimeTickFormatterSpec<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.DateTimeTickFormatterSpec? result;

    if (map is charts.DateTimeTickFormatterSpec) {
      result = map;
    } else if (map is DateFormat) {
      charts.BasicDateTimeTickFormatterSpec.fromDateFormat(map);
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/tick_formatter_spec',
        value: map,
        validate: validate,
      ));

      final type = map['type'];
      if (type == 'auto_date_time') {
        result = charts.AutoDateTimeTickFormatterSpec(
          day: decodeTimeFormatterSpec(map['day']),
          hour: decodeTimeFormatterSpec(map['hour']),
          minute: decodeTimeFormatterSpec(map['minute']),
          month: decodeTimeFormatterSpec(map['month']),
          year: decodeTimeFormatterSpec(map['year']),
        );
      } else {
        result = charts.BasicDateTimeTickFormatterSpec.fromDateFormat(
          DateFormat(map['format'] ?? 'MM/dd/yyyy'),
        );
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "cellPadding": <EdgeInsets>,
  ///   "desiredMaxColumns": <int>,
  ///   "desiredMaxRows": <int>,
  ///   "horizontalFirst": <bool>,
  ///   "entryTextStyle": <common.TextStyleSpec>,
  ///   "insideJustification": <charts.InsideJustification>,
  ///   "legendDefaultMeasure": <charts.LegendDefaultMeasure>,
  ///   "measureFormatter": <common.MeasureFormatter>,
  ///   "outsideJustification": <charts.OutsideJustification>,
  ///   "position": <BehaviorPosition>,
  ///   "secondaryMeasureFormatter": <common.MeasureFormatter>,
  ///   "showMeasures": <bool>,
  ///   "type": "series_legend"
  /// }
  /// ```
  ///
  /// See also
  /// * [decodeBehaviorPosition]
  /// * [decodeInsideJustification]
  /// * [decodeLegendDefaultMeasure]
  /// * [decodeOutsideJustification]
  /// * [decodeTextStyleSpec]
  /// * [ThemeDecoder.decodeEdgeInsetsGeometry]
  static charts.DatumLegend<D>? decodeDatumLegend<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.DatumLegend<D>? result;

    if (map is charts.DatumLegend<D>) {
      result = map;
    } else if (map != null) {
      result = charts.DatumLegend<D>(
        cellPadding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['cellPadding'],
          validate: false,
        ) as EdgeInsets?,
        desiredMaxColumns: JsonClass.parseInt(map['desiredMaxColumns']),
        desiredMaxRows: JsonClass.parseInt(map['desiredMaxRows']),
        horizontalFirst: map['horizontalFirst'] == null
            ? null
            : JsonClass.parseBool(map['horizontalFirst']),
        entryTextStyle: decodeTextStyleSpec(
          map['entryTextStyle'],
          validate: false,
        ),
        insideJustification: decodeInsideJustification(
          map['insideJustification'],
          validate: false,
        ),
        legendDefaultMeasure: decodeLegendDefaultMeasure(
          map['legendDefaultMeasure'],
          validate: false,
        ),
        measureFormatter: map['measureFormatter'],
        outsideJustification: decodeOutsideJustification(
          map['outsideJustification'],
          validate: false,
        ),
        position: decodeBehaviorPosition(
          map['position'],
          validate: false,
        ),
        secondaryMeasureFormatter: map['secondaryMeasureFormatter'],
        showMeasures: map['showMeasures'] == null
            ? null
            : JsonClass.parseBool(map['showMeasures']),
      );
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
        tickFormatterSpec: decodeDateTimeTickFormatterSpec(
          map['tickFormatterSpec'],
          validate: false,
        ),
        tickProviderSpec: map['tickProviderSpec'],
        viewport: decodeDateTimeExtents(
          map['viewport'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Expects the [map] to be either a [charts.FillPatternType] or a [String]
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

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "hintDuration": <Duration>,
  ///   "maxHintScaleFactor": <double>,
  ///   "maxHintTranslate": <double>
  /// }
  /// ```
  static charts.InitialHintBehavior<D>? decodeInitialHintBehavior<D>(
    dynamic map, {
    bool validate = false,
  }) {
    charts.InitialHintBehavior<D>? result;

    if (map is charts.InitialHintBehavior<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/initial_hint_behavior',
        value: map,
        validate: validate,
      ));
      result = charts.InitialHintBehavior<D>(
        hintDuration: JsonClass.parseDurationFromMillis(map['hintDuration']),
        maxHintScaleFactor: JsonClass.parseDouble(map['maxHintScaleFactor']),
        maxHintTranslate: JsonClass.parseDouble(map['maxHintTranslate']),
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "selectedDataConfig": <List<SeriesDatumConfig>>,
  ///   "selectedSeriesConfig": <List<String>>,
  ///   "selectionModelType": <SelectionModelType>,
  ///   "shouldPreserveSelectionOnDraw": <bool>
  /// }
  /// ```
  ///
  /// See also
  /// * [decodeSeriesDatumConfigList]
  /// * [decodeSelectionModelType]
  static charts.InitialSelection<D>? decodeInitialSelection<D>(
    dynamic map, {
    bool validate = false,
  }) {
    charts.InitialSelection<D>? result;

    if (map is charts.InitialSelection<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/initial_selection',
        value: map,
        validate: validate,
      ));
      result = charts.InitialSelection<D>(
        selectedDataConfig: decodeSeriesDatumConfigList(
          map['selectedDataConfig'],
          validate: false,
        ),
        selectedSeriesConfig: map['selectedSeriesConfig'] == null
            ? null
            : List<String>.from(map['selectedSeriesConfig']),
        selectionModelType: decodeSelectionModelType(
              map['selectionModelType'],
              validate: false,
            ) ??
            common.SelectionModelType.info,
        shouldPreserveSelectionOnDraw: JsonClass.parseBool(
          map['shouldPreserveSelectionOnDraw'],
        ),
      );
    }

    return result;
  }

  /// Expects the [map] to be either a [charts.InsideJustification] or a
  /// [String] containing one of the following values:
  ///
  /// * `topEnd`
  /// * `topStart`
  static charts.InsideJustification? decodeInsideJustification(
    dynamic map, {
    bool validate = true,
  }) {
    charts.InsideJustification? result;

    if (map is charts.InsideJustification) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/inside_justification',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'topEnd':
          result = charts.InsideJustification.topEnd;
          break;

        case 'topStart':
          result = charts.InsideJustification.topStart;
          break;

        default:
          throw Exception('Unknown [InsideJustification] encountered: [$map]');
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

  /// Expects the [map] to be either a [charts.LegendDefaultMeasure] or a
  /// [String] containing one of the following values:
  ///
  /// * `average`
  /// * `firstValue`
  /// * `lastValue`
  /// * `none`
  /// * `sum`
  static charts.LegendDefaultMeasure? decodeLegendDefaultMeasure(
    dynamic map, {
    bool validate = true,
  }) {
    charts.LegendDefaultMeasure? result;

    if (map is charts.LegendDefaultMeasure) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/legend_default_measure',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'average':
          result = charts.LegendDefaultMeasure.average;
          break;

        case 'firstValue':
          result = charts.LegendDefaultMeasure.firstValue;
          break;

        case 'lastValue':
          result = charts.LegendDefaultMeasure.lastValue;
          break;

        case 'none':
          result = charts.LegendDefaultMeasure.none;
          break;

        case 'sum':
          result = charts.LegendDefaultMeasure.sum;
          break;

        default:
          throw Exception('Unknown [LegendDefaultMeasure] encountered: [$map]');
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "dashPattern": <List<int>>,
  ///   "defaultRadiusPx": <double>,
  ///   "drawFollowLinesAcrossChart": <bool>,
  ///   "radiusPaddingPx": <double>,
  ///   "selectionModelType": <SelectionModelType>,
  ///   "showHorizontalFollowLine": <LinePointHighlighterFollowLineType>,
  ///   "showVerticalFollowLine": <LinePointHighlighterFollowLineType>,
  ///   "symbolRenderer": <SymbolRenderer>
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeLinePointHighlighterFollowLineType]
  /// * [decodeSelectionModelType]
  static charts.LinePointHighlighter<D>? decodeLinePointHighlighter<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.LinePointHighlighter<D>? result;

    if (map is charts.LinePointHighlighter<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/line_point_highlighter',
        value: map,
        validate: validate,
      ));
      result = charts.LinePointHighlighter<D>(
        dashPattern: map['dashPattern'] == null
            ? null
            : List<int>.from(
                map['dashPattern'].map((e) => JsonClass.parseInt(e)!),
              ),
        defaultRadiusPx: JsonClass.parseDouble(map['defaultRadiusPx']),
        drawFollowLinesAcrossChart: map['drawFollowLinesAcrossChart'] == null
            ? null
            : JsonClass.parseBool(map['drawFollowLinesAcrossChart']),
        radiusPaddingPx: JsonClass.parseDouble(map['radiusPaddingPx']),
        selectionModelType: decodeSelectionModelType(
          map['selectionModelType'],
          validate: false,
        ),
        showHorizontalFollowLine: decodeLinePointHighlighterFollowLineType(
          map['showHorizontalFollowLine'],
          validate: false,
        ),
        showVerticalFollowLine: decodeLinePointHighlighterFollowLineType(
          map['showVerticalFollowLine'],
          validate: false,
        ),
        symbolRenderer: decodeSymbolRenderer(
          map['symbolRenderer'],
          validate: false,
        ),
      );
    }

    return result;
  }

  /// Expects the [map] to be either a
  /// [charts.LinePointHighlighterFollowLineType] or a [String] containing one
  /// of the following values:
  ///
  /// * `all`
  /// * `nearest`
  /// * `none`
  static common.LinePointHighlighterFollowLineType?
      decodeLinePointHighlighterFollowLineType(
    dynamic map, {
    bool validate = true,
  }) {
    common.LinePointHighlighterFollowLineType? result;

    if (map is common.LinePointHighlighterFollowLineType) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/line_point_highlighter_follow_line_type',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'all':
          result = common.LinePointHighlighterFollowLineType.all;
          break;

        case 'nearest':
          result = common.LinePointHighlighterFollowLineType.nearest;
          break;

        case 'none':
          result = common.LinePointHighlighterFollowLineType.none;
          break;

        default:
          throw Exception(
            '[decodeLinePointHighlighterFollowLineType]: unknown type encountered: [$map]',
          );
      }
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
            : List<int>.from(
                map['dashPattern'].map((e) => JsonClass.parseInt(e)!),
              ),
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
            : List<int>.from(
                map['dashPattern'].map((e) => JsonClass.parseInt(e)!),
              ),
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
      final type = map['type'];

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

  /// Expects the [map] to be either a [common.MaxWidthStrategy] or a
  /// [String] containing one of the following values:
  ///
  /// * `ellipsize`
  /// * `truncate`
  static common.MaxWidthStrategy? decodeMaxWidthStrategy(
    dynamic map, {
    bool validate = true,
  }) {
    common.MaxWidthStrategy? result;

    if (map is common.MaxWidthStrategy) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/max_width_strategy',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'ellipsize':
          result = common.MaxWidthStrategy.ellipsize;
          break;

        case 'truncate':
          result = common.MaxWidthStrategy.truncate;
          break;

        default:
          throw Exception(
            '[decodeMaxWidthStrategy]: map is not supported: [$map]',
          );
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
      final type = map['type'];

      if (type == 'bucketing') {
        result = decodeBucketingAxisSpec(
          map,
          validate: false,
        );
      } else if (type == 'percent') {
        result = decodePercentAxisSpec<num>(
          map,
          validate: false,
        );
      } else {
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
          tickFormatterSpec: decodeNumericTickFormatterSpec(
            map['tickFormatterSpec'],
            validate: false,
          ),
          tickProviderSpec: decodeNumericTickProviderSpec(
            map['tickProviderSpec'],
          ),
          viewport: decodeNumericExtents(
            map['viewport'],
            validate: false,
          ),
        );
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "max": <double>,
  ///   "min": <double>
  /// }
  /// ```
  static common.NumericExtents? decodeNumericExtents(
    dynamic map, {
    bool validate = false,
  }) {
    common.NumericExtents? result;

    if (map is common.NumericExtents) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/numeric_extents',
        value: map,
        validate: validate,
      ));

      result = common.NumericExtents(
        JsonClass.parseInt(map['min'])!,
        JsonClass.parseInt(map['max'])!,
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "format": <String>
  /// }
  /// ```
  static charts.NumericTickFormatterSpec? decodeNumericTickFormatterSpec<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.NumericTickFormatterSpec? result;

    if (map is charts.NumericTickFormatterSpec) {
      result = map;
    } else if (map is NumberFormat) {
      result = charts.BasicNumericTickFormatterSpec.fromNumberFormat(map);
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/tick_formatter_spec',
        value: map,
        validate: validate,
      ));
      result = charts.BasicNumericTickFormatterSpec.fromNumberFormat(
        NumberFormat(map['format']?.toString() ?? '###,##0'),
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "dataIsInWholeNumbers": <bool>,
  ///   "desiredMaxTickCount": <int>,
  ///   "desiredMinTickCount": <int>,
  ///   "desiredTickCount": <int>,
  ///   "ticks": <List<TickSpec<num>>,
  ///   "type": <"basic" | "bucketing" | "end_points" | "static">,
  ///   "zeroBound": <bool>
  /// }
  /// ```
  static common.NumericTickProviderSpec? decodeNumericTickProviderSpec(
    dynamic map, {
    bool validate = true,
  }) {
    common.NumericTickProviderSpec? result;

    if (map is common.NumericTickProviderSpec) {
      result = map;
    } else if (map != null) {
      final type = map['type'];

      switch (type) {
        case 'basic':
          result = common.BasicNumericTickProviderSpec(
            dataIsInWholeNumbers: map['dataIsInWholeNumbers'] == null
                ? null
                : JsonClass.parseBool(map['dataIsInWholeNumbers']),
            desiredMaxTickCount: JsonClass.parseInt(map['desiredMaxTickCount']),
            desiredMinTickCount: JsonClass.parseInt(map['desiredMinTickCount']),
            desiredTickCount: JsonClass.parseInt(map['desiredTickCount']),
            zeroBound: map['zeroBound'] == null
                ? null
                : JsonClass.parseBool(map['zeroBound']),
          );
          break;

        case 'bucketing':
          result = common.BucketingNumericTickProviderSpec(
            dataIsInWholeNumbers: map['dataIsInWholeNumbers'] == null
                ? null
                : JsonClass.parseBool(map['dataIsInWholeNumbers']),
            desiredMaxTickCount: JsonClass.parseInt(map['desiredMaxTickCount']),
            desiredMinTickCount: JsonClass.parseInt(map['desiredMinTickCount']),
            desiredTickCount: JsonClass.parseInt(map['desiredTickCount']),
            zeroBound: map['zeroBound'] == null
                ? null
                : JsonClass.parseBool(map['zeroBound']),
          );
          break;

        case 'end_points':
          result = const common.NumericEndPointsTickProviderSpec();
          break;

        case 'static':
          result = common.StaticNumericTickProviderSpec(
            decodeTickSpecList<num>(map['ticks'])!,
          );
          break;

        default:
          throw Exception(
            '[decodeNumericTickProviderSpec]: unknown type encountered: [$type]',
          );
      }
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
  ///   "viewport": <OrdinalViewport>
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeOrdinalTickFormatterSpec]
  /// * [decodeOrdinalTickProviderSpec]
  /// * [decodeOrdinalViewport]
  /// * [decodeRenderSpec]
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
        tickFormatterSpec: decodeOrdinalTickFormatterSpec(
          map['tickFormatterSpec'],
          validate: false,
        ),
        tickProviderSpec: decodeOrdinalTickProviderSpec(
          map['tickProviderSpec'],
          validate: false,
        ),
        viewport: decodeOrdinalViewport(
          map['viewport'],
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
  /// }
  /// ```
  static charts.OrdinalTickFormatterSpec? decodeOrdinalTickFormatterSpec(
    dynamic map, {
    bool validate = true,
  }) {
    charts.OrdinalTickFormatterSpec? result;

    if (map is charts.OrdinalTickFormatterSpec) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/tick_formatter_spec',
        value: map,
        validate: validate,
      ));

      result = const charts.BasicOrdinalTickFormatterSpec();
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "ticks": <List<TickSpec>>,
  ///   "type": <"basic" | "static">
  /// }
  /// ```
  static charts.OrdinalTickProviderSpec? decodeOrdinalTickProviderSpec(
    dynamic map, {
    bool validate = true,
  }) {
    charts.OrdinalTickProviderSpec? result;

    if (map is charts.OrdinalTickProviderSpec) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/ordinal_tick_provider_spec',
        value: map,
        validate: validate,
      ));

      final type = map['type'];

      switch (type) {
        case 'basic':
          result = const charts.BasicOrdinalTickProviderSpec();
          break;

        case 'static':
          result = charts.StaticOrdinalTickProviderSpec(
            decodeTickSpecList<String>(
              map['ticks'],
              validate: false,
            )!,
          );
          break;

        default:
          throw Exception(
            '[decodeOrdinalTickProviderSpec]: unknown type encountered: [$type]',
          );
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "dataSize": <int>,
  ///   "startingDomain": <String>
  /// }
  /// ```
  static common.OrdinalViewport? decodeOrdinalViewport(
    dynamic map, {
    bool validate = true,
  }) {
    common.OrdinalViewport? result;

    if (map is common.OrdinalViewport) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/ordinal_viewport',
        value: map,
        validate: validate,
      ));

      result = common.OrdinalViewport(
        map['start']!.toString(),
        JsonClass.parseInt(map['dataSize'])!,
      );
    }

    return result;
  }

  /// Expects the [map] to be either a [charts.OutsideJustification] or a
  /// [String] containing one of the following values:
  ///
  /// * `end`
  /// * `endDrawArea`
  /// * `middle`
  /// * `middleDrawArea`
  /// * `start`
  /// * `startDrawArea`
  static charts.OutsideJustification? decodeOutsideJustification(
    dynamic map, {
    bool validate = true,
  }) {
    charts.OutsideJustification? result;

    if (map is charts.OutsideJustification) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/outside_justification',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'end':
          result = charts.OutsideJustification.end;
          break;

        case 'endDrawArea':
          result = charts.OutsideJustification.endDrawArea;
          break;

        case 'middle':
          result = charts.OutsideJustification.middle;
          break;

        case 'middleDrawArea':
          result = charts.OutsideJustification.middleDrawArea;
          break;

        case 'start':
          result = charts.OutsideJustification.start;
          break;

        case 'startDrawArea':
          result = charts.OutsideJustification.startDrawArea;
          break;

        default:
          throw Exception('Unknown [OutsideJustification] encountered: [$map]');
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "panningCompletedCallback": <VoidCallback>
  /// }
  /// ```
  static charts.PanAndZoomBehavior<D>? decodePanAndZoomBehavior<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.PanAndZoomBehavior<D>? result;

    if (map is charts.PanAndZoomBehavior<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/pan_and_zoom_behavior',
        value: map,
        validate: validate,
      ));
      result = charts.PanAndZoomBehavior<D>(
        panningCompletedCallback: map['panningCompletedCallback'],
      );
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "renderSpec": <RenderSpec>,
  ///   "showAxisLine": <bool>,
  ///   "tickFormatterSpec": <NumericTickFormatterSpec>,
  ///   "tickProviderSpec": <NumericTickProviderSpec>,
  ///   "viewport": <NumericExtents>
  /// }
  /// ```
  static charts.PercentAxisSpec? decodePercentAxisSpec<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.PercentAxisSpec? result;

    if (map is charts.PercentAxisSpec) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/percent_axis_spec',
        value: map,
        validate: validate,
      ));
      result = charts.PercentAxisSpec(
        renderSpec: decodeRenderSpec(
          map['renderSpec'],
          validate: false,
        ),
        showAxisLine: map['showAxisLine'] == null
            ? null
            : JsonClass.parseBool(map['showAxisLine']),
        tickFormatterSpec: decodeNumericTickFormatterSpec(
          map['tickFormatterSpec'],
          validate: false,
        ),
        tickProviderSpec: decodeNumericTickProviderSpec(
          map['tickProviderSpec'],
          validate: false,
        ),
        viewport: decodeNumericExtents(
          map['viewport'],
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
  ///   "totalType": <PercentInjectorTotalType>
  /// }
  /// ```
  static charts.PercentInjector<D>? decodePercentInjector<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.PercentInjector<D>? result;

    if (map is charts.PercentInjector<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/percent_injector',
        value: map,
        validate: validate,
      ));
      result = charts.PercentInjector<D>(
        totalType: decodePercentInjectorTotalType(
              map['totalType'],
              validate: false,
            ) ??
            common.PercentInjectorTotalType.domain,
      );
    }

    return result;
  }

  /// Expects the [map] to be either a [common.PercentInjectorTotalType] or a
  /// [String] containing one of the following values:
  ///
  /// * `domain`
  /// * `domainBySeriesCategory`
  /// * `series`
  static common.PercentInjectorTotalType? decodePercentInjectorTotalType(
    dynamic map, {
    bool validate = true,
  }) {
    common.PercentInjectorTotalType? result;

    if (map is common.PercentInjectorTotalType) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/percent_injector_total_type',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'domain':
          result = common.PercentInjectorTotalType.domain;
          break;

        case 'domainBySeriesCategory':
          result = common.PercentInjectorTotalType.domainBySeriesCategory;
          break;

        case 'series':
          result = common.PercentInjectorTotalType.series;
          break;

        default:
          throw Exception(
            '[decodePercentInjectorTotalType]: unknown type: [$map]',
          );
      }
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
        pointRendererDecorators: decodePointRendererDecoratorList<D>(
                map['pointRendererDecorators']) ??
            const [],
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
  ///   "symbolRenderer": <PointSymbolRenderer>,
  ///   "type": "comparison_points"
  /// }
  /// ```
  ///
  /// See also
  /// * [decodePointSymbolRenderer]
  static common.PointRendererDecorator<D>? decodePointRendererDecorator<D>(
    dynamic map, {
    bool validate = true,
  }) {
    common.PointRendererDecorator<D>? result;

    if (map is common.PointRendererDecorator<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/point_renderer_decorator',
        value: map,
        validate: validate,
      ));

      final type = map['type'];

      switch (type) {
        case 'comparison_points':
          result = common.ComparisonPointsDecorator(
            symbolRenderer: decodePointSymbolRenderer(map['symbolRenderer']),
          );
          break;

        default:
          throw Exception(
            '[decodePointRendererDecorator]: unknown type: [$type]',
          );
      }
    }

    return result;
  }

  static List<common.PointRendererDecorator<D>>?
      decodePointRendererDecoratorList<D>(
    dynamic map, {
    bool validate = true,
  }) {
    List<common.PointRendererDecorator<D>>? result;

    if (map is List) {
      result = [];
      for (var item in map) {
        result.add(
          decodePointRendererDecorator<D>(
            item,
            validate: false,
          )!,
        );
      }
    } else if (map is common.PointRendererDecorator<D>) {
      result = <common.PointRendererDecorator<D>>[map];
    } else if (map is Map) {
      result = <common.PointRendererDecorator<D>>[
        decodePointRendererDecorator(
          map,
          validate: false,
        )!
      ];
    } else if (map != null) {
      throw Exception(
        '[decodePointRendererDecoratorList]: Unknown data: [$map]',
      );
    }

    return result;
  }

  /// Expects the [map] to be either a [common.PointSymbolRenderer] or a
  /// [String] containing one of the following values:
  ///
  /// * `cylinder`
  /// * `rectangle`
  static common.PointSymbolRenderer? decodePointSymbolRenderer(
    dynamic map, {
    bool validate = true,
  }) {
    common.PointSymbolRenderer? result;

    if (map is common.PointSymbolRenderer) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/point_symbol_renderer',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'cylinder':
          result = common.CylinderSymbolRenderer();
          break;

        case 'rectangle':
          result = common.RectangleRangeSymbolRenderer();
          break;

        default:
          throw Exception(
            '[decodePointSymbolRenderer]: unknown type: [$map]',
          );
      }
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
      final type = map['type'];
      switch (type) {
        case 'gridline':
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
      result = <charts.SelectionModelConfig<T>>[];
      for (var item in map) {
        result.add(
          decodeSelectionModelConfig(
            item,
            validate: false,
          )!,
        );
      }
    } else if (map is charts.SelectionModelConfig<T>) {
      result = <charts.SelectionModelConfig<T>>[map];
    } else if (map is Map) {
      result = <charts.SelectionModelConfig<T>>[
        decodeSelectionModelConfig(
          map,
          validate: false,
        )!
      ];
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

    try {
      if (map is charts.Series<T, D>) {
        result = map;
      } else if (map is charts.Series<T, T>) {
        throw Exception(
          '[decodeSeries]: Expected a series of [charts.Series<${T.toString()}, ${D.toString()}>}] but received a series of [charts.Series<${T.toString()}, ${T.toString()}>}].',
        );
      } else if (map is charts.Series<D, D>) {
        throw Exception(
          '[decodeSeries]: Expected a series of [charts.Series<${T.runtimeType}, ${D.runtimeType}>}] but received a series of [charts.Series<${D.runtimeType}, ${D.runtimeType}>}].',
        );
      } else if (map == null) {
        throw Exception('[decodeSeries]: map is null');
      } else if (map is String) {
        throw Exception(
          '[decodeSeries]: Invalid series, encountered a String.\n$map',
        );
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
    } catch (e, stack) {
      _logger.severe('Error decoding series: $map', e, stack);
      rethrow;
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "seriesId": <String>,
  ///   "domainValue": <D>
  /// }
  /// ```
  static common.SeriesDatumConfig<D>? decodeSeriesDatumConfig<D>(
    dynamic map, {
    bool validate = true,
  }) {
    common.SeriesDatumConfig<D>? result;

    if (map is common.SeriesDatumConfig<D>) {
      result = map;
    } else if (map != null) {
      result = common.SeriesDatumConfig<D>(
        map['seriesId'],
        JsonClass.parseValue<D>(map['domainValue'])!,
      );
    }

    return result;
  }

  static List<common.SeriesDatumConfig<D>>? decodeSeriesDatumConfigList<D>(
    dynamic map, {
    bool validate = true,
  }) {
    List<common.SeriesDatumConfig<D>>? result;

    if (map is common.SeriesDatumConfig) {
      result = <common.SeriesDatumConfig<D>>[
        map as common.SeriesDatumConfig<D>
      ];
    } else if (map is Map) {
      map = <common.SeriesDatumConfig<D>>[
        decodeSeriesDatumConfig(
          map,
          validate: false,
        )!
      ];
    } else if (map is Iterable) {
      result = [];
      for (var item in map) {
        result.add(decodeSeriesDatumConfig<D>(
          item,
          validate: false,
        )!);
      }
    } else {
      throw Exception(
          '[decodeSeriesDatumConfig]: map is not supported: [$map]');
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

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "cellPadding": <EdgeInsets>,
  ///   "defaultHiddenSeries": <List<String>>,
  ///   "desiredMaxColumns": <int>,
  ///   "desiredMaxRows": <int>,
  ///   "horizontalFirst": <bool>,
  ///   "entryTextStyle": <common.TextStyleSpec>,
  ///   "insideJustification": <charts.InsideJustification>,
  ///   "legendDefaultMeasure": <charts.LegendDefaultMeasure>,
  ///   "measureFormatter": <common.MeasureFormatter>,
  ///   "outsideJustification": <charts.OutsideJustification>,
  ///   "position": <BehaviorPosition>,
  ///   "secondaryMeasureFormatter": <common.MeasureFormatter>,
  ///   "showMeasures": <bool>,
  ///   "type": "series_legend"
  /// }
  /// ```
  ///
  /// See also
  /// * [decodeBehaviorPosition]
  /// * [decodeInsideJustification]
  /// * [decodeLegendDefaultMeasure]
  /// * [decodeOutsideJustification]
  /// * [decodeTextStyleSpec]
  /// * [ThemeDecoder.decodeEdgeInsetsGeometry]
  static charts.SeriesLegend<D>? decodeSeriesLegend<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.SeriesLegend<D>? result;

    if (map is charts.SeriesLegend<D>) {
      result = map;
    } else if (map != null) {
      result = charts.SeriesLegend<D>(
        cellPadding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['cellPadding'],
          validate: false,
        ) as EdgeInsets?,
        defaultHiddenSeries: map['defaultHiddenSeries'] == null
            ? null
            : List<String>.from(map['defaultHiddenSeries']),
        desiredMaxColumns: JsonClass.parseInt(map['desiredMaxColumns']),
        desiredMaxRows: JsonClass.parseInt(map['desiredMaxRows']),
        horizontalFirst: map['horizontalFirst'] == null
            ? null
            : JsonClass.parseBool(map['horizontalFirst']),
        entryTextStyle: decodeTextStyleSpec(
          map['entryTextStyle'],
          validate: false,
        ),
        insideJustification: decodeInsideJustification(
          map['insideJustification'],
          validate: false,
        ),
        legendDefaultMeasure: decodeLegendDefaultMeasure(
          map['legendDefaultMeasure'],
          validate: false,
        ),
        measureFormatter: map['measureFormatter'],
        outsideJustification: decodeOutsideJustification(
          map['outsideJustification'],
          validate: false,
        ),
        position: decodeBehaviorPosition(
          map['position'],
          validate: false,
        ),
        secondaryMeasureFormatter: map['secondaryMeasureFormatter'],
        showMeasures: map['showMeasures'] == null
            ? null
            : JsonClass.parseBool(map['showMeasures']),
      );
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

      final type = map['type'];
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
            'Unknown [SeriesRendererConfig.type] encountered: [$type]',
          );
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
      result = <common.SeriesRendererConfig<T>>[map];
    } else if (map is Map) {
      result = <common.SeriesRendererConfig<T>>[
        decodeSeriesRendererConfig<T>(
          map,
          validate: false,
        )!
      ];
    } else if (map is List) {
      result = <common.SeriesRendererConfig<T>>[];
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
  ///   "eventTrigger": <SelectionTrigger>,
  ///   "handleRenderer": <SymbolRenderer>,
  ///   "initialDomainValue": <D>,
  ///   "layoutPaintOrder": <int>,
  ///   "onChangeCallback": <SliderListenerCallback>,
  ///   "roleId": <String>,
  ///   "snapToDatum": <bool>,
  ///   "style": <SliderStyle>
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeSelectionTrigger]
  /// * [decodeSymbolRenderer]
  /// * [decodeSliderStyle]
  static charts.Slider<D>? decodeSlider<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.Slider<D>? result;

    if (map is charts.Slider<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/slider',
        value: map,
        validate: validate,
      ));
      result = charts.Slider<D>(
        eventTrigger: decodeSelectionTrigger(
          map['eventTrigger'],
          validate: false,
        ),
        handleRenderer: decodeSymbolRenderer(
          map['handleRenderer'],
          validate: false,
        ),
        initialDomainValue: JsonClass.parseValue<D>(map['initialDomainValue']),
        layoutPaintOrder: JsonClass.parseInt(map['layoutPaintOrder']) ??
            common.LayoutViewPaintOrder.slider,
        onChangeCallback: map['onChangeCallback'],
        roleId: map['roleId']?.toString(),
        snapToDatum: JsonClass.parseBool(map['snapToDatum']),
        style: decodeSliderStyle(
          map['style'],
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
  ///   "fillColor": <Color>,
  ///   "handleOffset": <Point>,
  ///   "handlePosition": <SliderHandlePosition>,
  ///   "handleSize": <Rectangle>,
  ///   "strokeColor": <Color>,
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeSelectionTrigger]
  /// * [decodeSymbolRenderer]
  /// * [decodeSliderStyle]
  static charts.SliderStyle? decodeSliderStyle(
    dynamic map, {
    bool validate = true,
  }) {
    charts.SliderStyle? result;

    if (map is charts.SliderStyle) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/slider_style',
        value: map,
        validate: validate,
      ));
      result = charts.SliderStyle(
        fillColor: decodeColor(
          map['fillColor'],
          validate: false,
        ),
        handleOffset: map['point'] == null
            ? const Point<double>(0, 0)
            : Point<double>(
                JsonClass.parseDouble(map['point']['x'])!,
                JsonClass.parseDouble(map['point']['y'])!,
              ),
        handlePosition: decodeSliderHandlePosition(
              map['handlePosition'],
              validate: false,
            ) ??
            common.SliderHandlePosition.middle,
        handleSize: map['handleSize'] == null
            ? const Rectangle(0, 0, 10, 20)
            : Rectangle(
                JsonClass.parseInt(map['handleSize']['left'])!,
                JsonClass.parseInt(map['handleSize']['top'])!,
                JsonClass.parseInt(map['handleSize']['width'])!,
                JsonClass.parseInt(map['handleSize']['height'])!,
              ),
        strokeColor: decodeColor(
          map['strokeColor'],
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
  ///   "selectionModelType": <SelectionModelType>
  /// }
  /// ```
  ///
  /// See also:
  /// * [decodeSelectionModelType]
  static charts.SlidingViewport<D>? decodeSlidingViewport<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.SlidingViewport<D>? result;

    if (map is charts.SlidingViewport<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/sliding_viewport',
        value: map,
        validate: validate,
      ));
      result = charts.SlidingViewport<D>(
        decodeSelectionModelType(
              map['selectionModelType'],
              validate: false,
            ) ??
            common.SelectionModelType.info,
      );
    }

    return result;
  }

  /// Expects the [map] to be either a [common.SliderHandlePosition] or a
  /// [String] containing one of the following values:
  ///
  /// * `manual`
  /// * `middle`
  /// * `top`
  static common.SliderHandlePosition? decodeSliderHandlePosition(
    dynamic map, {
    bool validate = true,
  }) {
    common.SliderHandlePosition? result;

    if (map is common.SliderHandlePosition) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/slider_handle_position',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'manual':
          result = common.SliderHandlePosition.manual;
          break;

        case 'middle':
          result = common.SliderHandlePosition.middle;
          break;

        case 'top':
          result = common.SliderHandlePosition.top;
          break;

        default:
          throw Exception(
            '[decodeSliderHandlePosition]: map is not supported: [$map]',
          );
      }
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
  ///   "dashPattern": <List<int>>,
  ///   "isSolid": <bool>,
  ///   "radius": <double>,
  ///   "strokeWidth": <double>,
  ///   "type": <"circle" | "icon" | "line" | "rect" | "rounded_rect" | "triangle">
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
      final type = map['type'];

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

        case 'icon':
          result = IconSymbolRenderer(
            map['icon'],
            JsonClass.parseDouble(
              map['size'],
            ),
          );
          break;

        case 'line':
          result = common.LineSymbolRenderer(
            dashPattern: map['dashPattern'] == null
                ? null
                : List<int>.from(
                    map['dashPattern'].map((e) => JsonClass.parseInt(e)!),
                  ),
            isSolid: map['isSolid'] == null
                ? true
                : JsonClass.parseBool(
                    map['isSolid'],
                    whenNull: true,
                  ),
            strokeWidth: JsonClass.parseDouble(map['strokeWidth']),
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

        case 'rounded_rect':
          result = common.RoundedRectSymbolRenderer(
            isSolid: map['isSolid'] == null
                ? true
                : JsonClass.parseBool(
                    map['isSolid'],
                    whenNull: true,
                  ),
            radius: JsonClass.parseDouble(map['radius']),
          );
          break;

        case 'triangle':
          result = common.TriangleSymbolRenderer(
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

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "format": <String>,
  ///   "type": <"date_time" | "numeric" | "ordinal">
  /// }
  /// ```
  static charts.TickFormatterSpec<D>? decodeTickFormatterSpec<D>(
    dynamic map, {
    bool validate = true,
  }) {
    charts.TickFormatterSpec? result;

    if (map is charts.TickFormatterSpec<D>) {
      result = map;
    } else if (map is DateFormat) {
      result = decodeDateTimeTickFormatterSpec(
        map,
        validate: false,
      );
    } else if (map is NumberFormat) {
      result = decodeNumericTickFormatterSpec(
        map,
        validate: false,
      );
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/tick_formatter_spec',
        value: map,
        validate: validate,
      ));
      final type = map['type'];
      switch (type) {
        case 'auto_date_time':
        case 'date_time':
          result = decodeDateTimeTickFormatterSpec(
            map,
            validate: false,
          );
          break;

        case 'numeric':
          result = decodeNumericTickFormatterSpec(
            map,
            validate: false,
          );
          break;

        case 'ordinal':
          result = decodeOrdinalTickFormatterSpec(
            map,
            validate: false,
          );
          break;

        default:
          throw Exception(
            '[decodeTickFormatterSpec]: unknown type encountered: [$type]',
          );
      }
    }

    return result as charts.TickFormatterSpec<D>?;
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

  /// Expects the [map] to be either a [charts.TickLabelJustification] or a
  /// [String] containing one of the following values:
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

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "label": <String>,
  ///   "style": <TextStyleSpec>,
  ///   "value": <D>
  /// }
  /// ```
  static common.TickSpec<D>? decodeTickSpec<D>(
    dynamic map, {
    bool validate = true,
  }) {
    common.TickSpec<D>? result;

    if (map is common.TickSpec<D>) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/tick_spec',
        value: map,
        validate: validate,
      ));
      result = common.TickSpec<D>(
        JsonClass.parseValue<D>(map['value']),
        label: map['label'],
        style: decodeTextStyleSpec(
          map['style'],
          validate: false,
        ),
      );
    }

    return result;
  }

  static List<common.TickSpec<D>>? decodeTickSpecList<D>(
    dynamic map, {
    bool validate = true,
  }) {
    List<common.TickSpec<D>>? result;

    if (map is List<common.TickSpec<D>>) {
      result = map;
    } else if (map is common.TickSpec<D>) {
      result = <common.TickSpec<D>>[map];
    } else if (map is List) {
      result = <common.TickSpec<D>>[];
      for (var item in map) {
        result.add(decodeTickSpec(item, validate: false)!);
      }
    } else if (map is Map) {
      result = <common.TickSpec<D>>[decodeTickSpec(map, validate: false)!];
    } else if (map != null) {
      throw Exception('[decodeTickSpecList]: unknown map type: [$map]');
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "format": <String>,
  ///   "noonFormat": <String>,
  ///   "transitionFormat": <String>
  /// }
  /// ```
  static common.TimeFormatterSpec? decodeTimeFormatterSpec(
    dynamic map, {
    bool validate = true,
  }) {
    common.TimeFormatterSpec? result;

    if (map is common.TimeFormatterSpec) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/time_formatter_spec',
        value: map,
        validate: validate,
      ));
      result = common.TimeFormatterSpec(
        format: map['format']?.toString(),
        noonFormat: map['noonFormat']?.toString(),
        transitionFormat: map['transitionFormat']?.toString(),
      );
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
