import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/core/shared/custom_general_button.dart';
import 'package:note_app/core/shared/custom_text_form_field.dart';
import 'package:note_app/model/note_model.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key, required this.onPressed, this.note});

  final Function(String title, String containt) onPressed;
  final NoteModel? note;

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  late final TextEditingController title;
  late final TextEditingController containt;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    title = TextEditingController(text: widget.note?.title ?? "");
    containt = TextEditingController(text: widget.note?.containt ?? "");
  }

  @override
  void dispose() {
    title.dispose();
    containt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.note != null;

    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        decoration: const BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isEdit ? "تعديل الملاحظة" : "ملاحظة جديدة",
                style: const TextStyle(
                  color: AppColors.textMain,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              CustomTextFormField(
                controller: title,
                name: "عنوان الملاحظة",
                lenthtext: true,
              ),
              const SizedBox(height: 14),

              CustomTextFormField(
                controller: containt,
                name: "محتوى الملاحظة",
                istitle: false,
              ),
              const SizedBox(height: 14),

              CustomGeneralButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    widget.onPressed(title.text, containt.text);
                    Navigator.pop(context);
                  }
                },
                name: isEdit ? "تحديث" : "حفظ",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
