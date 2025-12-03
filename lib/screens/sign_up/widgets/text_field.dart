import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.type,
  });

  final String hint;
  final String type;
  final ValueChanged<String> onChanged;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      readOnly: widget.hint == "Date of birth" ? true : false,
      onTap: () {
        if (widget.hint == "Date of birth") {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 300,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: (DateTime newDate) {
                    final formatted = DateFormat("MMMM d yyyy").format(newDate);
                    setState(() {
                      _controller.text = formatted;
                      widget.onChanged(formatted);
                    });
                  },
                ),
              );
            },
          );
        }
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.type,
        hintText: widget.hint,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        hintStyle: TextStyle(
          fontSize: Sizes.size16,
          color: Colors.grey.shade600,
        ),
      ),
      cursorColor: Theme.of(context).highlightColor,
    );
  }
}
