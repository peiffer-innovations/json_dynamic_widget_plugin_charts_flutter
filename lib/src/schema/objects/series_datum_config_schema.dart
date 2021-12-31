import 'package:json_theme/json_theme_schemas.dart';

class SeriesDatumConfigSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/series_datum_config.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/SeriesDatumConfig-class.html',
    'title': 'SeriesDatumConfig',
    'type': 'object',
    'additionalProperties': false,
    'required': ['series'],
    'properties': {
      'domainValue': SchemaHelper.anySchema,
      'seriesId': SchemaHelper.stringSchema,
    },
  };
}
