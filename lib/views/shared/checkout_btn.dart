import 'package:flutter_project/views/shared/export.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
    this.onTap,
    required this.label,
  });
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          height: 50.h,
          width: 355.w,
          child: Center(
            child: ReusableText(
              text: label,
              style: appStyle(20, Colors.white, FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
