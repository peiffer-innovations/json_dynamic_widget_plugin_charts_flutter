import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class ArcRendererConfigSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/arc_renderer_config.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/ArcRendererConfig-class.html',
    'title': 'ArcRendererConfig',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'arcLength': SchemaHelper.numberSchema,
      'arcRatio': SchemaHelper.numberSchema,
      'arcRendererDecorators': SchemaHelper.stringSchema,
      'arcWidth': SchemaHelper.numberSchema,
      'customRendererId': SchemaHelper.stringSchema,
      'layoutPaintOrder': SchemaHelper.numberSchema,
      'minHoleWidthForCenterContent': SchemaHelper.numberSchema,
      'startAngle': SchemaHelper.numberSchema,
      'strokeWidthPx': SchemaHelper.numberSchema,
      'symbolRenderer': SchemaHelper.objectSchema(SymbolRendererSchema.id),
      'type': {
        'type': 'string',
        'enum': [
          'arc',
        ],
      },
    },
  };
}
