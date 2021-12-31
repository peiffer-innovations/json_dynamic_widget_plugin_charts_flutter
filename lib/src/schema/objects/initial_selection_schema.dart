import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class InitialSelectionSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/initial_selection.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/InitialSelection-class.html',
    'title': 'InitialSelection',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'selectedDataConfig': SchemaHelper.arraySchema(
        SeriesDatumConfigSchema.id,
        includeObject: true,
      ),
      'selectedSeriesConfig': SchemaHelper.anySchema,
      'selectionModelType': SchemaHelper.objectSchema(
        SelectionModelTypeSchema.id,
      ),
      'shouldPreserveSelectionOnDraw': SchemaHelper.boolSchema,
    },
  };
}
