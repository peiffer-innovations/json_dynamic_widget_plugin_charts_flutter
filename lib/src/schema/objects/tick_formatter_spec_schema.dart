import 'package:json_theme/json_theme_schemas.dart';

class TickFormatterSpecSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/tick_formatter_spec.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/TickFormatterSpec-class.html',
    'title': 'TickFormatterSpec',
    'type': 'object',
    'additionalProperties': true,
    'properties': {
      'format': SchemaHelper.stringSchema,
      'type': {
        'type': 'string',
        'enum': [
          'auto_date_time',
          'date_time',
          'number',
          'ordinal',
        ],
      },
    },
  };
}
