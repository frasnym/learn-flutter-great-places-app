import 'dart:convert';

import './global_helper.dart' as global;
import 'package:http/http.dart' as http;

final googleAPIKEY = global.googleAPIKey;

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$googleAPIKEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$googleAPIKEY';
    final response = await http.get(url);

    // print('getPlaceAddress-${json.decode(response.body)}');

    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
