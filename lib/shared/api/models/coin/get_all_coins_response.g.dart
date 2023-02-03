// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_coins_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCoinsResponse _$GetAllCoinsResponseFromJson(Map<String, dynamic> json) =>
    GetAllCoinsResponse(
      (json['result'] as List<dynamic>)
          .map((e) => CoinResultResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllCoinsResponseToJson(
        GetAllCoinsResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
