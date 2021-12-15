import 'package:json_theme/json_theme_schemas.dart';

class TextStyleSpecSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/text_style_spec.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/TextStyleSpec-class.html',
    'title': 'TextStyleSpec',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'fontFamily': SchemaHelper.stringSchema,
      'fontSize': SchemaHelper.numberSchema,
      'fontWeight': SchemaHelper.stringSchema,
      'lineHeight': SchemaHelper.numberSchema,
    },
  };
}
