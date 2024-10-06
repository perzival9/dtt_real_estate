class House {
  final int id;
  final String image;
  final int price;
  final int bedrooms;
  final int bathrooms;
  final int size;
  final String description;
  final String zip;
  final String city;
  final double? latitude;
  final double? longitude;
  final String createdDate;

  House({
    required this.id,
    required this.image,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.size,
    required this.description,
    required this.zip,
    required this.city,
    this.latitude,
    this.longitude,
    required this.createdDate,
  });

  factory House.fromJson(Map<String, dynamic> json) {
    const String baseUrl = 'https://intern.d-tt.nl';
    return House(
      id: json['id'] as int,
      image: '$baseUrl${json['image']}',
      price: json['price'] as int,
      bedrooms: json['bedrooms'] as int,
      bathrooms: json['bathrooms'] as int,
      size: json['size'] as int,
      description: json['description'] ?? '',
      zip: json['zip'] ?? '',
      city: json['city'] ?? '',
      latitude: json['latitude'] != null
          ? (json['latitude'] as num).toDouble()
          : null,
      longitude: json['longitude'] != null
          ? (json['longitude'] as num).toDouble()
          : null,
      createdDate: json['createdDate'] ?? '',
    );
  }
}
