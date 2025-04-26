import 'package:json_annotation/json_annotation.dart';

part 'ItemTutorial.g.dart';

@JsonSerializable()
class ItemTutorial {
  @JsonKey(name: 'ItemId')
  final int itemId;

  @JsonKey(name: 'ItemFields')
  final ItemFields itemFields;

  ItemTutorial({required this.itemId, required this.itemFields});

  factory ItemTutorial.fromJson(Map<String, dynamic> json) =>
      _$ItemTutorialFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTutorialToJson(this);
}

@JsonSerializable()
class ItemFields {
  @JsonKey(name: 'Title')
  final String? title;

  @JsonKey(name: 'TextKey')
  final String? textKey;

  @JsonKey(name: 'TextValue')
  final String? textValue;

  @JsonKey(name: 'Language')
  final String? language;

  @JsonKey(name: 'ScreenName')
  final List<String>? screenName;

  @JsonKey(name: 'ID')
  final int id;

  @JsonKey(name: 'Modified')
  final String? modified;

  @JsonKey(name: 'Created')
  final String? created;

  @JsonKey(name: 'Order')
  final double? order;

  @JsonKey(name: 'GUID')
  final String? guid;

  ItemFields({
    this.title,
    this.textKey,
    this.textValue,
    this.language,
    this.screenName,
    required this.id,
    this.modified,
    this.created,
    this.order,
    this.guid,
  });

  factory ItemFields.fromJson(Map<String, dynamic> json) =>
      _$ItemFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemFieldsToJson(this);
}
