import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class SelectNearestSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/select_nearest.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/SelectNearest-class.html',
    'title': 'SelectNearest',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'eventTrigger': SchemaHelper.objectSchema(SelectionTriggerSchema.id),
      'maximumDomainDistancePx': SchemaHelper.numberSchema,
      'selectAcrossAllDrawAreaComponents': SchemaHelper.boolSchema,
      'selectClosestSeries': SchemaHelper.boolSchema,
      'selectionMode': SchemaHelper.objectSchema(SelectionModeSchema.id),
      'selectionModelType': SchemaHelper.objectSchema(
        SelectionModelTypeSchema.id,
      ),
      'type': {
        'type': 'string',
        'enum': [
          'select_nearest',
        ],
      },
    },
  };
}
