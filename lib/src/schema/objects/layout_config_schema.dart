import 'package:json_dynamic_widget_plugin_charts_flutter/src/schema/all.dart';
import 'package:json_theme/json_theme_schemas.dart';

class LayoutConfigSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/layout_config.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/LayoutConfig-class.html',
    'title': 'LayoutConfig',
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
          'additionalProperties': false,
          'required': [
            'radius',
            'type',
          ],
          'properties': {
            'bottomMarginSpec': SchemaHelper.objectSchema(MarginSpecSchema.id),
            'leftMarginSpec': SchemaHelper.objectSchema(MarginSpecSchema.id),
            'rightMarginSpec': SchemaHelper.objectSchema(MarginSpecSchema.id),
            'topMarginSpec': SchemaHelper.objectSchema(MarginSpecSchema.id),
          },
        },
      ],
    },
  };
}
