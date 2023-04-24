import 'package:flutter_project/views/shared/export.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.id, required this.category});

  final String id;
  final String category;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var favorite = Provider.of<FavoriteNotifier>(context, listen: true);
    favorite.getFavorites();

    var product = Provider.of<ProductNotifier>(context);
    product.getShoes(widget.category, widget.id);

    var cart = Provider.of<CartProvider>(context);
    return Scaffold(
      body: FutureBuilder<Sneakers>(
        future: product.sneaker,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          } else {
            final sneaker = snapshot.data;
            return Consumer<ProductNotifier>(
              builder: (context, productNotifier, child) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      leadingWidth: 0,
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                productNotifier.shoeSizes.clear();
                              },
                              child: const Icon(
                                AntDesign.close,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: null,
                              child: const Icon(
                                Ionicons.ellipsis_horizontal,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      pinned: true,
                      snap: false,
                      floating: true,
                      backgroundColor: Colors.transparent,
                      expandedHeight: MediaQuery.of(context).size.height,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            SizedBox(
                              height: 401.h,
                              width: 375.h,
                              child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: sneaker!.imageUrl.length,
                                controller: pageController,
                                onPageChanged: (page) {
                                  productNotifier.activePage = page;
                                },
                                itemBuilder: (context, int index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        height: 316.h,
                                        width: 375.w,
                                        color: Colors.grey.shade300,
                                        child: CachedNetworkImage(
                                          imageUrl: sneaker.imageUrl[index],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Positioned(
                                        top: 81.h,
                                        right: 20.h,
                                        child: Consumer<FavoriteNotifier>(
                                          builder: (context, favorite, child) {
                                            return GestureDetector(
                                              onTap: () {
                                                favorite.ids.contains(widget.id)
                                                    ? Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Favorites(),
                                                        ),
                                                      )
                                                    : favorite.createFav({
                                                        'id': sneaker.id,
                                                        'name': sneaker.name,
                                                        'category':
                                                            sneaker.category,
                                                        'price': sneaker.price,
                                                        'imageUrl':
                                                            sneaker.imageUrl[0],
                                                      });
                                              },
                                              child: favorite.ids.contains(
                                                widget.id,
                                              )
                                                  ? const Icon(
                                                      AntDesign.heart,
                                                    )
                                                  : const Icon(
                                                      AntDesign.hearto,
                                                    ),
                                            );
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        height: 243.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List<Widget>.generate(
                                            sneaker.imageUrl.length,
                                            (index) => Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 4.w,
                                              ),
                                              child: CircleAvatar(
                                                radius: 5,
                                                backgroundColor: productNotifier
                                                            .activepage !=
                                                        index
                                                    ? Colors.blueGrey
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 30.h,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(25),
                                ),
                                child: Container(
                                  height: 512.h,
                                  width: 375.w,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ReusableText(
                                          text: sneaker.name,
                                          style: appStyle(
                                            35,
                                            Colors.black,
                                            FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            ReusableText(
                                              text: sneaker.category,
                                              style: appStyle(
                                                20,
                                                Colors.blueGrey,
                                                FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20.h,
                                            ),
                                            RatingBar.builder(
                                              initialRating: 3.4,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 22,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 1,
                                              ),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                size: 18,
                                                color: Colors.black,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ReusableText(
                                              text: "\$${sneaker.price}",
                                              style: appStyle(26, Colors.black,
                                                  FontWeight.w600),
                                            ),
                                            Row(
                                              children: [
                                                ReusableText(
                                                  text: "Colors",
                                                  style: appStyle(
                                                    18,
                                                    Colors.black,
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                const CircleAvatar(
                                                  radius: 7,
                                                  backgroundColor: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                const CircleAvatar(
                                                  radius: 7,
                                                  backgroundColor: Colors.red,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                ReusableText(
                                                  text: "Select sizes",
                                                  style: appStyle(
                                                    20,
                                                    Colors.black,
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20.w,
                                                ),
                                                ReusableText(
                                                  text: "View size guide",
                                                  style: appStyle(
                                                    20,
                                                    Colors.blueGrey,
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            SizedBox(
                                              height: 30.h,
                                              child: ListView.builder(
                                                itemCount: productNotifier
                                                    .shoeSizes.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                padding: EdgeInsets.zero,
                                                itemBuilder: (context, index) {
                                                  final sizes = productNotifier
                                                      .shoeSizes[index];

                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 8.w,
                                                    ),
                                                    child: ChoiceChip(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(65),
                                                        side: const BorderSide(
                                                          color: Colors.black,
                                                          width: 1,
                                                          style:
                                                              BorderStyle.solid,
                                                        ),
                                                      ),
                                                      disabledColor:
                                                          Colors.white,
                                                      label: ReusableText(
                                                        text: sizes['size'],
                                                        style: appStyle(
                                                            18,
                                                            sizes['isSelected']
                                                                ? Colors.white
                                                                : Colors.black,
                                                            FontWeight.w500),
                                                      ),
                                                      selectedColor:
                                                          Colors.black,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 5,
                                                      ),
                                                      selected:
                                                          sizes['isSelected'],
                                                      onSelected: (newState) {
                                                        if (productNotifier
                                                            .sizes
                                                            .contains(
                                                          sizes['size'],
                                                        )) {
                                                          productNotifier.sizes
                                                              .remove(sizes[
                                                                  'size']);
                                                        } else {
                                                          productNotifier.sizes
                                                              .add(
                                                            sizes['size'],
                                                          );
                                                        }
                                                        productNotifier
                                                            .toggleCheck(index);
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Divider(
                                          indent: 10.w,
                                          endIndent: 1.w,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        SizedBox(
                                          width: 300.h,
                                          child: Text(
                                            sneaker.title,
                                            maxLines: 2,
                                            style: appStyle(24, Colors.black,
                                                FontWeight.w700),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          sneaker.description,
                                          textAlign: TextAlign.justify,
                                          maxLines: 4,
                                          style: appStyle(14, Colors.black,
                                              FontWeight.normal),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: CheckoutButton(
                                              onTap: () async {
                                                cart.createCart({
                                                  "id": sneaker.id,
                                                  "name": sneaker.name,
                                                  "category": sneaker.category,
                                                  "sizes":
                                                      productNotifier.sizes[0],
                                                  "imageUrl":
                                                      sneaker.imageUrl[0],
                                                  "price": sneaker.price,
                                                  "qty": 1
                                                });
                                                productNotifier.sizes.clear();
                                                Navigator.pop(context);
                                              },
                                              label: "Add to Cart",
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
