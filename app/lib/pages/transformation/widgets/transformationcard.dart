import 'dart:io';

import 'package:app/pages/transformation/db/db.dart';
import 'package:app/pages/transformation/model/transformtion.dart';
import 'package:flutter/material.dart';

class TransformationCard extends StatelessWidget {
  const TransformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<List<Transformtion>>(
        valueListenable: transformationImag,
        builder: (context, list, _) {
          int maxWeeks = 100;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: maxWeeks,
            itemBuilder: (context, index) {
              bool hasPhoto = index < list.length;
              bool isCurrentWeek = index == list.length;
              bool isFutureWeek = index > list.length;

              return Container(
                width: 220,
                height: 100,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: isFutureWeek ? Colors.grey[300] : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Week ${index + 1}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    if (hasPhoto)
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(list[index].image),
                              width: 200,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Text("Photo Taken"),
                        ],
                      )
                    else if (isCurrentWeek)
                      Column(
                        children: const [
                          Icon(Icons.camera_alt, size: 40, color: Colors.grey),
                          Text("Loading..\n"),
                        ],
                      )
                    else
                      Column(
                        children: const [
                          Icon(Icons.lock, size: 40, color: Colors.grey),
                          Text("Locked"),
                        ],
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
