import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class SliderStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/slider_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/SliderStyle-class.html',
    'title': 'SliderStyle',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'fillColor': SchemaHelper.objectSchema(ColorSchema.id),
      'handleOffset': {
        'type': 'object',
        'additionalProperties': false,
        'required': ['x', 'y'],
        'properties': {
          'x': SchemaHelper.numberSchema,
          'y': SchemaHelper.numberSchema,
        },
      },
      'handlePosition':
          SchemaHelper.objectSchema(SliderHandlePositionSchema.id),
      'handleSize': {
        'type': 'object',
        'additionalProperties': false,
        'required': ['left', 'top', 'width', 'height'],
        'properties': {
          'left': SchemaHelper.numberSchema,
          'top': SchemaHelper.numberSchema,
          'width': SchemaHelper.numberSchema,
          'height': SchemaHelper.numberSchema,
        },
      },
      'strokeColor': SchemaHelper.objectSchema(ColorSchema.id),
    },
  };
}
