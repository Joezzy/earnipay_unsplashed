class Endpoints {
  Endpoints._();
  // base url
  // receiveTimeout
  static const int receiveTimeout = 50000;
  static const String clientIDAccessKey = "Client-ID j0YBVwQ-27DP9yno0gnOc-FrRtYqw42ASB_fbcfJpPI";
  // connectTimeout
  static const int connectionTimeout = 50000;
  static const String baseUrl = "https://api.unsplash.com";

  static String getPhotoUrl(page){
    return   '/photos/?page=$page';
  }








}
