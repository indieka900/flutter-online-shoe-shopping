import 'package:flutter_project/views/shared/export.dart';

class ProductByCat extends StatefulWidget {
  const ProductByCat({
    super.key,
    required this.tabIndex,
    //required this.tabIndex,
  });

  final int tabIndex;

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat>
    with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 3,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    _tabController.animateTo(widget.tabIndex, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> brand = [
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/jordan.png",
    "assets/images/nike.png",
  ];

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<ProductNotifier>(context);
    product.getFemale();
    product.getKids();
    product.getMale();
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: 812.h,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 45.h, 0, 0),
              height: 325.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/top_image.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(6.w, 12.h, 16.w, 18.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            AntDesign.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: const Icon(
                            FontAwesome.sliders,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: appStyle(24, Colors.white, FontWeight.bold),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    tabs: const [
                      Tab(
                        text: "Men Shoes",
                      ),
                      Tab(
                        text: "Women Shoes",
                      ),
                      Tab(
                        text: "Kids Shoes",
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 142.h,
                left: 16.w,
                right: 12.w,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(controller: _tabController, children: [
                  LatestShoes(male: product.male),
                  LatestShoes(male: product.female),
                  LatestShoes(male: product.kids),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) => Container(
        height: 682.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 5.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black38,
              ),
            ),
            SizedBox(
              height: 568.h,
              child: Column(
                children: [
                  const CustomSpacer(),
                  ReusableText(
                    text: "Filter",
                    style: appStyle(40, Colors.black, FontWeight.bold),
                  ),
                  const CustomSpacer(),
                  ReusableText(
                    text: "Gender",
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      CategoryBtn(
                        label: "Men",
                        buttonClr: Colors.black,
                      ),
                      CategoryBtn(
                        label: "Women",
                        buttonClr: Colors.grey,
                      ),
                      CategoryBtn(
                        label: "Kids",
                        buttonClr: Colors.grey,
                      ),
                    ],
                  ),
                  const CustomSpacer(),
                  ReusableText(
                    text: "Category",
                    style: appStyle(20, Colors.black, FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: const [
                      CategoryBtn(
                        label: "Shoes",
                        buttonClr: Colors.black,
                      ),
                      CategoryBtn(
                        label: "Apparrels",
                        buttonClr: Colors.grey,
                      ),
                      CategoryBtn(
                        label: "Accessories",
                        buttonClr: Colors.grey,
                      ),
                    ],
                  ),
                  const CustomSpacer(),
                  ReusableText(
                    text: "Price",
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  const CustomSpacer(),
                  Slider(
                      value: _value,
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.black,
                      max: 500,
                      divisions: 50,
                      label: _value.toString(),
                      secondaryTrackValue: 200,
                      onChanged: (double value) {}),
                  const CustomSpacer(),
                  ReusableText(
                    text: "Brand",
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 60.h,
                    child: ListView.builder(
                      itemCount: brand.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(
                              brand[index],
                              height: 60.h,
                              width: 80.w,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
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
}
