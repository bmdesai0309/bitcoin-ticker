import 'package:http/http.dart' as http;
import 'dart:convert';


// https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=C9B3A00F-031F-4330-9AB6-1009E54E125E


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

const apiURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'C9B3A00F-031F-4330-9AB6-1009E54E125E';

class CoinData {

  Future getCoinData(String selectedCurrency) async {

    Map<String, String> cryptoPrice = {};

    for(String crypto in cryptoList) {

      String url = '$apiURL/$crypto/$selectedCurrency?apikey=$apiKey';

      http.Response response = await http.get(url);

      if(response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        double lastPrice = decodeData['rate'];
        cryptoPrice[crypto] = lastPrice.toStringAsFixed(0);
      }else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }

    }

    return cryptoPrice;

  }

}

