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
      'isSolid': SchemaHelper.boolSchema,
      'type': {
        'type': 'string',
        'enum': [
          'circle',
          'rect',
        ],
      },
    },
  };
}
