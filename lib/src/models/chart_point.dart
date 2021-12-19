import 'package:json_class/json_class.dart';

class ChartPoint<D> extends JsonClass {
  ChartPoint({
    required this.domain,
    required this.domainLowerBound,
    required this.domainUpperBound,
    required this.label,
    required this.measure,
  });

  final D domain;
  final D? domainLowerBound;
  final D? domainUpperBound;
  final String? label;
  final num? measure;

  static ChartPoint<D> fromDynamic<D>(dynamic map) {
    if (map == null) {
      throw Exception('[ChartPoint]: map is null');
    }

    var domain = JsonClass.parseValue<D>(map['domain']);

    return ChartPoint<D>(
      domain: domain!,
      domainLowerBound: map['domainLowerBound'],
      domainUpperBound: map['domainUpperBound'],
      label: map['label']?.toString(),
      measure: JsonClass.parseDouble(map['measure'])!,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'domain': domain.toString(),
        'domainLowerBound': domainLowerBound?.toString(),
        'domainUpperBound': domainUpperBound?.toString(),
        'label': label,
        'measure': measure,
      };
}
