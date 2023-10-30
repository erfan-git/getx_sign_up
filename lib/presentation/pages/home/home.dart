import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_up_with_getx/presentation/controllers/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  void _onItemTapped(int index) {
    controller.currentIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      PageOne(
        email: controller.user.email!,
        password: controller.user.password!,
      ),
      const PageTwo(),
    ];

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          leading: const SizedBox(),
          centerTitle: true,
        ),
        body: pages[controller.currentIndex.value],
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            controller.logout();
          },
          label: const Row(
            children: [
              Icon(Icons.logout),
              SizedBox(
                width: 16,
              ),
              Text('Log out'),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Page One',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Page Two',
            ),
          ],
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.amber,
      child: Center(
        child: DefaultTextStyle(
          style: GoogleFonts.poppins(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: const Color(0xff034193),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('${'email'.tr}:  '),
                    Text(email),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text('${'password'.tr}:  '),
                    Text(password),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.lightGreenAccent,
      child: Center(
        child: Text('Page Two', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
