class userTokenResponse {
  final String token;

  userTokenResponse({
    required this.token,
  });

  factory userTokenResponse.fromJson(Map<String, dynamic> json) {
    return userTokenResponse(
      token: json["accessToken"],
    );
  }
}
