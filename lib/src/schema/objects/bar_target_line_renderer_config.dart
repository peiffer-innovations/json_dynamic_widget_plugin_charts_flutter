import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class BarTargetLineRendererConfigSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/bar_target_line_renderer_config.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/BarTargetLineRendererConfig-class.html',
    'title': 'BarTargetLineRendererConfig',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'barGroupInnerPaddingPx': SchemaHelper.numberSchema,
      'customRendererId': SchemaHelper.stringSchema,
      'dashPattern': SchemaHelper.anySchema,
      'groupingType': SchemaHelper.objectSchema(
        BarGroupingTypeSchema.id,
      ),
      'layoutPaintOrder': SchemaHelper.numberSchema,
      'minBarLengthPx': SchemaHelper.numberSchema,
      'overDrawOuterPx': SchemaHelper.numberSchema,
      'overDrawPx': SchemaHelper.numberSchema,
      'roundEndCaps': SchemaHelper.numberSchema,
      'strokeWidthPx': SchemaHelper.numberSchema,
      'symbolRenderer': SchemaHelper.stringSchema,
      'type': {
        'type': 'string',
        'enum': [
          'bar_target_line',
          'target_line',
        ],
      },
    },
    'weightPattern': {
      'anyOf': [
        {
          'type': 'string',
        },
        {
          'type': 'array',
          'items': {
            'type': 'number',
          },
        },
      ],
    },
  };
}
