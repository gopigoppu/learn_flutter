const GOOGLE_API_KEY = 'AIzaSyCEHCOXQtanp4grMEtvfaK4uydv1zBMBPk';

class LocationHelper {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    var url =
        "https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY";
    return url;
  }
}
