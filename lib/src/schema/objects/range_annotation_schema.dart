import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class RangeAnnotationSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/range_annotation.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/NumericAxisSpec-class.html',
    'title': 'RangeAnnotation',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'annotations': SchemaHelper.arraySchema(
        AnnotationSegmentSchema.id,
        includeObject: true,
      ),
      'defaultColor': SchemaHelper.objectSchema(ColorSchema.id),
      'defaultLabelAnchor': SchemaHelper.objectSchema(
        AnnotationLabelAnchorSchema.id,
      ),
      'defaultLabelDirection': SchemaHelper.objectSchema(
        AnnotationLabelDirectionSchema.id,
      ),
      'defaultLabelPosition': SchemaHelper.objectSchema(
        AnnotationLabelPositionSchema.id,
      ),
      'defaultLabelStyleSpec':
          SchemaHelper.objectSchema(TextStyleSpecSchema.id),
      'extendAxis': SchemaHelper.boolSchema,
      'labelPadding': SchemaHelper.numberSchema,
      'layoutPaintOrder': SchemaHelper.numberSchema,
      'type': {
        'type': 'string',
        'enum': [
          'range_annotation',
        ],
      },
    },
  };
}
