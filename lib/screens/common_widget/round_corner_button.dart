import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class RoundCornerButton extends StatelessWidget {
  const RoundCornerButton({
    super.key,
    required this.checked,
    required this.text,
    required this.goto,
  });

  final bool checked;
  final Widget goto;
  final String text;

  void _buttonTap(BuildContext context) {
    if (checked) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => goto));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _buttonTap(context),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: Sizes.size6),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: checked ? Theme.of(context).primaryColor : Colors.grey,
              borderRadius: BorderRadius.circular(Sizes.size28),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gaps.h10,
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                      color: checked ? Colors.white : Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
