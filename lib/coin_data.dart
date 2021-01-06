import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinData {

  String btc;
  String currencyName;

  void getCoinData() async {
    http.Response response =await http.get('https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=C9B3A00F-031F-4330-9AB6-1009E54E125E');
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      print(decodedData);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }

}


const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
