import 'package:charts_common/common.dart' as common;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_theme/json_theme.dart';
import 'package:json_theme/json_theme_schemas.dart';

class JsonChartsDecoder {
  static const _baseSchemaUrl =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter';

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
        case 'numeric':
          result = decodeNumericAxisSpec(map);
          break;

        case 'ordinal':
          result = charts.OrdinalAxisSpec(
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
            viewport: map['viewport'],
          );
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
  /// * [decodeCornerStrategy]
  /// * [decodeFillPatternType]
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
        case 'target_line':
          result = charts.BarTargetLineRendererConfig(
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
            symbolRenderer: map['symbolRenderer'],
            weightPattern: map['weightPattern'] == null
                ? null
                : ((map['weightPattern'] as List)
                    .map((e) => JsonClass.parseInt(e)!)).toList(),
          );
          break;

        default:
          result = charts.BarRendererConfig(
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
            symbolRenderer: map['symbolRenderer'],
            weightPattern: map['weightPattern'] == null
                ? null
                : ((map['weightPattern'] as List)
                    .map((e) => JsonClass.parseInt(e)!)).toList(),
          );
      }
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

  /// Expects the [map] to be either a [charts.Color], a [Color], or a [String]
  /// containing the hex value of the color to use.
  static charts.Color? decodeColor(
    dynamic map, {
    bool validate = true,
  }) {
    charts.Color? result;

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
          } else {}
          break;
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

  static charts.Color fromColor(Color color) => charts.Color(
        a: color.alpha,
        b: color.blue,
        r: color.red,
        g: color.green,
      );
}
