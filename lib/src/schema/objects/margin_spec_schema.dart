import 'package:json_theme/json_theme_schemas.dart';

class MarginSpecSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/margin_spec.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/MarginSpec-class.html',
    'title': 'MarginSpec',
    'oneOf': [
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
              'maxPercent': SchemaHelper.numberSchema,
              'minPercent': SchemaHelper.numberSchema,
              'type': {
                'type': 'string',
                'enum': [
                  'percent',
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
              'maxPixel': SchemaHelper.numberSchema,
              'minPixel': SchemaHelper.numberSchema,
              'type': {
                'type': 'string',
                'enum': [
                  'pixel',
                ]
              },
            },
          },
        ],
      },
    ],
  };
}
