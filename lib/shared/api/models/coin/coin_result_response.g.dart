// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinResultResponse _$CoinResultResponseFromJson(Map<String, dynamic> json) =>
    CoinResultResponse(
      json['id'] as String,
      json['symbol'] as String,
      json['name'] as String,
      CoinResultImageResponse.fromJson(json['image'] as Map<String, dynamic>),
      CoinResultMarketDataResponse.fromJson(
          json['market_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoinResultResponseToJson(CoinResultResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'market_data': instance.market_data,
    };
