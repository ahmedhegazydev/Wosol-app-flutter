//
// import 'package:json_annotation/json_annotation.dart';
//
// import 'data/tutorial/IntroItem.dart';
// import 'data/tutorial/ItemTutorial.dart';
//
// class CustomConverter extends JsonConverter {
//   const CustomConverter();
//
//   @override
//   T fromJson<T, K>(K json) {
//     if (T == IntroItem) {
//       return IntroItem.fromJson(json as Map<String, dynamic>) as T;
//     }
//     if (T == ItemTutorial) {
//       return ItemTutorial.fromJson(json as Map<String, dynamic>) as T;
//     }
//     throw UnsupportedError("Cannot convert to type $T");
//   }
//
//   @override
//   K toJson<T, K>(T object) {
//     return (object as dynamic).toJson() as K;
//   }
// }
