import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/core/shared/CustomTextFormField.dart';
import 'package:note_app/core/shared/buttoms.dart';
import 'package:note_app/model/notemodel.dart';

class AddView extends StatefulWidget {
  const AddView({super.key, required this.onPressed, this.note});

  final Function(String title, String containt) onPressed;
  final Notemodel? note;

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
