import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class LineRendererConfigSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/line_renderer_config.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/BarTargetLineRendererConfig-class.html',
    'title': 'LineRendererConfig',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'areaOpacity': SchemaHelper.numberSchema,
      'customRendererId': SchemaHelper.stringSchema,
      'dashPattern': SchemaHelper.anySchema,
      'includeArea': SchemaHelper.boolSchema,
      'includeLine': SchemaHelper.boolSchema,
      'includePoints': SchemaHelper.boolSchema,
      'layoutPaintOrder': SchemaHelper.numberSchema,
      'radiusPx': SchemaHelper.numberSchema,
      'roundEndCaps': SchemaHelper.boolSchema,
      'stacked': SchemaHelper.boolSchema,
      'strokeWidthPx': SchemaHelper.numberSchema,
      'symbolRenderer': SchemaHelper.objectSchema(SymbolRendererSchema.id),
      'type': {
        'type': 'string',
        'enum': [
          'line',
        ],
      },
    },
  };
}
