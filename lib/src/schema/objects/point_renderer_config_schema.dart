import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class PointRendererConfigSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/point_renderer_config.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/PointRendererConfig-class.html',
    'title': 'PointRendererConfig',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'boundsLineRadiusPx': SchemaHelper.numberSchema,
      'customRendererId': SchemaHelper.stringSchema,
      'customSymbolRenderers': SchemaHelper.anySchema,
      'layoutPaintOrder': SchemaHelper.numberSchema,
      'pointRendererDecorators': SchemaHelper.stringSchema,
      'radiusPx': SchemaHelper.numberSchema,
      'strokeWidthPx': SchemaHelper.numberSchema,
      'symbolRenderer': SchemaHelper.objectSchema(SymbolRendererSchema.id),
      'type': {
        'type': 'string',
        'enum': [
          'point',
        ],
      },
    },
  };
}
