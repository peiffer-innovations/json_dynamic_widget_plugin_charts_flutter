import 'package:json_theme/json_theme_schemas.dart';

class DateTimeExtentsSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/date_time_extents.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_flutter/latest/flutter/DateTimeExtents-class.html',
    'title': 'DateTimeExtents',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'end': SchemaHelper.stringSchema,
      'start': SchemaHelper.stringSchema,
    },
  };
}
