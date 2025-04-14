import 'package:flutter/material.dart';
import 'package:micrm_demo/widgets/filter_sheet.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final int notificationCount;
  final VoidCallback? onMenuPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.notificationCount = 0,
    this.onMenuPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String? selectedSortBy;
  bool? isAscending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  FilterSheet(
                    context,
                    selectedSortBy: selectedSortBy,
                    isAscending: isAscending,
                    onSortByChanged: (value) {
                      setState(() {
                        selectedSortBy = value;
                      });
                    },
                    onOrderChanged: (value) {
                      setState(() {
                        isAscending = value;
                      });
                    },
                  );
                },
              ),
              if (widget.notificationCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      widget.notificationCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.sort_outlined, color: Colors.white),
            onPressed: widget.onMenuPressed,
          ),
        ],
      ),
    );
  }
}
