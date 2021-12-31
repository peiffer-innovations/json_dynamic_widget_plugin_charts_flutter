import 'package:json_theme/json_theme_schemas.dart';

class DateTimeTickProviderSpecSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/date_time_tick_provider_spec.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/DateTimeTickProviderSpec-class.html',
    'title': 'DateTimeTickProviderSpec',
    'type': 'object',
    'additionalProperties': false,
    'required': ['type'],
    'properties': {
      'includeTime': SchemaHelper.boolSchema,
      'type': {
        'type': 'string',
        'enum': [
          'auto',
        ],
      },
    },
  };
}
