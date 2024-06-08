import 'package:flutter_project/views/shared/export.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.category,
    required this.price,
    required this.id,
    required this.image,
  });

  final String name, category, price, id, image;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    var favorite = Provider.of<FavoriteNotifier>(context, listen: true);
    favorite.getFavorites();
    bool selected = true;
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 327.h,
          width: 233.w,
          decoration: const BoxDecoration(boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.white,
              spreadRadius: 1,
              blurRadius: 0.6,
              offset: Offset(1, 1),
            )
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 186.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.image),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10.w,
                    top: 10.h,
                    child: Consumer<FavoriteNotifier>(
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () async {
                            value.ids.contains(widget.id)
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Favorites(),
                                    ),
                                  )
                                : await value.createFav({
                                    'id': widget.id,
                                    'name': widget.name,
                                    'category': widget.category,
                                    'price': widget.price,
                                    'imageUrl': widget.image,
                                  });
                          },
                          child: value.ids.contains(widget.id)
                              ? const Icon(MaterialCommunityIcons.heart)
                              : const Icon(
                                  MaterialCommunityIcons.heart_outline),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.name,
                      style: appStylewithHT(
                        30,
                        Colors.black,
                        FontWeight.bold,
                        0.9,
                      ),
                    ),
                    ReusableText(
                      text: widget.category,
                      style: appStylewithHT(
                        18,
                        Colors.blueGrey,
                        FontWeight.bold,
                        1.3,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ReusableText(
                      text: 'KSH${widget.price}',
                      style: appStyle(20, Colors.black, FontWeight.w600),
                    ),
                    Row(
                      children: <Widget>[
                        ReusableText(
                          text: 'Colors',
                          style: appStyle(
                            15,
                            Colors.blueGrey,
                            FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 5.1,
                        ),
                        // ChoiceChip(
                        //   label: const Text(''),
                        //   selected: selected,
                        //   visualDensity: VisualDensity.compact,
                        //   selectedColor: Colors.black,
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
