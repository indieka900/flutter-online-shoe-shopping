import 'package:flutter_project/views/shared/export.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn(
      {super.key, this.onPress, required this.buttonClr, required this.label});
  final void Function()? onPress;
  final Color buttonClr;
  final String label;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Container(
        height: 45.h,
        width: 90.h,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.h,
            color: buttonClr,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: ReusableText(
            text:label,
            style: appStyle(
                label.length >= 10 ? 15 : 18, buttonClr, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
