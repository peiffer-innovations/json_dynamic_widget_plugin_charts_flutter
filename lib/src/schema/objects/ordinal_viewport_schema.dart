import 'package:json_theme/json_theme_schemas.dart';

class OrdinalViewportSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/ordinal_viewport.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/OrdinalViewport-class.html',
    'title': 'OrdinalViewport',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dataSize': SchemaHelper.numberSchema,
      'start': SchemaHelper.stringSchema,
    },
  };
}
