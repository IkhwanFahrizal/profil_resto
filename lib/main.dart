import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profil Resto'),
        ),
        body: Resto(),
      ),
    );
  }
}

class Resto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Rumah Makan Pagi Sore',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Image.asset(
              'assets/pagi_sore.png',
              width: 400,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 18),
            Row(
              children: [
                btnContact(Icons.mark_email_unread_rounded, Colors.blueAccent,
                    () {
                  sendEmail();
                }),
                SizedBox(width: 10),
                btnContact(Icons.gps_fixed_rounded, Colors.greenAccent, () {
                  openMap();
                }),
                SizedBox(width: 10),
                btnContact(Icons.phone_android_rounded, Colors.red, () {
                  openWhatsApp();
                }),
              ],
            ),
            SizedBox(height: 18),
            Text(
              'Deskripsi Resto',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Tradisi dalam menjaga cita rasa yang otentik, tempat yang modern dan nyaman, serta pelayanan yang ramah, adalah semua tentang Pagi Sore Restaurant.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Pagi Sore telah berdiri sejak tahun 1973, dan terus mengembangkan diri untuk memastikan cita rasa dan kualitas terbaik. Kami melakukan banyak perjalanan untuk mempelajari berbagai hal, termasuk mencari bahan baku pilihan. Dan kami bangga menjadi salah satu Restoran Padang terbaik.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'List Menu',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.fiber_manual_record,
                            size: 12,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                menuItems[index]['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Harga: Rp. ${menuItems[index]['price']}',
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                },
              ),
            ),
            Text(
              'Alamat Resto',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Jl. Raya Kalimalang No.1, Pd. Klp., Kec. Duren Sawit, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13450',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Jam Buka :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'SETIAP HARI',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '10:00 AM – 10:00 PM Weekday',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '12:00 AM – 12:00 PM Weekend',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void sendEmail() async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'Pagisore@gmail.com',
      queryParameters: {'subject': 'Tanya Seputar Resto'},
    );
    final String _emailLaunchString = _emailLaunchUri.toString();
    await launch(_emailLaunchString);
  }

  void openMap() async {
    final Uri _mapLaunchUri = Uri(
      scheme: 'geo',
      queryParameters: {
        'q': '-6.982649, 110.409188',
      },
    );
    final String _mapLaunchString = _mapLaunchUri.toString();
    await launch(_mapLaunchString);
  }

  void openWhatsApp() async {
    final Uri _whatsappLaunchUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: '+623456789',
    );
    final String _whatsappLaunchString = _whatsappLaunchUri.toString();
    await launch(_whatsappLaunchString);
  }

  Expanded btnContact(IconData icon, var color, VoidCallback onPressed) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  List<Map<String, dynamic>> menuItems = [
    {'name': 'Sambal Hijau', 'price': 15000},
    {'name': 'Telur Balado', 'price': 25000},
    {'name': 'Ayam Pop', 'price': 40000},
    {'name': 'Gulai', 'price': 30000},
    {'name': 'Rendang', 'price': 35000},
  ];
}
