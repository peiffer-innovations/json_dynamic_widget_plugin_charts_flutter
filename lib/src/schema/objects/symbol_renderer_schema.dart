import 'package:json_theme/json_theme_schemas.dart';

class SymbolRendererSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/symbol_renderer.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/SymbolRenderer-class.html',
    'title': 'SymbolRenderer',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dashPattern': SchemaHelper.anySchema,
      'icon': SchemaHelper.stringSchema,
      'isSolid': SchemaHelper.boolSchema,
      'radius': SchemaHelper.numberSchema,
      'size': SchemaHelper.numberSchema,
      'strokeWidth': SchemaHelper.numberSchema,
      'type': {
        'type': 'string',
        'enum': [
          'circle',
          'icon',
          'line',
          'rect',
          'rounded_rect',
          'triangle',
        ],
      },
    },
  };
}
