import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../portfolio/model/coin_view_data.dart';
import '../../portfolio/model/wallet_view_data.dart';

class ConvertController extends ChangeNotifier {
  late bool isValidConversion;
  late Decimal _coinPercent;
  late Decimal _convertValue;
  late String helperMessage;
  late double currentAssetPrice;
  late double currentAssetPriceToConvert;
  late CoinViewData coinToConvert;
  late CoinViewData currentCoin;

  void refresh(CoinViewData currentCoin, WalletViewData userWallet) {
    this.currentCoin = currentCoin;
    currentAssetPriceToConvert = coinToConvert.market_data!.current_price.usd;
    currentAssetPrice = currentCoin.market_data!.current_price.usd;
    setCoinPercent(userWallet.percent.toString());

    isValidConversion = (_isRedundantConvert() &&
        _isAvaiableBalance() &&
        _isConvertValueNotEmpty());
  }

  void setCoinToConvert(CoinViewData coinToConvert) {
    this.coinToConvert = coinToConvert;
    validateConversion();
  }

  void initValues(CoinViewData coinToConvert) {
    setConvertValue('0');
    setCoinToConvert(coinToConvert);
  }

  void validateConversion() {
    if (_isConvertValueNotEmpty()) {
      _isAvaiableBalance();
    }
    notifyListeners();
  }

  bool _isRedundantConvert() {
    if (currentCoin == coinToConvert) {
      isValidConversion = false;
      helperMessage = 'Selecione uma moeda diferente para conversão';
      return isValidConversion;
    }
    return isValidConversion = true;
  }

  bool _isAvaiableBalance() {
    if (_coinPercent < _convertValue) {
      isValidConversion = false;
      helperMessage = 'Valor digitado superior ao saldo disponível';
      return isValidConversion;
    }
    return isValidConversion = true;
  }

  bool _isConvertValueNotEmpty() {
    if (_convertValue == Decimal.fromInt(0)) {
      isValidConversion = false;

      helperMessage = 'Valor digitado inválido';
      return isValidConversion;
    } else {
      isValidConversion = true;
      return isValidConversion;
    }
  }

  void setConvertValue(String convertValue) {
    if (convertValue.isNotEmpty) {
      _convertValue = Decimal.parse(convertValue);
    } else {
      _convertValue = Decimal.fromInt(0);
    }
    validateConversion();
  }

  void setCoinPercent(String convertValue) {
    _coinPercent = Decimal.parse(convertValue);
  }

  String getDolarFormatedValue() {
    return NumberFormat.simpleCurrency(name: 'US\$ ', decimalDigits: 2).format(
        DecimalIntl(Decimal.parse(
            (currentAssetPrice * _convertValue.toDouble()).toString())));
  }

  String getConvertValue() {
    Decimal dolarValue = Decimal.parse(
        (currentAssetPrice * _convertValue.toDouble()).toString());

    return '${coinToConvert.symbol} ${(dolarValue.toDouble() / currentAssetPriceToConvert).toString()}';
  }

  String getReceiveFormatedValue() {
    Decimal dolarValue = Decimal.parse(
        (currentAssetPrice * _convertValue.toDouble()).toString());

    return '${(dolarValue.toDouble() / currentAssetPriceToConvert).toString()} ${coinToConvert.symbol}';
  }

  Decimal getReceiveValue() {
    Decimal dolarValue = Decimal.parse(
        (currentAssetPrice * _convertValue.toDouble()).toString());

    return Decimal.parse((dolarValue.toDouble() / currentAssetPriceToConvert)
        .toStringAsFixed(6));
  }

  Decimal getConvertDecimalValue() =>
      Decimal.parse(_convertValue.toStringAsFixed(6));

  String getConvertedFormatedValue() {
    return '$_convertValue ${currentCoin.symbol}';
  }

  String getExchangeValue() {
    return ' 1 ${currentCoin.symbol} = ${((currentAssetPrice / currentAssetPriceToConvert.toDouble()).toStringAsFixed(6))} ${coinToConvert.symbol}';
  }
}
