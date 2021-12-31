import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class ArcLabelDecoratorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/arc_label_decorator.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/ArcLabelDecorator-class.html',
    'title': 'ArcLabelDecorator',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'insideLabelStyleSpec': SchemaHelper.objectSchema(TextStyleSpecSchema.id),
      'labelPadding': SchemaHelper.numberSchema,
      'labelPosition': SchemaHelper.objectSchema(
        ArcLabelPositionSchema.id,
      ),
      'leaderLineColor': SchemaHelper.objectSchema(ColorSchema.id),
      'leaderLineStyleSpec': SchemaHelper.objectSchema(
        ArcLabelLeaderLineStyleSpecSchema.id,
      ),
      'outsideLabelStyleSpec':
          SchemaHelper.objectSchema(TextStyleSpecSchema.id),
      'showLeaderLines': SchemaHelper.boolSchema,
    },
  };
}
