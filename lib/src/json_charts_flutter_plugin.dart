import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

import 'schema/json_charts_flutter_schemas.dart';
import 'values/create_series_function.dart';
import 'values/material_palette_values.dart';

class JsonChartsFlutterPlugin {
  static void bind(JsonWidgetRegistry registry) {
    var schemaCache = SchemaCache();
    Enums.all.addAll(JsonChartsFlutterSchemas.enums.keys);

    schemaCache.addSchemas(JsonChartsFlutterSchemas.enums);
    schemaCache.addSchemas(JsonChartsFlutterSchemas.objects);

    MaterialPaletteValues.values.forEach(
      (key, value) => registry.setValue(key, value),
    );

    registry.registerFunctions({
      CreateSeriesFunction.id: CreateSeriesFunction.body,
    });

    registry.registerCustomBuilders({
      BarChartBuilder.type: JsonWidgetBuilderContainer(
        builder: BarChartBuilder.fromDynamic,
        schemaId: BarChartSchema.id,
      ),
      TimeSeriesChartBuilder.type: JsonWidgetBuilderContainer(
        builder: TimeSeriesChartBuilder.fromDynamic,
        schemaId: TimeSeriesChartSchema.id,
      ),
    });
  }
}
