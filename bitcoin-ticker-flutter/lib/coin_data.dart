import 'dart:convert';
import 'package:http/http.dart' as http;

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


const coinApiURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '924A1C7A-4E93-40B0-8755-EF451778CA9F';


class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String,String> cyrptoPrices = {};

    for(String crypto in cryptoList){
      String requestURL = '$coinApiURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(requestURL);
      if(response.statusCode == 200)
      {
        var decodeData = jsonDecode(response.body);
        var lastPrice = decodeData['rate'];
        cyrptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      }
      else{
        print(response.statusCode);
        throw 'Problem with the getRequest';
      }
    }
    return cyrptoPrices;
  }
}
