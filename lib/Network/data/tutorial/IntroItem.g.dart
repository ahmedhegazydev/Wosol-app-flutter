// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IntroItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntroItem _$IntroItemFromJson(Map<String, dynamic> json) => IntroItem(
      itemId: (json['ItemId'] as num).toInt(),
      itemFields:
          ItemFields.fromJson(json['ItemFields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IntroItemToJson(IntroItem instance) => <String, dynamic>{
      'ItemId': instance.itemId,
      'ItemFields': instance.itemFields,
    };

ItemFields _$ItemFieldsFromJson(Map<String, dynamic> json) => ItemFields(
      title: json['Title'] as String?,
      introTitle: json['IntroTitle'] as String?,
      introDetails: json['IntroDetails'] as String?,
      introIcon: json['IntroIcon'] == null
          ? null
          : IntroIcon.fromJson(json['IntroIcon'] as Map<String, dynamic>),
      isActive: json['IsActive'] as bool?,
      id: (json['ID'] as num).toInt(),
      modified: json['Modified'] as String?,
      created: json['Created'] as String?,
      order: (json['Order'] as num?)?.toDouble(),
      guid: json['GUID'] as String?,
      textValue: json['TextValue'] as String?,
      textKey: json['TextKey'] as String?,
      language: json['Language'] as String?,
      screenName: (json['ScreenName'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ItemFieldsToJson(ItemFields instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'IntroTitle': instance.introTitle,
      'IntroDetails': instance.introDetails,
      'IntroIcon': instance.introIcon,
      'IsActive': instance.isActive,
      'ID': instance.id,
      'Modified': instance.modified,
      'Created': instance.created,
      'Order': instance.order,
      'GUID': instance.guid,
      'TextKey': instance.textKey,
      'TextValue': instance.textValue,
      'Language': instance.language,
      'ScreenName': instance.screenName,
    };

IntroIcon _$IntroIconFromJson(Map<String, dynamic> json) => IntroIcon(
      description: json['Description'] as String?,
      url: json['Url'] as String?,
      typeId: json['TypeId'] as String?,
    );

Map<String, dynamic> _$IntroIconToJson(IntroIcon instance) => <String, dynamic>{
      'Description': instance.description,
      'Url': instance.url,
      'TypeId': instance.typeId,
    };
