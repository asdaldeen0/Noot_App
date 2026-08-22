import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // 1. الخلفيات والأسطح
  static const Color background = Color(0xFFF9F6EE); // خلفية الورق الطبيعية
  static const Color cardBg = Color(0xFFFFFFFF); // كرت الملاحظة

  // 2. التحكم والعناصر التفاعلية
  static const Color primary = Color(0xFF1E1E1E); // أسود كربوني
  static const Color accent = Color(
    0xFFE07A5F,
  ); // برتقالي طيني (Terracotta) لزر الإضافة والأكشن
  static const Color iconColor = Color(
    0xFFFFFFFF,
  ); // لون أيقونة زر الإضافة والنصوص داخل الأزرار
  static const Color border = Color(0xFFEDE8DF); // إطار الكروت والفواصل
  static const Color cardShadow = Color(0x0A2B2D42); // ظل ناعم للكروت

  // 3. النصوص
  static const Color textMain = Color(0xFF2B2D42); // نصوص العناوين والتفاصيل
  static const Color textDate = Color(0xFF8D99AE); // التاريخ والنصوص الثانوية
  static const Color error = Color(0xFFF0514C); // لون الخطأ
}
