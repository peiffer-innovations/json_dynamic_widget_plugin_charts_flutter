import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget_plugin_charts_flutter/src/schema/json_charts_flutter_schemas.dart';

void main() {
  test('output', () async {
    var output = Directory('output');
    if (output.existsSync()) {
      output.deleteSync(recursive: true);
    }

    output.createSync(recursive: true);

    var encoder = JsonEncoder.withIndent('  ');
    var all = [
      ...JsonChartsFlutterSchemas.enums.values,
      ...JsonChartsFlutterSchemas.objects.values,
    ];
    for (var schema in all) {
      for (var i = 0; i < 3; i++) {
        try {
          var id = schema['\$id'].toString();
          var fileName = id.split('/').last;

          var file = File('${output.path}/$fileName');
          file.createSync(recursive: true);

          file.writeAsStringSync(encoder.convert(schema));

          // ignore: avoid_print
          print('Wrote: $fileName');
          break;
        } catch (e) {
          if (i == 2) {
            rethrow;
          }

          await Future.delayed(Duration(milliseconds: 100));
        }
      }
    }
  });
}
