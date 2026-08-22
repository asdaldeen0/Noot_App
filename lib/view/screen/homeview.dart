import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/model/notemodel.dart';
import 'package:note_app/view/screen/CustomHomeAppBar.dart';
import 'package:note_app/view/screen/addviwe.dart';
import 'package:note_app/view/widget/CardCustomer.dart';
import 'package:note_app/view/widget/counternote.dart';
import 'package:note_app/view/widget/customSearch.dart';
import 'package:note_app/view/widget/slaidbal.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  List<Notemodel> data = [];

  void addNewNote(String title, String containt) {
    setState(() {
      data.add(
        Notemodel(
          title: title,
          containt: containt,
          date:
              "${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}",
          time: "${DateTime.now().hour}:${DateTime.now().minute}",
        ),
      );
    });
  }

  void deleeNote(Notemodel note) {
    setState(() {
      data.remove(note);
    });
  }

  void updatenote(int index, String newTitle, String newContaint) {
    setState(() {
      data[index] = Notemodel(
        title: newTitle,
        containt: newContaint,
        date: data[index].date,
        time: data[index].time,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: CustomHomeAppBar(
        onSearchPressed: () {
          showSearch(
            context: context,
            delegate: NoteSearchDelegate(notes: data),
          );
        },
      ),
      body: Column(
        children: [
          NoteCounterBadge(count: data.length),
          Expanded(
            child: data.isEmpty
                ? Center(
                    child: Text(
                      "لا توجد ملاحظات بعد، أضف أولى ملاحظاتك",
                      style: TextStyle(
                        color: AppColors.textDate.withValues(alpha: 0.7),
                        fontSize: 14,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final noteItem = data[index];

                      return Slaidbale(
                        key: ValueKey(noteItem),
                        onEdit: (context) {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => AddView(
                              note: noteItem,
                              onPressed: (newTitle, newContaint) {
                                updatenote(index, newTitle, newContaint);
                              },
                            ),
                          );
                        },
                        onDelete: (context) {
                          deleeNote(noteItem);
                        },
                        child: CardCustomer(note: noteItem),
                      );
                    },
                  ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => AddView(
              onPressed: (title, containt) {
                addNewNote(title, containt);
              },
            ),
          );
        },
        backgroundColor: AppColors.accent,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        icon: const Icon(
          Icons.add_rounded,
          color: AppColors.iconColor,
          size: 22,
        ),
        label: const Text(
          "ملاحظة جديدة",
          style: TextStyle(
            color: AppColors.iconColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

