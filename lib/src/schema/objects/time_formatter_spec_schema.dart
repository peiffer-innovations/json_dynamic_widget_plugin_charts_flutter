import 'package:json_theme/json_theme_schemas.dart';

class TimeFormatterSpecSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/time_formatter_spec.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/TimeFormatterSpec-class.html',
    'title': 'TimeFormatterSpec',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'format': SchemaHelper.stringSchema,
      'noonFormat': SchemaHelper.stringSchema,
      'transitionFormat': SchemaHelper.stringSchema
    },
  };
}
