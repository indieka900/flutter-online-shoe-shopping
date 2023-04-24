import 'package:flutter_project/views/shared/export.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 3,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<ProductNotifier>(context);
    product.getMale();
    product.getFemale();
    product.getKids();

    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: 812.h,
        width: 375.w,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 45.h, 0, 0),
              height: 325.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/top_image.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 8.w, bottom: 20.h),
                width: 375.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ReusableText(
                      text: 'Athletics Shoes',
                      style: appStylewithHT(
                        42,
                        Colors.white,
                        FontWeight.bold,
                        1.2,
                      ),
                    ),
                    ReusableText(
                      text: 'Collection',
                      style: appStylewithHT(
                        42,
                        Colors.white,
                        FontWeight.bold,
                        1.2,
                      ),
                    ),
                    TabBar(
                      padding: EdgeInsets.zero,
                      tabs: const <Widget>[
                        Tab(text: 'Men Shoes'),
                        Tab(text: 'Women Shoes'),
                        Tab(text: 'Kids Shoes'),
                      ],
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      unselectedLabelColor: Colors.blueGrey.withOpacity(0.3),
                      labelStyle: appStyle(24, Colors.white, FontWeight.bold),
                      labelColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 203.h),
              child: Container(
                padding: EdgeInsets.only(left: 13.w),
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Shoes(male: product.male, tabIndex: 0),
                    Shoes(male: product.female, tabIndex: 1),
                    Shoes(male: product.kids, tabIndex: 2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
