import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            TopSection(), // Widget untuk header dan foto profil
            TopContent(), // Widget untuk konten teks di bawah profil
            ProfileListTile(
              icon: Icons.email,
              title: 'Email',
              subtitle: 'fresnelsiregar11@gmail.com',
            ),
            ProfileListTile(
              icon: Icons.person,
              title: 'NRP',
              subtitle: '5026221076',
            ),
            ProfileListTile(
              icon: Icons.phone,
              title: 'Phone Number',
              subtitle: '+62 822 7489 5095',
            ),
            ProfileListTile(
              icon: Icons.question_mark,
              title: 'Funfact',
              subtitle: 'Emulatorku gabisa" mas:"(not fun)',
            ),
            BottomContent(),
          ],
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  final double headerHeight = 160;
  final double profileRadius = 80;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          headerHeight + profileRadius, // Ukuran tinggi untuk header dan profil
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Header(headerHeight: headerHeight),
          ),
          Positioned(
            top: headerHeight - profileRadius - 15,
            child: Profile(profileRadius: profileRadius),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final double headerHeight;

  const Header({required this.headerHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerHeight,
      color: Colors.grey,
      child: Image.asset(
        'assets/background.jpg',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final double profileRadius;

  const Profile({required this.profileRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 5.0,
        ),
      ),
      child: CircleAvatar(
        radius: profileRadius,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(
          'https://media.licdn.com/dms/image/v2/D4E03AQFiUrx84Fnebw/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1681798728193?e=1736985600&v=beta&t=ZDPrFQ6TUnYjRQHL6iYMW5WTsq2iYxxjCBUULdW3NQs',
        ),
      ),
    );
  }
}

class TopContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Fresnel Siregar',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            'Information Systems Student',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileListTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: 350, // Menetapkan lebar sesuai kebutuhan
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color:
              const Color.fromARGB(255, 222, 240, 255), // Warna latar belakang
          borderRadius: BorderRadius.circular(8), // Membuat sudut rounded
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Box untuk Ikon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 24,
                color: Colors.white,
              ),
              alignment: Alignment.center, // Menempatkan ikon di tengah box
            ),
            SizedBox(width: 12), // Jarak antara ikon dan teks
            // Box untuk title dan subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '- Tekber B -',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 171, 171, 171)),
          ),
        ],
      ),
    );
  }
}
