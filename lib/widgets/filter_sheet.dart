import 'package:flutter/material.dart';

void FilterSheet(
  BuildContext context, {
  required String? selectedSortBy, // ✅ Có thể là null
  required bool? isAscending, // ✅ Có thể là null
  required Function(String?) onSortByChanged,
  required Function(bool?) onOrderChanged,
}) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return StatefulBuilder(
        builder: (context, setState) {
          final sortOptions = [
            "Created at",
            "Updated at",
            "Open deals",
            "Last contacted",
          ];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Sort by",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          onSortByChanged(null);
                          onOrderChanged(null);
                        });
                      },
                      child: Text("Clear", style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Score group
                ...sortOptions.map(
                  (option) => ListTile(
                    title: Text(option),
                    trailing:
                        selectedSortBy == option
                            ? Icon(Icons.check, color: Colors.blue)
                            : null,
                    onTap: () {
                      setState(() {
                        if (selectedSortBy == option) {
                          onSortByChanged(null); // toggle off
                        } else {
                          onSortByChanged(option);
                        }
                      });
                    },
                  ),
                ),
                Divider(),

                // A-Z group
                ListTile(
                  title: Text("Ascending"),
                  trailing:
                      isAscending == true
                          ? Icon(Icons.check, color: Colors.blue)
                          : null,
                  onTap: () {
                    setState(() {
                      if (isAscending == true) {
                        onOrderChanged(null); // toggle off
                      } else {
                        onOrderChanged(true);
                      }
                    });
                  },
                ),
                ListTile(
                  title: Text("Descending"),
                  trailing:
                      isAscending == false
                          ? Icon(Icons.check, color: Colors.blue)
                          : null,
                  onTap: () {
                    setState(() {
                      if (isAscending == false) {
                        onOrderChanged(null); // toggle off
                      } else {
                        onOrderChanged(false);
                      }
                    });
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
