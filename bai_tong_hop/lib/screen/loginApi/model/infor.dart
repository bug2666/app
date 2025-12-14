class Infor {
  int id;
  String firstName;
  String lastName;
  String maidenName;
  int age;
  String gender;
  String email;
  String phone;
  String username;
  String password;
  DateTime birthDate;
  String image;
  String bloodGroup;
  double height;
  double weight;
  String eyeColor;
  Hair hair;
  String ip;
  Address address;
  String macAddress;
  String university;


  Infor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
  });// gọi lại hàm dựng kiểu factory và lấy dữ liệu của key là hair
  factory Infor.fromJson(Map<String, dynamic> json){
    return Infor(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        maidenName: json['maidenName'],
        age: json['age'],
        gender: json['gender'],
        email: json['email'],
        phone: json['phone'],
        username: json['username'],
        password: json['password'],
        birthDate: _parseBirthDate(json['birthDate']),
        image: json['image'],
        bloodGroup: json['bloodGroup'],
        height: (json['height'] as num).toDouble(),
        weight: (json['weight'] as num).toDouble(),
        eyeColor: json['eyeColor'],
        hair: Hair.fromJson(json['hair']),
        ip: json['ip'],
        address: Address.fromJson(json['address']),
        macAddress: json['macAddress'],
      university: json['university'],
    );
  }
  

}

DateTime _parseBirthDate(dynamic value) {
  if (value == null) return DateTime.now();
  final text = value.toString().trim();
  final iso = DateTime.tryParse(text);
  if (iso != null) return iso;

  // Fallback for formats like 1996-5-30 or 1996/5/30
  final parts = text.split(RegExp(r'[-/]'));
  if (parts.length >= 3) {
    final y = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1]);
    final d = int.tryParse(parts[2]);
    if (y != null && m != null && d != null) {
      return DateTime(y, m, d);
    }
  }
  return DateTime.now();
}

class Hair{
  String color;
  String type;

  Hair({
    required this.color,
    required this.type,
  });
  factory Hair.fromJson(Map<String, dynamic>json){
    return Hair(
      color: json['color'],
      type: json['type']
    );
  }
}

class Address{
  String address;
  String city;
  String state;
  String stateCode;
  String postalCode;
  Coordinates coordinates;
  String country;
  Address({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });
  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      address: json['address'],
      city: json['city'],
      state: json['state'],
      stateCode: json['stateCode'],
      postalCode: json['postalCode'],
      coordinates: Coordinates.fromJson(json['coordinates']),
      country: json['country'],
    );
  }

}

class Coordinates{
  double lat;
  double lng;
  Coordinates({
    required this.lat,
    required this.lng
  });
  factory Coordinates.fromJson(Map<String, dynamic>json){
    return Coordinates(
      lat: (json['lat'] as num).toDouble(), // vì khi map về nó là dạng chuỗi phải ép kiểu về
      lng: (json['lng'] as num).toDouble()
    );
  }
}
