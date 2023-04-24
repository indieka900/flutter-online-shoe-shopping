import 'package:flutter_project/views/shared/export.dart';


class BottoNavBar extends StatelessWidget {
  const BottoNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin:  EdgeInsets.symmetric(horizontal: 10.w),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavItems(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 0;
                  },
                  icon: mainScreenNotifier.pageIndex == 0
                      ? MaterialCommunityIcons.home
                      : MaterialCommunityIcons.home_outline,
                ),
                BottomNavItems(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 1;
                  },
                  icon: mainScreenNotifier.pageIndex == 1
                      ? Ionicons.search
                      : Ionicons.search,
                ),
                BottomNavItems(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 2;
                  },
                  icon: mainScreenNotifier.pageIndex == 2
                      ? Ionicons.heart
                      : Ionicons.heart_outline,
                ),
                BottomNavItems(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 3;
                  },
                  icon: mainScreenNotifier.pageIndex == 3
                      ? Ionicons.cart
                      : Ionicons.cart_outline,
                ),
                BottomNavItems(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 4;
                  },
                  icon: mainScreenNotifier.pageIndex == 4
                      ? Ionicons.person
                      : Ionicons.person_outline,
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
