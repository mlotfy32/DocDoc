class Getspeclizationres {
  final int id;
  final String name;
  final List<dynamic> doctors;

  Getspeclizationres(
      {required this.id, required this.name, required this.doctors});
  factory Getspeclizationres.fromJson(json) {
    return Getspeclizationres(
      id: json['id'],
      name: json['name'],
      doctors: json['doctors'],
    );
  }
}

class GetDoctors {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final Getspecialization specialization;
  final GetCity city;
  final int appoint_price;
  final String start_time;
  final String end_time;

  GetDoctors(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.photo,
      required this.gender,
      required this.address,
      required this.description,
      required this.degree,
      required this.specialization,
      required this.city,
      required this.appoint_price,
      required this.start_time,
      required this.end_time});
  factory GetDoctors.fromJson(json) {
    return GetDoctors(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      photo: json['photo'],
      gender: json['gender'],
      address: json['address'],
      description: json['description'],
      degree: json['degree'],
      specialization: Getspecialization.fromJson(json['specialization']),
      city: GetCity.fromJson(json['city']),
      appoint_price: json['appoint_price'],
      start_time: json['start_time'],
      end_time: json['end_time'],
    );
  }
}

class Getspecialization {
  final int id;
  final String name;

  Getspecialization({required this.id, required this.name});
  factory Getspecialization.fromJson(json) {
    return Getspecialization(
      id: json['id'],
      name: json['name'],
    );
  }
}

class GetCity {
  final int id;
  final String name;
  final Getgovernrate governrate;

  GetCity({required this.id, required this.name, required this.governrate});
  factory GetCity.fromJson(json) {
    return GetCity(
      id: json['id'],
      name: json['name'],
      governrate: Getgovernrate.fromJson(json['governrate']),
    );
  }
}

class Getgovernrate {
  final int id;
  final String name;

  Getgovernrate({required this.id, required this.name});
  factory Getgovernrate.fromJson(json) {
    return Getgovernrate(
      id: json['id'],
      name: json['name'],
    );
  }
}
