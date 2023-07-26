import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

mixin FormUIMixins {
  Widget lableTextForm(String title, {Widget? child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: (child!=null) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          if(child!=null)...[
            child
          ]
        ],
      ),
    );
  }

  Widget titleForm(BuildContext context,
      {required String title, Widget? icon}) {
    final Color primaryColor = Theme.of(context).primaryColor;
    const double iconSize = 18;
    const double textSize = 16;
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          icon ??
              FaIcon(
                FontAwesomeIcons.fileContract,
                color: primaryColor,
                size: iconSize,
              ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title.toUpperCase(),
            style: TextStyle(
                color: primaryColor,
                fontSize: textSize,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget bodyForm({required Widget child, Color? backgroundColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: child,
    );
  }

  Widget inputUploadFile(
    BuildContext context, {
    String? hintText,
    String? initialValue,
        TextEditingController? controller,
    Function(String value)? onChanged,
    required Function() onTap,
    String? Function(String?)? validator,
  }) {
    final Color color = Theme.of(context).primaryColor;
    final OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(color: color),
    );
    return TextFormField(
      controller: controller,
      readOnly: true,
      initialValue: initialValue,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(13.0),
            child: FaIcon(
              FontAwesomeIcons.upload,
              size: 18,
              color: color,
            ),
          ),
          suffixIcon: Container(
            width: 78,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            margin: const EdgeInsets.only(right: 2),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                  child: Text(
                'Chọn File',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )),
            ),
          ),
          hintText: hintText ?? 'Chưa chọn file...',
          hintStyle: const TextStyle(fontSize: 14)),
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}
