class Auth { // classs
  String accessToken;
  String refreshToken;
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;

  Auth({ // constructer
    required this.accessToken,
    required this.email,
    required this.refreshToken,
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
  });
  factory Auth.fromJson(Map<String, dynamic> json){ // instance
    return Auth( 
      // dummyjson dùng key `token`; ánh xạ về accessToken để tái sử dụng code cũ
      accessToken: json['accessToken'] ?? json['token'] ?? "",
      email: json['email'] ?? "",
      refreshToken: json['refreshToken'] ?? "",
      id: json['id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}
