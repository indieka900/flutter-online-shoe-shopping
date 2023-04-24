import 'package:flutter_project/views/shared/export.dart';


class NewShoes extends StatelessWidget {
  const NewShoes({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
            blurRadius: 0.8,
            offset: Offset(0, 1),
          ),
        ],
      ),
      height: 243.h,
      width: 109.h,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
      ),
    );
  }
}
