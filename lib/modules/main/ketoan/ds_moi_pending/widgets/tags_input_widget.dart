import 'package:flutter/material.dart';

import '../../../../../packages/textfield_tags/textfield_tags.dart';

class TagsInputWidget extends StatefulWidget {
  const TagsInputWidget(
      {super.key,
      this.initialTags,
      this.onTag,
      this.onDelete,
      this.validator,
      this.errText,
      this.readOnlyTags = false,
      this.textFieldTagsController});

  final TextFieldTagsController? textFieldTagsController;
  final List<String>? initialTags;
  final Function(String)? onTag;
  final Function(String)? onDelete;
  final String? Function(String)? validator;
  final String? errText;
  final bool? readOnlyTags;

  @override
  State<TagsInputWidget> createState() => _TagsInputWidgetState();
}

class _TagsInputWidgetState extends State<TagsInputWidget> {

  @override
  Widget build(BuildContext context) {
    return TextFieldTags(
      textFieldTagsController: widget.textFieldTagsController,
      textSeparators: const [','],
      initialTags: widget.initialTags ?? [],
      onTag: widget.onTag ?? (tag) {},
      onDelete: widget.onDelete ?? (tag) {},
      validator: widget.validator,
      errText: widget.errText,
      readyOnlyTags: widget.readOnlyTags,
      letterCase: LetterCase.none,
      tagsStyler: TagsStyler(
          //styling tag style
          tagTextStyle: const TextStyle(
              fontWeight: FontWeight.normal, color: Colors.white),
          tagDecoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          tagCancelIcon:
              const Icon(Icons.cancel, size: 15.0, color: Colors.white),
          tagPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8)),
      textFieldStyler: TextFieldStyler(
        isDense: false,
        hintText: '',
        helperText: '',
        textFieldFilledColor: Colors.white,
        textFieldFilled: true,
      ),
    );
  }
}
