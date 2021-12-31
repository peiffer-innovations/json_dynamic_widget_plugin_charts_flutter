import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class DatumLegendSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/datum_legend.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/DatumLegend-class.html',
    'title': 'DatumLegend',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'cellPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'desiredMaxColumns': SchemaHelper.numberSchema,
      'desiredMaxRows': SchemaHelper.numberSchema,
      'horizontalFirst': SchemaHelper.boolSchema,
      'entryTextStyle': SchemaHelper.objectSchema(TextStyleSpecSchema.id),
      'insideJustification': SchemaHelper.objectSchema(
        InsideJustificationSchema.id,
      ),
      'legendDefaultMeasure': SchemaHelper.objectSchema(
        LegendDefaultMeasureSchema.id,
      ),
      'measureFormatter': SchemaHelper.stringSchema,
      'outsideJustification': SchemaHelper.objectSchema(
        OutsideJustificationSchema.id,
      ),
      'position': SchemaHelper.objectSchema(BehaviorPositionSchema.id),
      'secondaryMeasureFormatter': SchemaHelper.stringSchema,
      'showMeasures': SchemaHelper.boolSchema,
      'type': {
        'type': 'string',
        'enum': [
          'datum_legend',
        ],
      },
    },
  };
}
