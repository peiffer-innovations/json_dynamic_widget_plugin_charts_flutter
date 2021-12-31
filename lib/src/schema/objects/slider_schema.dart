import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class SliderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/slider.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/Slider-class.html',
    'title': 'Slider',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'eventTrigger': SchemaHelper.objectSchema(SelectionTriggerSchema.id),
      'handleRenderer': SchemaHelper.objectSchema(SymbolRendererSchema.id),
      'initialDomainValue': SchemaHelper.anySchema,
      'layoutPaintOrder': SchemaHelper.numberSchema,
      'onChangeCallback': SchemaHelper.stringSchema,
      'roleId': SchemaHelper.stringSchema,
      'snapToDatum': SchemaHelper.boolSchema,
      'style': SchemaHelper.objectSchema(SliderStyleSchema.id)
    },
  };
}
