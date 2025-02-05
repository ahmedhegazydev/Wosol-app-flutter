import 'package:json_annotation/json_annotation.dart';

part 'ItemTutorial.g.dart';

@JsonSerializable()
class ItemTutorial {
  final int itemId;
  final ItemFields itemFields;

  ItemTutorial({required this.itemId, required this.itemFields});

  factory ItemTutorial.fromJson(Map<String, dynamic> json) =>
      _$ItemTutorialFromJson(json);
  Map<String, dynamic> toJson() => _$ItemTutorialToJson(this);
}

@JsonSerializable()
class ItemFields {
  final String title;
  final String textKey;
  final String textValue;
  final String language;
  final List<String> screenName;
  final int id;
  final String modified;
  final String created;
  final double order;
  final String guid;

  ItemFields({
    required this.title,
    required this.textKey,
    required this.textValue,
    required this.language,
    required this.screenName,
    required this.id,
    required this.modified,
    required this.created,
    required this.order,
    required this.guid,
  });

  factory ItemFields.fromJson(Map<String, dynamic> json) =>
      _$ItemFieldsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemFieldsToJson(this);
}
