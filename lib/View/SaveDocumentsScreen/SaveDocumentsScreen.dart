// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../Widgets/CustomAppbar2.dart';
import '../../Widgets/CustomShareDocuments.dart';

class SavedDocumentsScreen extends StatelessWidget {
  const SavedDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Column(
          children: [
             CustomAppBar2(
              titleText: "Saved Documents",
              style: TextStyle(fontSize: 14),
              customWidth: 0.15,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: CustomShareDocuments(
                      title: "Document1",
                      onpress: () {},
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
