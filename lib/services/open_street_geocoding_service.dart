import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenStreetGeocodingResult {
  final String? city;
  final String? state;
  final String? pincode;

  OpenStreetGeocodingResult({this.city, this.state, this.pincode});
}

class OpenStreetGeocodingService {
  Future<OpenStreetGeocodingResult> reverseGeocode(
    double latitude,
    double longitude,
  ) async {
    final uri = Uri.parse(
      'https://nominatim.openstreetmap.org/reverse'
      '?lat=$latitude&lon=$longitude&format=json&addressdetails=1',
    );

    final response = await http.get(
      uri,
      headers: {
        'User-Agent':
            'vishnu-location-tracker/1.0 (punativishnuvarun@gmail.com)',
      },
    );

    if (response.statusCode != 200) {
      return OpenStreetGeocodingResult();
    }

    final data = jsonDecode(response.body);

    if (data['address'] == null) {
      return OpenStreetGeocodingResult();
    }

    final address = data['address'] as Map<String, dynamic>;

    String? city =
        address['city'] ??
        address['town'] ??
        address['village'] ??
        address['hamlet'];

    String? state = address['state'];
    String? pincode = address['postcode'];

    return OpenStreetGeocodingResult(
      city: city,
      state: state,
      pincode: pincode,
    );
  }
}
