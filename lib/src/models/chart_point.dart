import 'package:charts_flutter/flutter.dart';
import 'package:json_class/json_class.dart';

class ChartPoint<D> extends JsonClass {
  ChartPoint({
    required this.color,
    required this.domain,
    required this.domainLowerBound,
    required this.domainUpperBound,
    required this.fillColor,
    required this.label,
    required this.measure,
    required this.measureLowerBound,
    required this.measureUpperBound,
    required this.radius,
    required this.shape,
    required this.strokeWidth,
  });

  final Color? color;
  final D domain;
  final D? domainLowerBound;
  final D? domainUpperBound;
  final Color? fillColor;
  final String? label;
  final num? measure;
  final num? measureLowerBound;
  final num? measureUpperBound;
  final double? radius;
  final String? shape;
  final double? strokeWidth;

  static ChartPoint<D> fromDynamic<D>(dynamic map) {
    if (map == null) {
      throw Exception('[ChartPoint]: map is null');
    }

    var domain = JsonClass.parseValue<D>(map['domain']);

    return ChartPoint<D>(
      color: map['color'],
      domain: domain!,
      domainLowerBound: map['domainLowerBound'],
      domainUpperBound: map['domainUpperBound'],
      fillColor: map['fillColor'],
      label: map['label']?.toString(),
      measure: JsonClass.parseDouble(map['measure'])!,
      measureLowerBound: JsonClass.parseDouble(map['measureLowerBound'])!,
      measureUpperBound: JsonClass.parseDouble(map['measureUpperBound'])!,
      radius: JsonClass.parseDouble(map['radius']),
      shape: map['shape'],
      strokeWidth: JsonClass.parseDouble(map['strokeWidth']),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'color': color?.hexString,
        'domain': domain.toString(),
        'domainLowerBound': domainLowerBound?.toString(),
        'domainUpperBound': domainUpperBound?.toString(),
        'fillColor': fillColor?.hexString,
        'label': label,
        'measure': measure,
        'measureLowerBound': measureLowerBound,
        'measureUpperBound': measureUpperBound,
        'radius': radius,
        'shape': shape,
        'strokeWidth': strokeWidth,
      };
}
