// To parse this JSON data, do
//
//     final imageData = imageDataFromJson(jsonString);

import 'dart:convert';

List<PhotoData> photoDataFromJson(String str) => List<PhotoData>.from(json.decode(str).map((x) => PhotoData.fromJson(x)));


class PhotoData {
  DateTime? createdAt;
  String? description;
  String? altDescription;
  Urls? urls;
  User? user;

  PhotoData({
    this.createdAt,
    this.description,
    this.altDescription,
    this.urls,
    this.user,
  });

  factory PhotoData.fromJson(Map<String, dynamic> json) => PhotoData(
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    description: json["description"]??"No description",
    altDescription: json["alt_description"],
    urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

}

class Urls {
  String? full;
  String? regular;
  String? small;

  Urls({
    this.full,
    this.regular,
    this.small,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
  );


}

class User {
  String? username;
  String? name;
  String? firstName;
  dynamic lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  ProfileImage? profileImage;
  String? instagramUsername;

  User({
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.profileImage,
    this.instagramUsername,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    twitterUsername: json["twitter_username"],
    portfolioUrl: json["portfolio_url"],
    bio: json["bio"]??"No bio",
    location: json["location"],
    profileImage: json["profile_image"] == null ? null : ProfileImage.fromJson(json["profile_image"]),
    instagramUsername: json["instagram_username"],
  );


}

class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
  );

}
