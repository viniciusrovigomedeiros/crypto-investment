// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_coin_price_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCoinPriceResponse _$GetCoinPriceResponseFromJson(
        Map<String, dynamic> json) =>
    GetCoinPriceResponse(
      price: (json['prices'] as List<dynamic>)
          .map((e) => CoinValueResponse.fromJson(e as List<dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCoinPriceResponseToJson(
        GetCoinPriceResponse instance) =>
    <String, dynamic>{
      'price': instance.price,
    };
