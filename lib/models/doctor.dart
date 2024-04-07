import 'package:aplikasi_keuangan/models/service_model.dart';

class doctor {
  String name;
  String image;
  List<String> services;
  int distance;
  int status;

  doctor(
      {required this.name,
      required this.image,
      required this.services,
      required this.distance,
      required this.status});
}

var doctors = [
  doctor(
    name: "Dr Kakek",
    image: '2.jpg',
    services: [Service.vaccine, Service.surgery],
    distance: 10,
    status: 1,
  ),
  doctor(
      name: "Dr Gilang",
      image: '1.jpg',
      services: [Service.spa, Service.vaccine],
      distance: 2,
      status: 0),
  doctor(
      name: "Dr Lang",
      image: '1.jpg',
      services: [Service.spa, Service.vaccine],
      distance: 2,
      status: 1),
  // doctor(
  //     name: "Dr Stone",
  //     image: '2.jpg',
  //     services: [Service.spa, Service.vaccine],
  //     distance: 2),
];
