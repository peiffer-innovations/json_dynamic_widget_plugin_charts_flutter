import 'package:json_theme/json_theme_schemas.dart';

class CornerStrategySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/corner_strategy.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/CornerStrategy-class.html',
    'title': 'CornerStrategy',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'anyOf': [
        {
          'type': 'number',
        },
        {
          'type': 'string',
        },
        {
          'type': 'object',
          'oneOf': [
            {
              'additionalProperties': false,
              'required': [
                'radius',
                'type',
              ],
              'properties': {
                'radius': SchemaHelper.numberSchema,
                'type': {
                  'type': 'string',
                  'enum': [
                    'const',
                  ]
                },
              },
            },
            {
              'additionalProperties': false,
              'required': [
                'type',
              ],
              'properties': {
                'type': {
                  'type': 'string',
                  'enum': [
                    'none',
                  ]
                },
              },
            },
          ],
        },
      ],
    },
  };
}
