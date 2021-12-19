import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class AnnotationSegmentSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/annotation_segment.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/AnnotationSegment-class.html',
    'title': 'AnnotationSegment',
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
              'axisId': SchemaHelper.stringSchema,
              'axisType':
                  SchemaHelper.objectSchema(RangeAnnotationAxisTypeSchema.id),
              'color': SchemaHelper.objectSchema(ColorSchema.id),
              'dashPattern': SchemaHelper.anySchema,
              'endLabel': SchemaHelper.stringSchema,
              'labelAnchor': SchemaHelper.objectSchema(
                AnnotationLabelAnchorSchema.id,
              ),
              'labelDirection': SchemaHelper.objectSchema(
                AnnotationLabelDirectionSchema.id,
              ),
              'labelPosition': SchemaHelper.objectSchema(
                AnnotationLabelPositionSchema.id,
              ),
              'labelStyleSpec':
                  SchemaHelper.objectSchema(TextStyleSpecSchema.id),
              'middleLabel': SchemaHelper.stringSchema,
              'startLabel': SchemaHelper.stringSchema,
              'strokeWidthPx': SchemaHelper.numberSchema,
              'type': {
                'type': 'string',
                'enum': [
                  'line_annotation',
                ],
              },
              'value': SchemaHelper.anySchema,
            },
          },
          {
            'additionalProperties': false,
            'properties': {
              'axisId': SchemaHelper.stringSchema,
              'axisType':
                  SchemaHelper.objectSchema(RangeAnnotationAxisTypeSchema.id),
              'color': SchemaHelper.objectSchema(ColorSchema.id),
              'endLabel': SchemaHelper.stringSchema,
              'endValue': SchemaHelper.anySchema,
              'labelAnchor': SchemaHelper.objectSchema(
                AnnotationLabelAnchorSchema.id,
              ),
              'labelDirection': SchemaHelper.objectSchema(
                AnnotationLabelDirectionSchema.id,
              ),
              'labelPosition': SchemaHelper.objectSchema(
                AnnotationLabelPositionSchema.id,
              ),
              'labelStyleSpec':
                  SchemaHelper.objectSchema(TextStyleSpecSchema.id),
              'middleLabel': SchemaHelper.stringSchema,
              'startLabel': SchemaHelper.stringSchema,
              'startValue': SchemaHelper.anySchema,
              'strokeWidthPx': SchemaHelper.numberSchema,
              'type': {
                'type': 'string',
                'enum': [
                  'range_annotation',
                ],
              },
            },
          },
        ],
      },
    ],
  };
}
