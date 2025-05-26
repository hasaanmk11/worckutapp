// lib/user/pages/transformation/widgets/transformationcard.dart
import 'dart:io';
import 'package:app/styles/cmn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../db/db.dart';
import '../model/transformtion.dart';

class TransformationCard extends StatelessWidget {
  const TransformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardColor = const Color.fromARGB(144, 255, 255, 255);
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
                  border: Border.all(color: cardColor),
                  gradient: commenGradient().withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (hasPhoto)
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child:
                                kIsWeb
                                    ? Image.memory(
                                      list[index].imageBytes!,
                                      width: 200,
                                      height: 300,
                                      fit: BoxFit.cover,
                                    )
                                    : Image.file(
                                      File(list[index].image),
                                      width: 200,
                                      height: 300,
                                      fit: BoxFit.cover,
                                    ),
                          ),
                          const Text(
                            "Photo Taken",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    else if (isCurrentWeek)
                      const Column(
                        children: [
                          Icon(Icons.camera_alt, size: 40, color: Colors.grey),
                          Text(
                            "Loading..\n",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    else
                      const Column(
                        children: [
                          Icon(Icons.lock, size: 40, color: Colors.white),
                          Text("Locked", style: TextStyle(color: Colors.white)),
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
