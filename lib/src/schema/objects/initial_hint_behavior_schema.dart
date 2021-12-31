import 'package:json_theme/json_theme_schemas.dart';

class InitialHintBehaviorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/initial_hint_behavior.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/InitialHintBehavior-class.html',
    'title': 'InitialHintBehavior',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'hintDuration': SchemaHelper.numberSchema,
      'maxHintScaleFactor': SchemaHelper.numberSchema,
      'maxHintTranslate': SchemaHelper.numberSchema,
    },
  };
}
