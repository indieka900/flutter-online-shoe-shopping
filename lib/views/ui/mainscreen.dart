import 'package:flutter_project/views/shared/export.dart';
import 'package:flutter_project/views/ui/pinPage.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const Favorites(),
    const CartPage(),
    const OtpForm(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: const BottoNavBar(),
        );
      },
    );
  }
}
