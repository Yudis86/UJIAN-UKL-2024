import 'package:flutter/material.dart';
import 'package:ujian_ukl/bioskop.dart';
import 'package:ujian_ukl/daftar_akun_page.dart';
import 'package:ujian_ukl/dashboard.dart';
import 'package:ujian_ukl/myticket.dart';
import 'package:ujian_ukl/splash_screen.dart';
import 'package:ujian_ukl/ticket.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/register': (context) => DaftarAkunPage(),
        '/home': (context) => Dashboard(),
        '/cinema': (context) => Bioskop(),
        '/ticket': (context) => Ticket(),
        '/mytickets': (context) => Myticket(),
      },
    );
  }
}
