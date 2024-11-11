class userCredentials {
  final String username;
  final String password;

  userCredentials({required this.username, required this.password});

  factory userCredentials.fromJson(Map<String, dynamic> json){
    return userCredentials(username: json['username'], password: json['password']);
  }
}
