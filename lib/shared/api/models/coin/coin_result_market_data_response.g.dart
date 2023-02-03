// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_result_market_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinResultMarketDataResponse _$CoinResultMarketDataResponseFromJson(
        Map<String, dynamic> json) =>
    CoinResultMarketDataResponse(
      CoinResultMarketDataCurrentPrice.fromJson(
          json['current_price'] as Map<String, dynamic>),
      (json['price_change_percentage_24h'] as num).toDouble(),
    );

Map<String, dynamic> _$CoinResultMarketDataResponseToJson(
        CoinResultMarketDataResponse instance) =>
    <String, dynamic>{
      'current_price': instance.current_price,
      'price_change_percentage_24h': instance.price_change_percentage_24h,
    };
