
class Client{
  final int id;
  final String name;
  final String phoneNumber;
  final String address;
  final String photoUrl;

  Client({this.id, this.name, this.phoneNumber, this.address, this.photoUrl});

  factory Client.fromJson(Map<String, dynamic> json){
    return Client(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      address: json['address'] ?? '',
      photoUrl: json['photo_url'],
    );
  }

}