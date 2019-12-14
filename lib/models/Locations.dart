import 'dart:convert';

import 'package:http/http.dart' as http;
import './data.dart' as Data;

class Locations {
  final int id;
  final double latitude;
  final double longitude;
  Locations(this.id, this.latitude, this.longitude);
  static Locations fromJson(Map<String, dynamic> jsonData) {
    return Locations(
        jsonData['lid'], jsonData['latitude'], jsonData['longitude']);
  }

  static Future<List<Locations>> getLocations() async {
    var _response = await http.get(Data.URL + '/locations');
    List res = jsonDecode(_response.body);
    List<Locations> ans = [];
    if (_response.statusCode == 200) {
      for (var location in res) {
        ans.add(Locations.fromJson(location));
      }
    }
    return ans;
  }
}
