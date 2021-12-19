import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class BarRendererDecoratorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/bar_renderer_decorator.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/BarRendererDecorator-class.html',
    'title': 'BarRendererDecorator',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'insideLabelStyleSpec': SchemaHelper.objectSchema(TextStyleSpecSchema.id),
      'labelAnchor': SchemaHelper.objectSchema(BarLabelAnchorSchema.id),
      'labelPlacement': SchemaHelper.objectSchema(BarLabelPlacementSchema.id),
      'labelPosition': SchemaHelper.objectSchema(BarLabelPositionSchema.id),
      'labelVerticalPosition': SchemaHelper.objectSchema(
        BarLabelVerticalPositionSchema.id,
      ),
      'outsideLabelStyleSpec': SchemaHelper.objectSchema(
        TextStyleSpecSchema.id,
      ),
      'type': {
        'type': 'string',
        'enum': [
          'label',
        ]
      },
    },
  };
}
