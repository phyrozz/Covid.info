import 'package:http/http.dart';
import 'dart:convert';

class CovidData {
  String confirmedCases;
  String confirmedDeaths;
  String confirmedRecoveries;
  String phConfirmedCases;
  String phConfirmedDeaths;
  String phConfirmedRecoveries;

  CovidData({
    this.confirmedCases,
    this.confirmedDeaths,
    this.confirmedRecoveries,
    this.phConfirmedCases,
    this.phConfirmedDeaths,
    this.phConfirmedRecoveries,
  });

  Future getData() async {
    Response response = await get("https://api.covid19api.com/summary");
    Map data = jsonDecode(response.body);
    Map globalData = data["Global"];
    List countryData = data["Countries"];
    Map phData = countryData[134];

    confirmedCases = globalData["TotalConfirmed"].toString().replaceAllMapped(
        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    confirmedDeaths = globalData["TotalDeaths"].toString().replaceAllMapped(
        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    confirmedRecoveries = globalData["TotalRecovered"]
        .toString()
        .replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},');

    phConfirmedCases = phData["TotalConfirmed"].toString().replaceAllMapped(
        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    phConfirmedDeaths = phData["TotalDeaths"].toString().replaceAllMapped(
        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    phConfirmedRecoveries = phData["TotalRecovered"]
        .toString()
        .replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},');
  }
}
