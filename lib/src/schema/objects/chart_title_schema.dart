import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class ChartTitleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/chart_title.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/ChartTitle-class.html',
    'title': 'ChartTitle',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'behaviorPosition': SchemaHelper.objectSchema(
        BehaviorPositionSchema.id,
      ),
      'innerPadding': SchemaHelper.numberSchema,
      'layoutMinSize': SchemaHelper.numberSchema,
      'layoutPreferredSize': SchemaHelper.numberSchema,
      'maxWidthStrategy': SchemaHelper.objectSchema(
        MaxWidthStrategySchema.id,
      ),
      'outerPadding': SchemaHelper.numberSchema,
      'subTitle': SchemaHelper.stringSchema,
      'subTitleStyleSpec': SchemaHelper.objectSchema(TextStyleSpecSchema.id),
      'text': SchemaHelper.stringSchema,
      'titleDirection': SchemaHelper.objectSchema(ChartTitleDirectionSchema.id),
      'titleOutsideJustification': SchemaHelper.objectSchema(
        OutsideJustificationSchema.id,
      ),
      'titlePadding': SchemaHelper.numberSchema,
      'titleStyleSpec': SchemaHelper.objectSchema(TextStyleSpecSchema.id)
    },
  };
}
