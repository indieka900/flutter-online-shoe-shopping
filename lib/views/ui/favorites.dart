import 'package:flutter_project/views/shared/export.dart';


class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    var favorite = Provider.of<FavoriteNotifier>(context);
    favorite.getAllData();
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/top_image.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'My Favorites',
                  style: appStyle(
                    40,
                    Colors.white,
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: favorite.fav.length,
                padding: const EdgeInsets.only(top: 100),
                itemBuilder: (context, index) {
                  final shoe = favorite.fav[index];
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.118,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.shade500,
                              offset: const Offset(0, 1),
                              blurRadius: 0.3,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: CachedNetworkImage(
                                    imageUrl: shoe['imageUrl'],
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 12,
                                    left: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        shoe['name'],
                                        style: appStyle(
                                          16,
                                          Colors.black,
                                          FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        shoe['category'],
                                        style: appStyle(
                                          14,
                                          Colors.blueGrey,
                                          FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '\$${shoe['price']}',
                                            style: appStyle(
                                              18,
                                              Colors.black,
                                              FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () {
                                  favorite.deleteFav(shoe['key']);
                                  favorite.ids.removeWhere(
                                    (element) => element == shoe['id'],
                                  );
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainScreen(),
                                      ),
                                      (route) => false);
                                },
                                child: const Icon(Ionicons.md_heart_dislike),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
