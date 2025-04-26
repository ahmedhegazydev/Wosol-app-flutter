import 'package:json_annotation/json_annotation.dart';

part 'IntroItem.g.dart';

@JsonSerializable()
class IntroItem {
  @JsonKey(name: 'ItemId')
  final int itemId;

  @JsonKey(name: 'ItemFields')
  final ItemFields itemFields;

  IntroItem({required this.itemId, required this.itemFields});

  factory IntroItem.fromJson(Map<String, dynamic> json) =>
      _$IntroItemFromJson(json);

  Map<String, dynamic> toJson() => _$IntroItemToJson(this);
}

@JsonSerializable()
class ItemFields {
  @JsonKey(name: 'Title')
  final String? title;

  @JsonKey(name: 'IntroTitle')
  final String? introTitle;

  @JsonKey(name: 'IntroDetails')
  final String? introDetails;

  @JsonKey(name: 'IntroIcon')
  final IntroIcon? introIcon;

  @JsonKey(name: 'IsActive')
  final bool? isActive;

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

  @JsonKey(name: 'TextKey')
  final String? textKey;

  @JsonKey(name: 'TextValue')
  final String? textValue;

  @JsonKey(name: 'Language')
  final String? language;

  @JsonKey(name: 'ScreenName')
  final List<String>? screenName;

  ItemFields({
    this.title,
    this.introTitle,
    this.introDetails,
    this.introIcon,
    this.isActive,
    required this.id,
    this.modified,
    this.created,
    this.order,
    this.guid,
    this.textValue,
    this.textKey,
    this.language,
    this.screenName,
  });

  factory ItemFields.fromJson(Map<String, dynamic> json) =>
      _$ItemFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemFieldsToJson(this);
}

@JsonSerializable()
class IntroIcon {
  @JsonKey(name: 'Description')
  final String? description;

  @JsonKey(name: 'Url')
  final String? url;

  @JsonKey(name: 'TypeId')
  final String? typeId;

  IntroIcon({
    this.description,
    this.url,
    this.typeId,
  });

  factory IntroIcon.fromJson(Map<String, dynamic> json) =>
      _$IntroIconFromJson(json);

  Map<String, dynamic> toJson() => _$IntroIconToJson(this);
}
