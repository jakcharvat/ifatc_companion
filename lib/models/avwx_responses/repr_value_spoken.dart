import 'package:json_annotation/json_annotation.dart';

part 'repr_value_spoken.g.dart';

@JsonSerializable()
class ReprValueSpoken {
  final String repr;
  final num value;
  final String spoken;

  ReprValueSpoken(this.repr, this.value, this.spoken);

  factory ReprValueSpoken.fromJson(Map<String, dynamic> json) => _$ReprValueSpokenFromJson(json);
  Map<String, dynamic> toJson() => _$ReprValueSpokenToJson(this);
}