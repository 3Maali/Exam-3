import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  TextFieldCustom({
    super.key,
    required this.hint,
    required this.label,
    required this.icon,
    this.isPassword = false,
    this.controller,
    this.onChanged,
  });

  final String hint;
  final String label;
  final IconData icon;
  final bool? isPassword;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool? isEncrypted;

  @override
  void initState() {
    isEncrypted = true;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showHidePassword = IconButton(
        onPressed: () {
          setState(() {
            isEncrypted = !isEncrypted!;
          });
        },
        icon: Icon(
          isEncrypted! ? Icons.visibility : Icons.visibility_off,
          color: Colors.blueAccent,
        ));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscuringCharacter: "*",
          cursorWidth: 5,
          cursorColor: Colors.blueAccent,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30.0, horizontal: 5),
              fillColor: Colors.white30,
              filled: true,
              labelText: widget.label,
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              hintText: widget.hint,
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: Icon(
                widget.icon,
                color: Colors.blueAccent,
                size: 15,
              ),
              suffixIcon: widget.isPassword ?? false ? showHidePassword : null),
          obscureText: widget.isPassword ?? false ? isEncrypted! : false),
    );
  }
}
