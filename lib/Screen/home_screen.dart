import 'package:aplikasi_keuangan/models/doctor.dart';
import 'package:aplikasi_keuangan/models/service_model.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

var services = [];
var selectedServices = 0;
var selectedMenu = 0;
var menus = [
  FeatherIcons.home,
  FeatherIcons.heart,
  FeatherIcons.messageCircle,
  FeatherIcons.user
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      bottomNavigationBar: navbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 22.4)),
              _salam(),
              const Padding(padding: EdgeInsets.only(top: 17)),
              card(),
              const Padding(padding: EdgeInsets.only(top: 20)),
              search(),
              const Padding(padding: EdgeInsets.only(top: 20)),
              service(),
              const Padding(padding: EdgeInsets.only(top: 20)),
              card_doctor()
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBar navbar() => BottomNavigationBar(
        selectedItemColor: Color(0xff818AF9),
        items: menus
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e), label: e.toString()))
            .toList(),
        showSelectedLabels: false,
        unselectedItemColor: Color(0xffbfbfbf),
      );

  ListView card_doctor() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => _doctor(doctors[index]),
        separatorBuilder: (context, index) => const SizedBox(
              height: 11,
            ),
        itemCount: doctors.length);
  }

  Container _doctor(doctor doctor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: const Color(0xff35385A).withOpacity(.12),
                blurRadius: 30,
                offset: const Offset(0, 2))
          ],
          borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              "assets/doctor/${doctor.image}",
              height: 103,
              width: 88,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff3f3e3f),
                ),
              ),
              Text(
                "service: ${doctor.services}",
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  color: const Color(0xff3f3e3f),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    FeatherIcons.mapPin,
                    color: Color(0xffACA3A3),
                    size: 14,
                  ),
                  Text(
                    " ${doctor.distance}km",
                    style: GoogleFonts.manrope(
                      color: const Color(0xfffACA3A3),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    doctor.status == 1 ? 'Available for' : 'Not Available',
                    style: GoogleFonts.manrope(
                        color: doctor.status == 1
                            ? const Color(0xff50CC98)
                            : const Color(0xffEF6497),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 80.0), // Jarak antara ikon dan teks
                    child: SvgPicture.asset("assets/svg/cat.svg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0), // Jarak antara ikon kucing dan anjing
                    child: SvgPicture.asset("assets/svg/dog.svg"),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  SizedBox service() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: selectedServices == index
                        ? const Color(0xff818AF9)
                        : const Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  Service.all()[index],
                  style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: selectedServices == index
                          ? Colors.white
                          : const Color(0xff3F3E3F).withOpacity(.3)),
                )),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: Service.all().length),
    );
  }

  Widget search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(14)),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              FeatherIcons.search,
              color: Color(0xffADACAD),
            ),
            hintText: "Find best vaccinate, treatment...",
            hintStyle: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xffCACACA),
                height: 150 / 100)),
      ),
    );
  }

  AspectRatio card() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: const Color(0xff818AF9),
            borderRadius: BorderRadius.circular(14)),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/kucing.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          text: "Your",
                          style: GoogleFonts.manrope(
                              fontSize: 14, color: const Color(0xffDEE1FE)),
                          children: [
                            const TextSpan(
                              text: " catrine",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  height: 150 / 100),
                            ),
                            TextSpan(
                                text: 'will get \nvaccination',
                                style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    color: const Color(0xffDEE1FE)),
                                children: const [
                                  TextSpan(
                                    text: " tomorrow \nat 07.00 am!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ])
                          ])),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  InkWell(
                    onTap: () {
                      // Aksi yang ingin Anda lakukan ketika tombol ditekan
                      // print('Tombol ditekan!');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.4),
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.white.withOpacity(.12)),
                      ),
                      child: Text(
                        'See Details',
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _salam() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello, Human!",
            style: GoogleFonts.manrope(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xff3F3E3F)),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.shoppingBag,
                  color: Color(0xff818AF9),
                ),
              ),
              Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xffEF6497)),
                    child: Center(
                      child: Text(
                        "2",
                        style: GoogleFonts.mPlus1(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
