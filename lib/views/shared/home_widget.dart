import 'package:flutter_project/views/shared/export.dart';

class Shoes extends StatelessWidget {
  const Shoes({
    super.key,
    required Future<List<Sneakers>> male,
    required this.tabIndex,
  }) : _male = male;

  final Future<List<Sneakers>> _male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 328.h,
          child: FutureBuilder(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error ${snapshot.error}');
              } else {
                final male = snapshot.data;
                return ListView.builder(
                  itemCount: male!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        productNotifier.shoesSizes = shoe.sizes;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductPage(
                              category: shoe.category,
                              id: shoe.id,
                            ),
                          ),
                        );
                      },
                      child: ProductCard(
                        name: shoe.name,
                        category: shoe.category,
                        price: shoe.price,
                        id: shoe.id,
                        image: shoe.imageUrl[0],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 20.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ReusableText(
                    text: 'Latest Shoes',
                    style: appStyle(
                      24,
                      Colors.black,
                      FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductByCat(
                            tabIndex: tabIndex,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        ReusableText(
                          text: 'Show All',
                          style: appStyle(
                            22,
                            Colors.black,
                            FontWeight.w500,
                          ),
                        ),
                        const Icon(AntDesign.caretright, size: 20)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 105.h,
          child: FutureBuilder(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error ${snapshot.error}');
              } else {
                final male = snapshot.data;
                return ListView.builder(
                  itemCount: male!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NewShoes(imageUrl: shoe.imageUrl[1]),
                    );
                  },
                );
              }
            },
          ),
        )
      ],
    );
  }
}
