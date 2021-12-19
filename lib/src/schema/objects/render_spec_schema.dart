import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class RenderSpecSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/render_spec.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/RenderSpec-class.html',
    'title': 'RenderSpec',
    'oneOf': [
      {
        'type': 'string',
      },
      {
        'type': 'object',
        'oneOf': [
          {
            'additionalProperties': false,
            'required': [
              'type',
            ],
            'properties': {
              'axisLineStyle': SchemaHelper.objectSchema(
                LineStyleSpecSchema.id,
              ),
              'type': {
                'type': 'string',
                'enum': [
                  'none',
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
              'axisLineStyle': SchemaHelper.objectSchema(
                LineStyleSpecSchema.id,
              ),
              'labelAnchor':
                  SchemaHelper.objectSchema(TickLabelAnchorSchema.id),
              'labelCollisionOffsetFromAxisPx': SchemaHelper.numberSchema,
              'labelCollisionOffsetFromTickPx': SchemaHelper.numberSchema,
              'labelCollisionRotation': SchemaHelper.numberSchema,
              'labelJustification': SchemaHelper.objectSchema(
                TickLabelJustificationSchema.id,
              ),
              'labelOffsetFromAxisPx': SchemaHelper.numberSchema,
              'labelOffsetFromTickPx': SchemaHelper.numberSchema,
              'labelRotation': SchemaHelper.numberSchema,
              'labelStyle': SchemaHelper.objectSchema(TextStyleSpecSchema.id),
              'lineStyle': SchemaHelper.objectSchema(LineStyleSpecSchema.id),
              'minimumPaddingBetweenLabelsPx': SchemaHelper.numberSchema,
              'tickLengthPx': SchemaHelper.numberSchema,
              'type': {
                'type': 'string',
                'enum': [
                  'grid_line',
                  'small_tick',
                ]
              },
            },
          },
        ],
      },
    ],
  };
}
